import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';

import 'model_repo.dart';

late FirebaseApp fbApp;
late FirebaseStorage fbStorage;

class FireStoreModelRepository implements IModelRepository {
  final FirebaseOptions? fbOptions;

  FireStoreModelRepository(this.fbOptions);

  Future<FirebaseApp> possiblyInitFireStoreRelatedAPIs(
      {bool useEmulator = false}) async {
    fco.logi(
        'possiblyInitFireStoreRelatedAPIs start. ${fco.stopwatch.elapsedMilliseconds}');
    try {
      fco.logi('init FB... ${fco.stopwatch.elapsedMilliseconds}');
      fbApp = await Firebase.initializeApp(options: fbOptions);
      fco.logi('init FB done. ${fco.stopwatch.elapsedMilliseconds}');
      // emulator if in non-prod mode
      if (useEmulator) {
        FirebaseFirestore.instance.settings = Settings(
          host: '${fco.isAndroid ? "10.0.2.2" : "localhost"}:8080',
          sslEnabled: false,
          persistenceEnabled: false,
        );
      }
    } catch (e) {
      fco.loge(e.toString());
    }

    // firebase storage

    fbStorage = FirebaseStorage.instance;
    final config = FirebaseUIStorageConfiguration(
      storage: fbStorage,
    );
    await FirebaseUIStorage.configure(config);
    fco.logi(
        'possiblyInitFireStoreRelatedAPIs end. ${fco.stopwatch.elapsedMilliseconds}');
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
  Future<SnippetInfoModel?> getSnippetInfoFromCacheOrFB(
      {required SnippetName snippetName}) async {
    // may be already in cache
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippet(snippetName);
    if (snippetInfo != null) {
      // if (FCO.currentSnippet(snippetName) != null) {
      return snippetInfo;
    }

    fco.logi('--- LOADING SNIPPET INFO FROM FB ----------');
    fco.logi('--- snippet ($snippetName)  ---------------');
    fco.logi('-------------------------------------------');

    fco.snippetsBeingReadFromFB.add(snippetName);

    DocumentReference snippetInfoDocRef =
        appDocRef.collection('snippets').doc(snippetName);
    DocumentSnapshot snippetInfoDoc = await snippetInfoDocRef.get();
    if (snippetInfoDoc.exists) {
      try {
        final data = snippetInfoDoc.data() as Map<String, dynamic>;
        snippetInfo = SnippetInfoModelMapper.fromMap(data);
        // set or update cache
        SnippetInfoModel.cacheSnippetInfo(snippetName, snippetInfo);
      } catch (e) {
        print(e);
      }
      // populate snippetInfo with its version ids
      try {
        final versionsSnapshot =
            await snippetInfoDocRef.collection('versions').get();
        List<VersionId> versionIds =
            versionsSnapshot.docs.map((doc) => doc.id).toList();
        snippetInfo?.cachedVersions = {};
        snippetInfo?.cachedVersionIds = [...versionIds];
      } catch (e) {
        // Handle errors
        print(e.toString());
      }
    }
    fco.snippetsBeingReadFromFB.remove(snippetName);

    fco.logi('--- versions: ${snippetInfo?.cachedVersions.toString()}');

    return snippetInfo;
  }

  @override
  // SnippetInfo already loaded. If snippet version not in cache, gets from FB and adds to cache
  Future<SnippetRootNode?> loadVersionFromFBIntoCache({
    required SnippetInfoModel snippetInfo,
    required VersionId versionId,
  }) async {
    // try to fetch the specified version from cache, otherwise try to fetch from FB
    SnippetRootNode? version = snippetInfo.cachedVersions[versionId];

    if (version != null) {
      // ALREADY IN CACHE
      fco.logi('--- snippet (${snippetInfo.name}) version $versionId ------');
      fco.logi('--- Already in Cache. -------------------------------------');
      return version;
    }

    fco.logi('--- LOADING SNIPPET INTO CACHE ------------------------------');
    fco.logi('--- snippet (${snippetInfo.name}) version $versionId --------');
    fco.logi('-------------------------------------------------------------');

    // read snippet properties (saving then restoring the transient props)
    DocumentReference snippetInfoDocRef =
        appDocRef.collection('snippets').doc(snippetInfo.name);
    // DocumentSnapshot snippetInfoDoc = await snippetInfoDocRef.get();
    // if (snippetInfoDoc.exists) {
    try {
      // final data = snippetInfoDoc.data() as Map<String, dynamic>;
      // SnippetInfoModel fbSnippetInfo = SnippetInfoModelMapper.fromMap(data);
      // read version
      DocumentReference versionDocRef =
          snippetInfoDocRef.collection('versions').doc(versionId);
      DocumentSnapshot versionDoc = await versionDocRef.get();
      if (versionDoc.exists) {
        try {
          final data = versionDoc.data() as Map<String, dynamic>;
          version = SnippetRootNodeMapper.fromMap(data);
          // cache it
          snippetInfo.cachedVersions[versionId] = version;
          fco.logi('--- LOADED--------------------------------------------');
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
    // }
    return version;
  }

  @override
  Future<String?> getGcrServerUrl() async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('/apps').doc('gcr-bh-apps-dart');
    DocumentSnapshot doc = await docRef.get();
    if (doc.exists) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        return data['latest'];
      } catch (e) {
        print(e);
      }
    } else {
      fco.logi("gcr-bh-apps-dart doc does not exist.");
      return null;
    }
    return null;
  }

  @override
  Future<AppInfoModel?> getAppInfo() async {
    DocumentReference ref = appDocRef;
    DocumentSnapshot doc = await ref.get();
    if (doc.exists) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        AppInfoModel result = AppInfoModelMapper.fromMap(data);
        return result;
      } catch (e) {
        print(e);
      }
    } else {
      fco.logi("getAppInfo doc does not exist.");
      return AppInfoModel();
    }
    return null;
  }

  @override
  Future<void> saveAppInfo() async {
    var map = fco.appInfoAsMap;
    await appDocRef.set(
      map,
    );
  }

  /// createOrUpdateAppModelAndCAPIModel
  /// Add the snippet's versions collection and update the snippet's properties
  /// if successful FB writes, return true
  @override
  Future<bool> saveSnippetVersion({
    required SnippetName snippetName,
    required VersionId newVersionId,
    required SnippetRootNode newVersion,
  }) async {
    SnippetInfoModel? snippetInfo =
        SnippetInfoModel.cachedSnippet(snippetName);
    if (snippetInfo == null) return false;

    // create the actual version doc
    try {
      DocumentReference snippetInfoDocRef =
          appDocRef.collection('snippets').doc(snippetName);
      await snippetInfoDocRef
          .collection('versions')
          .doc(newVersionId)
          .set(newVersion.toMap()..addAll({'name': snippetName}));

      fco.logi('--- SAVED --------------------------------------------------');
      fco.logi('wrote snippet ($snippetName) version to FB:');
      fco.logi('versionId: $newVersionId');
      fco.logi('------------------------------------------------------------');

      // set the snippet properties
      // await snippetInfoDocRef.set(snippetInfo!.toMap());
      await updateSnippetProps(
        snippetName: snippetName,
        editingVersionId: newVersionId,
        publishingVersionId:
            snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
                ? newVersionId
                : snippetInfo.publishedVersionId,
      );

      // // also add versionId to appInfo
      // FCO.appInfo.versions[snippetName]!.insert(0, latestVersionId!);
      // await saveAppInfo();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<void> deleteSnippet(final String snippetName) async {
    DocumentReference snippetDocRef = appDocRef.collection('snippets').doc(snippetName);
    snippetDocRef.delete();
  }

  @override
  Future<void> deleteSnippetVersions(
    final String snippetName,
    final List<VersionId> tbd,
  ) async {
    CollectionReference versions =
        appDocRef.collection('snippets/$snippetName/versions');
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    for (String documentId in tbd) {
      batch.delete(versions.doc(documentId));
    }
    batch.commit();
  }

  @override
  Future<void> updateSnippetProps({
    required SnippetName snippetName,
    VersionId? editingVersionId,
    VersionId? publishingVersionId,
    bool? autoPublish,
  }) async {
    // var fc = FC();

    SnippetInfoModel? snippetInfo =
        SnippetInfoModel.cachedSnippet(snippetName);
    if (snippetInfo == null) return;

    // set the snippet properties
    DocumentReference snippetDocRef =
        appDocRef.collection('snippets').doc(snippetName);
    await snippetDocRef.set({
      'name': snippetName,
      'editingVersionId': editingVersionId ?? snippetInfo.editingVersionId,
      'publishedVersionId':
          publishingVersionId ?? snippetInfo.publishedVersionId,
      // 'autoPublish': autoPublish ?? snippetInfo.autoPublish,
    }, SetOptions(merge: true));

    // update local values
    if (editingVersionId != null) {
      snippetInfo.editingVersionId = editingVersionId;
    }
    if (publishingVersionId != null) {
      snippetInfo.publishedVersionId = publishingVersionId;
    }

    fco.logi('--- UPDATED SNIPPET PROPERTIES ------------------------------');
    fco.logi('wrote snippet ($snippetName) properties to FB:');
    fco.logi('editing: ${snippetInfo.editingVersionId}');
    fco.logi('published: ${snippetInfo.publishedVersionId}');
    fco.logi('autoPublish: ${snippetInfo.autoPublish}');
    fco.logi('-------------------------------------------------------------');
  }

  @override
  Future<OptionVoteCountMap> getPollOptionVoteCounts({
    required String pollName,
  }) async {
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .doc('/apps/${fco.appName}/polls/$pollName')
        .get();
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
            fco.logi(
                "Warning: Value for key '$key' cannot be converted to int.");
          }
        } else if (value is double) {
          optionCountsMap[key] = value.toInt();
        } else {
          // Handle the case where the value is of an unsupported type
          fco.logi("Warning: Value for key '$key' is of unsupported type.");
        }
      });
      return optionCountsMap;
    }
    return {};
  }

