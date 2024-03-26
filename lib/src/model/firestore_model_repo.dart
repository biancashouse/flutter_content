import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';

import 'model_repo.dart';

class FireStoreModelRepository implements IModelRepository {
  Future<FirebaseApp> initFireStore(
          {String? name, FirebaseOptions? options}) async =>
      await Firebase.initializeApp(options: options);

  @override
  Future<void> createOrUpdateAppInfoAndCAPIModel({
    required AppModel appInfo,
    required CAPIModel model,
  }) async {
    DateTime dttNow = DateTime.now();
    int now = dttNow.millisecondsSinceEpoch;
    String encodedModelJson = jsonEncode(model.toJson());
    CollectionReference appsRef =
        FirebaseFirestore.instance.collection('/flutter-content-models');
    DocumentReference appDocRef = appsRef.doc(model.appName);
    // create an undo for this version
    Map<BranchName, BranchModel> branches = appInfo.branches;
    late BranchModel branch;
    if (!branches.containsKey(appInfo.currentBranchName)) {
      branch = BranchModel(name: appInfo.currentBranchName);
      appInfo.branches = {appInfo.currentBranchName: branch}..addAll(branches);
      branch.undos = [now];
    } else {
      branch = appInfo.branches[appInfo.currentBranchName]!;
      branch.undos = [now, ...branch.undos];
    }
    await appDocRef.set(
      {
        "last-saved-doc-size": encodedModelJson.length < 1024
            ? "${encodedModelJson.length} bytes"
            : "${(encodedModelJson.length / 1024).toStringAsFixed(2)} Kb",
        "appInfo": appInfo.toJson(),
      },
    );
    CollectionReference branchesRef = appDocRef.collection('branches');
    DocumentReference branchDocRef = branchesRef.doc(appInfo.currentBranchName);
    CollectionReference branchVersionsRef = branchDocRef.collection('versions');
    DocumentReference newVersionDocRef = branchVersionsRef.doc("$now");
    await newVersionDocRef.set({
      "encodedModelJson": encodedModelJson,
    });
  }

  @override
  Future<AppModel?> getAppInfo({required String appName}) async {
    DocumentReference appDocRef =
        FirebaseFirestore.instance.doc('/flutter-content-models/$appName');
    DocumentSnapshot snap = await appDocRef.get();
    if (snap.exists) {
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      return AppModel.fromJson(data["appInfo"]);
    }
    return null;
  }

  @override
  Future<CAPIModel?> getCAPIModel({
    required String appName,
    required BranchName branchName,
    required VersionId modelVersion,
  }) async {
    DocumentReference appDocRef =
        FirebaseFirestore.instance.doc('/flutter-content-models/$appName');
    CollectionReference branchesRef = appDocRef.collection('branches');
    DocumentReference branchDocRef = branchesRef.doc(branchName);
    CollectionReference branchVersionsRef = branchDocRef.collection('versions');
    DocumentReference versionDocRef = branchVersionsRef.doc("$modelVersion");
    var snap = await versionDocRef.get();
    if (snap.exists) {
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      EncodedModelJson? encodedModelJson;
      CAPIModel? model;
      try {
        encodedModelJson = data["encodedModelJson"];
        if (encodedModelJson != null) {
          Map<String, dynamic> decoded = jsonDecode(encodedModelJson);
          model = CAPIModel.fromJson(decoded);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      return model;
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
    required String appName,
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
    //       FirebaseFirestore.instance.collection('/flutter-content-models/$appName/polls/$pollName/options/$pollOptionId/voters');
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
    required String appName,
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  }) async {
    Map<PollOptionId, List<EmailAddress>> optionVotersMap = {};

    for (PollOptionId pollOptionId in pollOptionIds) {
      // each document in the voter collection represents a user who voted. The doc cannot be empty, so its id is the EmailAddress a property is time of vote.
      CollectionReference pollOptionVotes = FirebaseFirestore.instance.collection(
          '/flutter-content-models/$appName/polls/$pollName/options/$pollOptionId/voters');
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

  Future<FSFolderNode> createAndPopulateFolderNode({
      required Reference ref, FSFolderNode? parentNode}) async {
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
}
