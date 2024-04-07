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

  /// createOrUpdateAppModelAndCAPIModel
  @override
  Future<void> save({
    required AppInfoModel appInfo,
    required SnippetMap snippets,
  }) async {
    VersionId newVersionId = DateTime.now().millisecondsSinceEpoch.toString();

    var currList = List<VersionId>.of(FC().appInfo.versionIds);
    var newAppInfo = FC().appInfo;
    newAppInfo.versionIds = currList..insert(0, newVersionId);
    newAppInfo.editingVersionId = newVersionId;
    var map = newAppInfo.toMap();
    await appDocRef.set(
      newAppInfo.toMap(),
    );
    // now create the actual version doc
    CollectionReference versionsRef = appDocRef.collection('versions');
    DocumentReference newVersionDocRef = versionsRef.doc(newVersionId);
    await newVersionDocRef.set(FC().snippetsModel.toMap());
  }

  @override
  Future<void> publish({required VersionId versionId}) async {
    FC().appInfo.publishedVersionId = versionId;

    // modify the versionIds to show published versions with ' <-' appended
    List<VersionId> newVersionIds = [];
    for (VersionId v in FC().appInfo.versionIds/*.sublist(0, 10)*/) {
      VersionId versionId = (v == FC().appInfo.publishedVersionId)
          ? '$v <-'
          : v;
      newVersionIds.add(versionId);
    }
    FC().appInfo.versionIds = newVersionIds;

      await appDocRef.set(
      FC().appInfo.toMap(),
    );
  }

  @override
  Future<void> revert({required VersionId versionId}) async {
    FC().appInfo.editingVersionId = versionId;
    await appDocRef.set(
      FC().appInfo.toMap(),
    );
  }

  @override
  Future<AppInfoModel?> getAppInfo() async {
    DocumentSnapshot snap = await appDocRef.get();
    if (snap.exists) {
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      // var appInfo = data["appInfo"];
      var appInfo = AppInfoModelMapper.fromMap(data);
      return appInfo;
    } else {
      // initialise model in firestore
    }
    return null;
  }

  @override
  Future<SnippetMapModel?> getVersionedSnippetMap(
      {required VersionId versionId}) async {
    CollectionReference versionsRef = appDocRef.collection('versions');
    DocumentReference versionDocRef = versionsRef.doc(versionId);
    var snap = await versionDocRef.get();
    if (snap.exists) {
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      return SnippetMapModelMapper.fromMap(data);
    }
    return null;
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
