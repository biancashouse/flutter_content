import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';

import 'model_repo.dart';

late FirebaseApp fbApp;
late FirebaseStorage fbStorage;

class FireStoreModelRepository implements IModelRepository {
  final FirebaseOptions? fbOptions;

  FireStoreModelRepository(this.fbOptions);

  Future<FirebaseApp> possiblyInitFireStoreRelatedAPIs() async {
    fbApp = await Firebase.initializeApp(options: fbOptions);
    // emulator if in non-prod mode
    if (kDebugMode) {
      FirebaseFirestore.instance.settings = Settings(
        host: '${Useful.isAndroid ? "10.0.2.2" : "localhost"}:8080',
        sslEnabled: false,
        persistenceEnabled: false,
      );
    }
    // firebase storage

    fbStorage = FirebaseStorage.instance;
    final config = FirebaseUIStorageConfiguration(
      storage: fbStorage,
    );
    await FirebaseUIStorage.configure(config);
    return fbApp;
  }

  // Future<SnippetVersions?> fetchAllSnippetVersionsFromFB(
  //     SnippetName snippetName, List<VersionId> versionIds) async {
  //   appDocRef
  //       .collection('snippets/$snippetName')
  //       /*.where("capital", isEqualTo: true)*/ .get()
  //       .then(
  //     (querySnapshot) {
  //       print("Successfully completed");
  //       for (var docSnapshot in querySnapshot.docs) {
  //         print('${docSnapshot.id} => ${docSnapshot.data()}');
  //         Map<String, dynamic> data =
  //             docSnapshot.data() as Map<String, dynamic>;
  //         return SnippetRootNodeMapper.fromMap(data);
  //       }
  //     },
  //     onError: (e) => print("Error completing: $e"),
  //   );
  //   DocumentReference versionedSnippetDocRef = versionsRef.doc(versionId);
  //   var snap = await versionedSnippetDocRef.get();
  //   if (snap.exists) {
  //     Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
  //     return SnippetRootNodeMapper.fromMap(data);
  //   }
  //   return null;
  // }
  @override
  Future<SnippetInfoModel?> getSnippetInfoFromCacheOrFB({required SnippetName snippetName}) async {
    // may be already in cache
    SnippetInfoModel? snippetInfo = FC().snippetInfoCache[snippetName];
    if (snippetInfo != null) {
    // if (FC().currentSnippet(snippetName) != null) {
      return snippetInfo;
    }

    debugPrint('--- LOADING SNIPPET INFO FROM FB ----------');
    debugPrint('--- snippet ($snippetName)  ---------------');
    debugPrint('-------------------------------------------');

    DocumentReference snippetInfoDocRef = appDocRef.collection('snippets').doc(snippetName);
    DocumentSnapshot snippetInfoDoc = await snippetInfoDocRef.get();
    if (snippetInfoDoc.exists) {
      final data = snippetInfoDoc.data() as Map<String, dynamic>;
      snippetInfo = SnippetInfoModelMapper.fromMap(data);
      // set or update cache
      FC().snippetInfoCache[snippetName] = snippetInfo;
      // populate snippetInfo with its version ids
      try {
        final versionsSnapshot = await snippetInfoDocRef.collection('versions').get();
        final versionIds = versionsSnapshot.docs.map((doc) => doc.id).toList();
        FC().versionIdCache[snippetName] ??= [];
        FC().versionIdCache[snippetName]?.addAll(versionIds);
      } catch (e) {
        // Handle errors
        print(e.toString());
      }
    }
    return snippetInfo;
  }

  @override
  // if not in cache, gets from FB and adds to cache
  Future<void> possiblyLoadSnippetIntoCache({required SnippetName snippetName, required VersionId versionId}) async {

    // try to fetch the specified version from cache, otherwise try to fetch from FB
    var snippetInfo = FC().snippetInfoCache[snippetName];
    var version = FC().versionCache[snippetName]?[versionId];

    if (version != null) {
      // ALREADY IN CACHE
      debugPrint('--- snippet ($snippetName) version $versionId ---------------');
      debugPrint('--- Already in Cache. -------------------------------------');
      return;
    }

    debugPrint('--- LOADING SNIPPET INTO CACHE ------------------------------');
    debugPrint('--- snippet ($snippetName) version $versionId ---------------');
    debugPrint('-------------------------------------------------------------');

    // read snippet properties (saving then restoring the transient props)
    DocumentReference snippetInfoDocRef = appDocRef.collection('snippets').doc(snippetName);
    DocumentSnapshot snippetInfoDoc = await snippetInfoDocRef.get();
    if (snippetInfoDoc.exists) {
      final data = snippetInfoDoc.data() as Map<String, dynamic>;
      snippetInfo = SnippetInfoModelMapper.fromMap(data);
      // set or update cache
      FC().snippetInfoCache[snippetName] = snippetInfo;
      // read version
      DocumentReference versionDocRef = snippetInfoDocRef.collection('versions').doc(versionId);
      DocumentSnapshot versionDoc = await versionDocRef.get();
      if (versionDoc.exists) {
        final data = versionDoc.data() as Map<String, dynamic>;
        version = SnippetRootNodeMapper.fromMap(data);
        // cache it
        FC().versionCache[snippetName] ??= {};
        FC().versionIdCache[snippetName] ??= [];
        FC().versionCache[snippetName]?.addAll({versionId: version});
        FC().versionIdCache[snippetName]?.add(versionId);
        debugPrint('editing: ${snippetInfo.editingVersionId}');
        debugPrint('published: ${snippetInfo.publishedVersionId}');
        debugPrint('versionId: $versionId');
        debugPrint('--- LOADED ----------------------------------------------');
      }
    }
  }