// @override

  /// returns a Record containing: totalVotes for each Option, optionUserVotedFor (or null if not voted yet)
  /// Does 2 firestore reads:
  /// 1. poll record in the /polls collection, which could have a vote count for each option (map)
  /// 2. user's entry in /polls/{pollId}/voters collection, which would have a timestamp and which option was voted for

//   //
//   // int pollVoteCount = 0;
//   // Map<PollOptionId, int> optionVoteCountMap = {};
//   // PollOptionId? userVotedForOption;
//   //
//   // for (PollOptionId pollOptionId in pollOptionIds) {
//   //   // each document in the voter collection represents a user who voted. The doc cannot be empty, so its id is the EmailAddress a property is time of vote.
//   //   CollectionReference pollOptionVotes =
//   //       FirebaseFirestore.instance.collection('/flutter-content-apps/$appName/polls/$pollName/options/$pollOptionId/voters');
//   //   var optionVoteCountSnap = await pollOptionVotes.count().get();
//   //   int optionVoteCount = optionVoteCountSnap.count;
//   //   optionVoteCountMap[pollOptionId] = optionVoteCount;
//   //   pollVoteCount += optionVoteCount;
//   //   // check for presence of this user in this options voters collection
//   //   DocumentReference voterDocRef = pollOptionVotes.doc(voterId);
//   //   DocumentSnapshot snap = await voterDocRef.get();
//   //   if (snap.exists) {
//   //     Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
//   //     fco.logi("user voted ${data['when']}");
//   //     userVotedForOption = pollOptionId;
//   //   }
//   // }
//   //
//   // OptionCountsAndVoterRecord result = (
//   //   voterId: voterId,
//   //   pollVoteCount: pollVoteCount,
//   //   optionVoteCountMap: optionVoteCountMap,
//   //   userVotedForOptionId: userVotedForOption,
//   // );
//   //
//   // return result;
// }

  @override
  Future<UserVoterRecord?> getUsersVote({
    required String pollName,
    required VoterId voterId,
  }) async {
    // get user's vote in this poll (if exists)
    DocumentSnapshot voterSnap = await FirebaseFirestore.instance
        .doc('/apps/${fco.appName}/polls/$pollName/voters/$voterId')
        .get();
    if (voterSnap.exists) {
      Map<String, dynamic> voterData = voterSnap.data() as Map<String, dynamic>;
      Timestamp when = voterData['when'];
      PollOptionId votedFor = voterData['option-id'];
      return (optionId: votedFor, when: when.millisecondsSinceEpoch);
    }
    return null;
  }

  @override
  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  }) async {
    Map<PollOptionId, List<EmailAddress>> optionVotersMap = {};

    for (PollOptionId pollOptionId in pollOptionIds) {
// each document in the voter collection represents a user who voted. The doc cannot be empty, so its id is the EmailAddress a property is time of vote.
      CollectionReference pollOptionVotes = FirebaseFirestore.instance.collection(
          '/apps/${fco.appName}/polls/$pollName/options/$pollOptionId/voters');
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
    final docPath = '/apps/${fco.appName}/polls/$pollName/voters/$voterId';
    DocumentReference userVoteDocRef = FirebaseFirestore.instance.doc(docPath);
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
          .doc('/apps/${fco.appName}/polls/$pollName')
          .set({"option-vote-counts": newOptionVoteCountMap});
    } else {
      Map<String, dynamic> voterData = snap.data() as Map<String, dynamic>;
      Timestamp when = voterData['when'];
      PollOptionId votedFor = voterData['option-id'];
      fco.logi('already voted for option $votedFor,  $when');
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

  @override
  Future<bool> tokenConfirmed(String token) async {
    DocumentReference tokenDocRef =
        FirebaseFirestore.instance.collection('/confirmed-tokens').doc(token);
    DocumentSnapshot doc = await tokenDocRef.get();
    return doc.exists;
  }

  DocumentReference get appDocRef =>
      FirebaseFirestore.instance.collection('/apps').doc(fco.appName);

// @override
// Future<void> copyCollectionBetweenProjects() async {
//
//   // await Firebase.initializeApp(options: Algc_DefaultFirebaseOptions.currentPlatform);
//   await Firebase.initializeApp(options: OLD_DefaultFirebaseOptions.currentPlatform, name: 'OLD');
//
//   // FirebaseApp algcApp = Firebase.app();
//   FirebaseApp bhApp = Firebase.app('BH');
//
//   // FirebaseFirestore algcFs = FirebaseFirestore.instance;
//   FirebaseFirestore bhFs = FirebaseFirestore.instanceFor(app: bhApp);
//
//
//   final fromUsersRef = FirebaseFirestore.instance.collection('/fs-users');
//   final toCollectionRef = bhFs.collection('/apps/algc/fs-users');
//
//   try {
//     final usersSnapshot = await fromUsersRef.get();
//     for (final document in usersSnapshot.docs) {
//       await toCollectionRef.doc(document.id).set(document.data());
//       print('Document ${document.id} migrated successfully');
//     }
//     // Optionally delete the old collection after migration
//     // await oldCollectionRef.doc(document.id).delete();
//   } catch (e) {
//     print('Error during migration: $e');
//     // Handle errors appropriately
//   }
// }

// copy collection /fs-users from one firestore project (flowchart_studio) to another (biancashouse)
// Future<void> copyFlowchartsBetweenProjects() async {
//
//   // await Firebase.initializeApp(options: Algc_DefaultFirebaseOptions.currentPlatform);
//   await Firebase.initializeApp(options: BH_DefaultFirebaseOptions.currentPlatform, name: 'BH');
//
//   // FirebaseApp algcApp = Firebase.app();
//   FirebaseApp bhApp = Firebase.app('BH');
//
//   // FirebaseFirestore algcFs = FirebaseFirestore.instance;
//   FirebaseFirestore bhFs = FirebaseFirestore.instanceFor(app: bhApp);
//
//
//   final fromUsersRef = FirebaseFirestore.instance.collection('/fs-users');
//
//   try {
//     final usersSnapshot = await fromUsersRef.get();
//     for (final fromUserDoc in usersSnapshot.docs) {
//       final fromUserFlowchartsRef =
//       FirebaseFirestore.instance.collection('/fs-users/${fromUserDoc.id}/flowcharts');
//       final userFlowchartsSnapshot = await fromUserFlowchartsRef.get();
//       for (final fromFlowchartDoc in userFlowchartsSnapshot.docs) {
//         // final toUserFlowchartsRef = toUsersRef.collection('flowcharts');
//         final toUserFlowchartsRef =
//         bhFs.collection('/apps/algc/fs-users/${fromUserDoc.id}/flowcharts');
//         await toUserFlowchartsRef.doc(fromFlowchartDoc.id).set(fromFlowchartDoc.data());
//       }
//       print('Document ${fromUserDoc.id} migrated successfully');
//     }
//     // Optionally delete the old collection after migration
//     // await oldCollectionRef.doc(document.id).delete();
//   } catch (e) {
//     print('Error during migration: $e');
//     // Handle errors appropriately
//   }
// }

// @override
// Future<void> copyFlowchartDocBetweenUsersInSameProject(
//     String fromUserId, String toUserId) async {
//
//   CollectionReference fromUserFlowchartsRef = FirebaseFirestore.instance.collection('/fs-users/$fromUserId');
//   CollectionReference toUserFlowchartsRef = FirebaseFirestore.instance.collection('/fs-users/$toUserId');
//
//   try {
//     final flowchartsSnapshot = await fromUserFlowchartsRef.get();
//     for (final flowchartDoc in flowchartsSnapshot.docs) {
//       await toUserFlowchartsRef.doc(flowchartDoc.id).set(flowchartDoc.data());
//       print('Flowchart Document ${flowchartDoc.id} copied successfully');
//     }
//     // Optionally delete the old collection after migration
//     // await oldCollectionRef.doc(document.id).delete();
//   } catch (e) {
//     print('Error during migration: $e');
//     // Handle errors appropriately
//   }
// }

// Future<void> copyUsersProjects() async {
//   final admin = FirebaseAdminApp.initializeApp(
//     'flowchart-studio',
//     Credential.fromApplicationDefaultCredentials(),
//   );
//   final firestore = admin_firestore.Firestore(admin);
//   final users = firestore.collection('users');
//   // final adults = collection.where('age', WhereFilter.greaterThan, 18);
//   final usersSnapshot = await users.get();
//
//   for (final user in usersSnapshot.docs) {
//     print(user.data());
//   }
// }

// Future<void> migrateCollection() async {
//   final db = FirebaseFirestore.instance;
//   final oldCollectionRef = db.collection('/flutter-content-models');
//   final newCollectionRef = db.collection('/flutter-content-apps');
//
//   try {
//     final querySnapshot =await oldCollectionRef.get();
//     for (final document in querySnapshot.docs) {
//       await newCollectionRef.doc(document.id).set(document.data());
//       print('Document ${document.id} migrated successfully');
//     }
//     // Optionally delete the old collection after migration
//     // await oldCollectionRef.doc(document.id).delete();
//   } catch (e) {
//     print('Error during migration: $e');
//     // Handle errors appropriately
//   }
// }
}
