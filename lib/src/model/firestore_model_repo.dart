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
  // if not in cache, gets from FB and adds to cache
  Future<void> getSnippetFromCacheOrFB(
      {required SnippetName snippetName, required VersionId versionId}) async {
    // try to fetch from cache, otherwise fetch from FB
    var versions = FC().snippetCache[snippetName];
    var version = (versions ?? {})[versionId];
    if (version != null) return;

    DocumentReference versionedSnippetDocRef =
        appDocRef.collection('snippets/$snippetName/versions').doc(versionId);
    DocumentSnapshot doc = await versionedSnippetDocRef.get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      SnippetRootNode snippet = SnippetRootNodeMapper.fromMap(data);
      // cache it
      FC().snippetCache[snippetName] ??= {};
      FC().snippetCache[snippetName]!.addAll({versionId: snippet});
    } else {
      debugPrint("getSnippet failed.");
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

    return null;
  }

  @override
  Future<void> saveAppInfo() async {
    var map = FC().appInfoAsMap;
    await appDocRef.set(
      map,
    );
  }

  /// createOrUpdateAppModelAndCAPIModel
  @override
  Future<VersionId?> saveSnippet({
    required SnippetRootNode snippetRootNode,
    required VersionId newVersionId,
  }) async {
    var fc = FC();
    // snippet saved under new versionId, and editingSnippet now set to this new version
    FC().addVersionId(snippetRootNode.name, newVersionId);
    // var newAppInfo = FC().appInfo;
    // newAppInfo.versionIds[snippetName]?.insert(0, newVersionId);
    // newAppInfo.editingVersionIds.addAll({snippetName: newVersionId});
    // FC().appInfo = newAppInfo;

    // now create the actual version doc
    DocumentReference newVersionedSnippetDocRef = appDocRef
        .collection('snippets/${snippetRootNode.name}/versions')
        .doc(newVersionId);
    var map = snippetRootNode.toMap();
    await newVersionedSnippetDocRef.set(map);

    await saveAppInfo();

    return newVersionId;
  }

  @override
  Future<void> publishSnippet(
      {required SnippetName snippetName, required VersionId versionId}) async {
    FC().publishedVersionIds[snippetName] = versionId;

    List<VersionId> newVersionIds = [];
    // modify the versionIds to show published versions with ' <-' appended
    if (FC().versionIds.containsKey(snippetName)) {
      for (VersionId v in FC().versionIds[snippetName]! /*.sublist(0, 10)*/) {
        VersionId versionId =
            (v == FC().publishedVersionIds[snippetName]) ? '$v <-' : v;
        newVersionIds.add(versionId);
      }
      FC().versionIds[snippetName] = newVersionIds;

      await appDocRef.set(
        FC().appInfoAsMap,
      );
    }
  }

  @override
  Future<void> revertSnippet(
      {required SnippetName snippetName,
      required VersionId toVersionId}) async {
    FC().editingVersionIds[snippetName] = toVersionId;
    await appDocRef.set(
      FC().appInfoAsMap,
    );
  }

  // @override
  // Future<SnippetRootNode?> getVersionedSnippet(
  //     {required SnippetName snippetName, required VersionId versionId}) async {
  //   CollectionReference versionsRef =
  //       appDocRef.collection('snippets/$snippetName');
  //   DocumentReference versionedSnippetDocRef = versionsRef.doc(versionId);
  //   var snap = await versionedSnippetDocRef.get();
  //   if (snap.exists) {
  //     Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
  //     return SnippetRootNodeMapper.fromMap(data);
  //   }
  //   return null;
  // }

  @override

  /// returns a Record containing: totalVotes for each Option, optionUserVotedFor (or null if not voted yet)
  /// Does 2 firestore reads:
  /// 1. poll record in the /polls collection, which could have a vote count for each option (map)
  /// 2. user's entry in /polls/{pollId}/voters collection, which would have a timestamp and which option was voted for
  Future<OptionCountsAndVoterRecord> getPollResultsForUser({
    required VoterId voterId,
    required String pollName,
  }) async {
    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.doc('/polls/$pollName').get();
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
            debugPrint(
                "Warning: Value for key '$key' cannot be converted to int.");
          }
        } else if (value is double) {
          optionCountsMap[key] = value.toInt();
        } else {
          // Handle the case where the value is of an unsupported type
          debugPrint("Warning: Value for key '$key' is of unsupported type.");
        }
      });
      // get user's vote (if exists)
      DocumentSnapshot voterSnap = await FirebaseFirestore.instance
          .doc('/polls/$pollName/voters/$voterId')
          .get();
      if (voterSnap.exists) {
        Map<String, dynamic> voterData =
            voterSnap.data() as Map<String, dynamic>;
        Timestamp when = voterData['when'];
        PollOptionId votedFor = voterData['option-id'];
        return (
          optionVoteCountMap: optionCountsMap,
          userVotedForOptionId: votedFor,
          when: when.millisecondsSinceEpoch
        );
      }
      return (
        optionVoteCountMap: optionCountsMap,
        userVotedForOptionId: null,
        when: null
      );
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
      CollectionReference pollOptionVotes = FirebaseFirestore.instance.collection(
          '/flutter-content-apps/$modelName/polls/$pollName/options/$pollOptionId/voters');
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
      {required String pollName,
      required VoterId voterId,
      required PollOptionId optionId,
      required Map<PollOptionId, int> newOptionVoteCountMap}) async {
    // check whether already voted
    DocumentReference userVoteDocRef =
        FirebaseFirestore.instance.doc('/polls/$pollName/voters/$voterId');
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
      await FirebaseFirestore.instance
          .doc('/polls/$pollName')
          .set({"option-vote-counts": newOptionVoteCountMap});
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
  Future<FSFolderNode> createAndPopulateFolderNode(
      {required Reference ref, FSFolderNode? parentNode}) async {
    FSFolderNode result = FSFolderNode(ref: ref, children: []);
    if (parentNode != null) {
      result.setParent(parentNode);
    }
    ListResult lr = await ref.listAll();
    for (Reference childFolderRef in lr.prefixes) {
      result.children.add(
        await createAndPopulateFolderNode(
            ref: childFolderRef, parentNode: result),
      );
    }
    return result;
  }

  DocumentReference get appDocRef => FirebaseFirestore.instance
      .collection('/flutter-content-apps')
      .doc(FC().appName);
}