  @override
  Future<AppInfoModel?> getAppInfo() async {
    DocumentSnapshot doc = await appDocRef.get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      return AppInfoModelMapper.fromMap(data);
    } else {
      debugPrint("getAppInfo doc does not exist.");
      return AppInfoModel();
    }
  }

  @override
  Future<void> saveAppInfo() async {
    var map = FC().appInfoAsMap;
    await appDocRef.set(
      map,
    );
  }

  /// createOrUpdateAppModelAndCAPIModel
  /// Add the snippet's versions collection and update the snippet's properties
  @override
  Future<VersionId?> saveLatestSnippetVersion({
    required SnippetName snippetName,
  }) async {
    var fc = FC();

    var snippetInfo = FC().snippetInfoCache[snippetName];
    var latestVersionId = FC().versionIdCache[snippetName]?.lastOrNull;
    var latestVersion = FC().versionCache[snippetName]?[latestVersionId];

    if (latestVersion == null) return null;

    // set the snippet properties
    DocumentReference snippetInfoDocRef = appDocRef.collection('snippets').doc(snippetName);
    await snippetInfoDocRef.set(snippetInfo!.toMap());
    // now create the actual version doc
    await snippetInfoDocRef.collection('versions').doc(latestVersionId).set(latestVersion.toMap());

    // // also add versionId to appInfo
    // FC().appInfo.versions[snippetName]!.insert(0, latestVersionId!);
    await saveAppInfo();

    debugPrint('--- SAVED ---------------------------------------------------');
    debugPrint('wrote latest snippet ($snippetName) version to FB:');
    debugPrint('editing: ${snippetInfo!.editingVersionId}');
    debugPrint('published: ${snippetInfo.publishedVersionId}');
    debugPrint('autoPublish: ${snippetInfo.autoPublish}');
    debugPrint('versionId: $latestVersionId');
    // debugPrint('prepended versionId: $latestVersionId to AppInfo');
    debugPrint('-------------------------------------------------------------');
    return latestVersionId;
  }

  @override
  Future<void> updateSnippetProps({
    required SnippetName snippetName,
    VersionId? editingVersionId,
    VersionId? publishingVersionId,
    bool? autoPublish,
  }) async {
    var fc = FC();

    var snippet = FC().snippetInfoCache[snippetName];
    if (snippet == null) return;
    // set the snippet properties
    DocumentReference snippetDocRef = appDocRef.collection('snippets').doc(snippetName);
    await snippetDocRef.set({
      'editingVersionId': editingVersionId ?? snippet!.editingVersionId,
      'publishedVersionId': publishingVersionId ?? snippet!.publishedVersionId,
      'autoPublish': autoPublish ?? snippet!.autoPublish,
    }, SetOptions(merge: true));

    debugPrint('--- UPDATED SNIPPET PROPERTIES ------------------------------');
    debugPrint('wrote snippet ($snippetName) properties to FB:');
    debugPrint('editing: ${snippet!.editingVersionId}');
    debugPrint('published: ${snippet.publishedVersionId}');
    debugPrint('autoPublish: ${snippet.autoPublish}');
    debugPrint('-------------------------------------------------------------');
  }

  @override

  /// returns a Record containing: totalVotes for each Option, optionUserVotedFor (or null if not voted yet)
  /// Does 2 firestore reads:
  /// 1. poll record in the /polls collection, which could have a vote count for each option (map)
  /// 2. user's entry in /polls/{pollId}/voters collection, which would have a timestamp and which option was voted for
  Future<OptionCountsAndVoterRecord> getPollResultsForUser({
    required VoterId voterId,
    required String pollName,
  }) async {
    DocumentSnapshot docSnap = await FirebaseFirestore.instance.doc('/polls/$pollName').get();
    if (docSnap.exists) {
      Map<String, dynamic> pollData = docSnap.data() as Map<String, dynamic>;
      // convert map to <String,int>
      Map<PollOptionId, int> optionCountsMap = {};
      pollData['option-vote-counts'].forEach((key, value) {
        if (value is int) {
          optionCountsMap[key] = value;
        } else if (value is String) {
          int? intValue = int.tryParse(value);
          if (intValue != null) {
            optionCountsMap[key] = intValue;
          } else {
            // Handle the case where the value cannot be converted to int
            debugPrint("Warning: Value for key '$key' cannot be converted to int.");
          }
        } else if (value is double) {
          optionCountsMap[key] = value.toInt();
        } else {
          // Handle the case where the value is of an unsupported type
          debugPrint("Warning: Value for key '$key' is of unsupported type.");
        }
      });
      // get user's vote (if exists)
      DocumentSnapshot voterSnap = await FirebaseFirestore.instance.doc('/polls/$pollName/voters/$voterId').get();
      if (voterSnap.exists) {
        Map<String, dynamic> voterData = voterSnap.data() as Map<String, dynamic>;
        Timestamp when = voterData['when'];
        PollOptionId votedFor = voterData['option-id'];
        return (optionVoteCountMap: optionCountsMap, userVotedForOptionId: votedFor, when: when.millisecondsSinceEpoch);
      }
      return (optionVoteCountMap: optionCountsMap, userVotedForOptionId: null, when: null);
    }
    return (optionVoteCountMap: null, userVotedForOptionId: null, when: null);
    //
    // int pollVoteCount = 0;
    // Map<PollOptionId, int> optionVoteCountMap = {};
    // PollOptionId? userVotedForOption;
    //
    // for (PollOptionId pollOptionId in pollOptionIds) {
    //   // each document in the voter collection represents a user who voted. The doc cannot be empty, so its id is the EmailAddress a property is time of vote.
    //   CollectionReference pollOptionVotes =
    //       FirebaseFirestore.instance.collection('/flutter-content-apps/$appName/polls/$pollName/options/$pollOptionId/voters');
    //   var optionVoteCountSnap = await pollOptionVotes.count().get();
    //   int optionVoteCount = optionVoteCountSnap.count;
    //   optionVoteCountMap[pollOptionId] = optionVoteCount;
    //   pollVoteCount += optionVoteCount;
    //   // check for presence of this user in this options voters collection
    //   DocumentReference voterDocRef = pollOptionVotes.doc(voterId);
    //   DocumentSnapshot snap = await voterDocRef.get();
    //   if (snap.exists) {
    //     Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    //     debugPrint("user voted ${data['when']}");
    //     userVotedForOption = pollOptionId;
    //   }
    // }
    //
    // OptionCountsAndVoterRecord result = (
    //   voterId: voterId,
    //   pollVoteCount: pollVoteCount,
    //   optionVoteCountMap: optionVoteCountMap,
    //   userVotedForOptionId: userVotedForOption,
    // );
    //
    // return result;
  }

  @override
  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({
    required String modelName,
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  }) async {
    Map<PollOptionId, List<EmailAddress>> optionVotersMap = {};

    for (PollOptionId pollOptionId in pollOptionIds) {
      // each document in the voter collection represents a user who voted. The doc cannot be empty, so its id is the EmailAddress a property is time of vote.
      CollectionReference pollOptionVotes =
          FirebaseFirestore.instance.collection('/flutter-content-apps/$modelName/polls/$pollName/options/$pollOptionId/voters');
      QuerySnapshot snap = await pollOptionVotes.get();
      List<EmailAddress> optionVoters = [];
      for (var doc in snap.docs) {
        // Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        optionVoters.add(doc.id);
      }
      optionVotersMap[pollOptionId] = optionVoters;
    }
    return optionVotersMap;
  }

  @override
  Future<void> saveVote(
      {required String pollName, required VoterId voterId, required PollOptionId optionId, required Map<PollOptionId, int> newOptionVoteCountMap}) async {
    // check whether already voted
    DocumentReference userVoteDocRef = FirebaseFirestore.instance.doc('/polls/$pollName/voters/$voterId');
    DocumentSnapshot snap = await userVoteDocRef.get();
    if (!snap.exists) {
      // write the user's vote
      await userVoteDocRef.set(
        {
          "when": Timestamp.now(),
          "option-id": optionId,
        },
      );
      // update the poll's record
      await FirebaseFirestore.instance.doc('/polls/$pollName').set({"option-vote-counts": newOptionVoteCountMap});
    } else {
      Map<String, dynamic> voterData = snap.data() as Map<String, dynamic>;
      Timestamp when = voterData['when'];
      PollOptionId votedFor = voterData['option-id'];
      debugPrint('already voted for option $votedFor,  $when');
    }
  }

// @override
// Future<FSFolderNode> createAndPopulateRootFSStorageNode() async {
//   var rootRef = fbStorage.ref(); // .child("/");
//   return await createAndPopulateFolderNode(ref: rootRef);
// }

  @override
  Future<FSFolderNode> createAndPopulateFolderNode({required Reference ref, FSFolderNode? parentNode}) async {
    FSFolderNode result = FSFolderNode(ref: ref, children: []);
    if (parentNode != null) {
      result.setParent(parentNode);
    }
    ListResult lr = await ref.listAll();
    for (Reference childFolderRef in lr.prefixes) {
      result.children.add(
        await createAndPopulateFolderNode(ref: childFolderRef, parentNode: result),
      );
    }
    return result;
  }

  DocumentReference get appDocRef => FirebaseFirestore.instance.collection('/flutter-content-apps').doc(FC().appName);
}
