import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';

import 'model_repo.dart';

late FirebaseApp fbApp;

// List<SnippetName> alreadyRequestedSnippetInfoNames = [];

class FireStoreModelRepository implements IModelRepository {
  final FirebaseOptions? fbOptions;

  FireStoreModelRepository(this.fbOptions);

  Future<FirebaseApp> possiblyInitFireStoreRelatedAPIs({bool useEmulator = false}) async {
    // fco.logger.i('possiblyInitFireStoreRelatedAPIs start. ${fco.stopwatch.elapsedMilliseconds}');
    try {
      // fco.logger.i('init FB... ${fco.stopwatch.elapsedMilliseconds}');
      fbApp = await Firebase.initializeApp(options: fbOptions);
      // fco.logger.i('init FB done. ${fco.stopwatch.elapsedMilliseconds}');
      // emulator if in non-prod mode
      if (useEmulator) {
        FirebaseFirestore.instance.settings = Settings(
          host: '${fco.isAndroid ? "10.0.2.2" : "localhost"}:8080',
          sslEnabled: false,
          persistenceEnabled: false,
        );
      }
    } catch (e) {
      fco.logger.e('possiblyInitFireStoreRelatedAPIs', error: e);
    }

    return fbApp;
  }

  // Future<SnippetVersions?> fetchAllSnippetVersionsFromFB(
  //     SnippetName snippetName, List<VersionId> versionIds) async {
  //   appDocRef
  //       .collection('snippets/$snippetName')
  //       /*.where("capital", isEqualTo: true)*/ .get()
  //       .then(
  //     (querySnapshot) {
  //       fco.logger.i("Successfully completed");
  //       for (var docSnapshot in querySnapshot.docs) {
  //         fco.logger.d('${docSnapshot.id} => ${docSnapshot.data()}');
  //         Map<String, dynamic> data =
  //             docSnapshot.data() as Map<String, dynamic>;
  //         return SnippetRootNodeMapper.fromMap(data);
  //       }
  //     },
  //     onError: (e) => fco.logger.i("Error completing: $e"),
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
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName);
    if (snippetInfo != null) {
      fco.logger.d("getSnippetInfoFromCacheOrFB($snippetName) - from CACHE");
      return snippetInfo;
    }

    DocumentReference snippetInfoDocRef = appDocRef.collection('snippets').doc(snippetName);
    final sw = Stopwatch();
    sw.start();
    DocumentSnapshot snippetInfoDoc = await snippetInfoDocRef.get();
    try {
      print('getSnippetInfoFromCacheOrFB() await snippetInfoDocRef.get() took: ${sw.elapsedMilliseconds}ms');
      sw.reset();
      final data = snippetInfoDoc.data() as Map<String, dynamic>;
      snippetInfo = SnippetInfoModelMapper.fromMap(data);
      SnippetInfoModel.cacheSnippetInfo(snippetName, snippetInfo);
      fco.logger.d("getSnippetInfoFromCacheOrFB($snippetName) - from FB (cached)");
      // fco.logger.d("getSnippetInfoFromCacheOrFB($snippetName) - SnippetInfoModel.cachedSnippet($snippetName) is ${SnippetInfoModel.cachedSnippetInfo(snippetName)}");
      // introduce a delay to allow for the cache to be populated
      // await Future.delayed(Duration(milliseconds: 200));
      // fco.logger.i('$snippetName CACHED ----------');
      print('getSnippetInfoFromCacheOrFB() caching snippetInfo took: ${sw.elapsedMilliseconds}ms');
    } catch (e) {
      fco.logger.e('', error: e);
    }
    // populate snippetInfo with its version ids (legacy code - model now stores list inside snippetInfo)
    if (snippetInfo == null) return null;
    if (snippetInfo.versionIds?.isEmpty??true) {
      try {
        sw.reset();
        // nasty - fetchs all the docs !
        // TODO create an index collection on the versions collection
        final versionsSnapshot = await snippetInfoDocRef.collection('versions').get();
        List<VersionId> versionIds = versionsSnapshot.docs.map((doc) => doc.id).toList();
        snippetInfo.cachedVersions = {};
        snippetInfo.versionIds = [...versionIds];
        print('getSnippetInfoFromCacheOrFB() caching versionIds took: ${sw.elapsedMilliseconds}ms');
      } catch (e) {
        // Handle errors
        fco.logger.w(e.toString());
      }
    }
    // }
    //
    // fco.logger.e('snippet "$snippetName" not found!');
    return snippetInfo;
  }

  @override
  // SnippetInfo already loaded. If snippet version not in cache, gets from FB and adds to cache
  Future<SnippetRootNode?> loadVersionFromFBIntoCache({required SnippetInfoModel snippetInfo, required VersionId versionId}) async {
    // try to fetch the specified version from cache, otherwise try to fetch from FB
    SnippetRootNode? version = snippetInfo.cachedVersions[versionId];

    if (version != null) {
      // ALREADY IN CACHE
      fco.logger.i(
        '--- snippet (${snippetInfo.name}) version $versionId ------\n'
        '--- Already in Cache. -------------------------------------',
      );
      return version;
    }

    // fco.logger.i('--- LOADING FB SNIPPET (${snippetInfo.name}) version $versionId INTO CACHE --------');

    // read snippet properties (saving then restoring the transient props)
    DocumentReference snippetInfoDocRef = appDocRef.collection('snippets').doc(snippetInfo.name);
    // DocumentSnapshot snippetInfoDoc = await snippetInfoDocRef.get();
    // if (snippetInfoDoc.exists) {
    try {
      // final data = snippetInfoDoc.data() as Map<String, dynamic>;
      // SnippetInfoModel fbSnippetInfo = SnippetInfoModelMapper.fromMap(data);
      // read version
      DocumentReference versionDocRef = snippetInfoDocRef.collection('versions').doc(versionId);
      DocumentSnapshot versionDoc = await versionDocRef.get();
      if (versionDoc.exists) {
        try {
          final data = versionDoc.data() as Map<String, dynamic>;
          version = SnippetRootNodeMapper.fromMap(data);
          // cache it
          snippetInfo.cachedVersions[versionId] = version;
          // fco.logger.i(
          //     '--- ${snippetInfo.name} LOADED---');
        } catch (e) {
          fco.logger.e('', error: e);
        }
      }
    } catch (e) {
      fco.logger.e('', error: e);
    }
    // }
    return version;
  }

  @override
  Future<String?> getGcrServerUrl() async {
    DocumentReference docRef = FirebaseFirestore.instance.collection('/apps').doc('gcr-bh-apps-dart');
    DocumentSnapshot doc = await docRef.get();
    if (doc.exists) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        return data['latest'];
      } catch (e) {
        fco.logger.e('', error: e);
      }
    } else {
      fco.logger.i("gcr-bh-apps-dart doc does not exist.");
      return null;
    }
    return null;
  }

  @override
  Future<AppInfoModel?> getAppInfo() async {
    DocumentReference ref = appDocRef;
    final sw = Stopwatch();
    sw.start();
    DocumentSnapshot doc = await ref.get();
    sw.stop();
    if (doc.exists) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        AppInfoModel result = AppInfoModelMapper.fromMap(data);
        print('getAppInfo() took: ${sw.elapsedMilliseconds}ms');
        return result;
      } catch (e) {
        fco.logger.e('', error: e);
      }
    } else {
      fco.logger.i("getAppInfo doc does not exist.");
      return AppInfoModel();
    }
    return null;
  }

  @override
  Future<void> saveAppInfo() async {
    fco.logger.d('***********   saveAppInfo   ****************');
    fco.appInfo.userTextStyles = fco.namedTextStyles;
    fco.appInfo.userButtonStyles = fco.namedButtonStyles;
    fco.appInfo.userContainerStyles = fco.namedContainerStyles;
    var map = fco.appInfoAsMap;
    await appDocRef.set(map);
  }

  /// createOrUpdateAppModelAndCAPIModel
  /// Add the snippet's versions collection and update the snippet's properties
  /// if successful FB writes, return true
  @override
  Future<bool> saveSnippetVersion({required SnippetName snippetName, required VersionId newVersionId, required SnippetRootNode newVersion}) async {
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName);
    if (snippetInfo == null) return false;

    // create the actual version doc
    try {
      DocumentReference snippetInfoDocRef = appDocRef.collection('snippets').doc(snippetName);
      await snippetInfoDocRef.collection('versions').doc(newVersionId).set(newVersion.toMap()..addAll({'name': snippetName}));

      fco.logger.i('--- SAVED --------------------------------------------------');
      fco.logger.i('wrote snippet ($snippetName) version to FB:');
      fco.logger.i('versionId: $newVersionId');
      fco.logger.i('------------------------------------------------------------');

      // set the snippet properties
      // await snippetInfoDocRef.set(snippetInfo!.toMap());
      await updateSnippetInfo(
        snippetName: snippetName,
        editingVersionId: newVersionId,
        publishingVersionId: snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault ? newVersionId : snippetInfo.publishedVersionId,
        autoPublish: snippetInfo.autoPublish,
        versionIds: snippetInfo.versionIds,
      );

      // // also add versionId to appInfo
      // FCO.appInfo.versions[snippetName]!.insert(0, latestVersionId!);
      // await saveAppInfo();

      return true;
    } catch (e) {
      fco.logger.e('', error: e);
      return false;
    }
  }

  @override
  Future<void> deleteSnippet(final String snippetName) async {
    DocumentReference snippetDocRef = appDocRef.collection('snippets').doc(snippetName);
    snippetDocRef.delete();
  }

  @override
  Future<void> deleteSnippetVersions(final String snippetName, final List<VersionId> tbd) async {
    CollectionReference versions = appDocRef.collection('snippets/$snippetName/versions');
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    for (String documentId in tbd) {
      batch.delete(versions.doc(documentId));
    }
    batch.commit();
  }

  @override
  Future<void> purgePreviousSnippetVersions(final String snippetName) async {
    CollectionReference versions = appDocRef.collection('snippets/$snippetName/versions');
    var snapshots = await versions.get();
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName);
    if (snippetInfo == null) return;
    for (var doc in snapshots.docs) {
      var id = doc.id;
      if (id != snippetInfo.editingVersionId && id != snippetInfo.publishedVersionId) {
        batch.delete(doc.reference);
      }
    }
    await batch.commit();
  }

  @override
  Future<void> updateSnippetInfo({
    required SnippetName snippetName,
    VersionId? editingVersionId,
    VersionId? publishingVersionId,
    bool? autoPublish,
    List<VersionId>? versionIds,
  }) async {
    // var fc = FC();

    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName);
    if (snippetInfo == null) return;

    // set the snippet properties
    DocumentReference snippetDocRef = appDocRef.collection('snippets').doc(snippetName);
    await snippetDocRef.set({
      'name': snippetName,
      'editingVersionId': editingVersionId ?? snippetInfo.editingVersionId,
      'publishedVersionId': publishingVersionId ?? snippetInfo.publishedVersionId,
      'autoPublish': autoPublish ?? snippetInfo.autoPublish,
      'versionIds': versionIds,
    }, SetOptions(merge: true));

    // update local values
    if (editingVersionId != null) {
      snippetInfo.editingVersionId = editingVersionId;
    }
    if (publishingVersionId != null) {
      snippetInfo.publishedVersionId = publishingVersionId;
    }

    fco.logger.i('--- UPDATED SNIPPET INFO ------------------------------');
    fco.logger.i('wrote snippet ($snippetName) properties to FB:');
    fco.logger.i('editing: ${snippetInfo.editingVersionId}');
    fco.logger.i('published: ${snippetInfo.publishedVersionId}');
    fco.logger.i('autoPublish: ${snippetInfo.autoPublish}');
    fco.logger.i('-------------------------------------------------------------');
  }

  @override
  Future<OptionVoteCountMap> getPollOptionVoteCounts({required String pollName}) async {
    DocumentSnapshot docSnap = await FirebaseFirestore.instance.doc('/apps/${fco.appName}/polls/$pollName').get();
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
            fco.logger.i("Warning: Value for key '$key' cannot be converted to int.");
          }
        } else if (value is double) {
          optionCountsMap[key] = value.toInt();
        } else {
          // Handle the case where the value is of an unsupported type
          fco.logger.i("Warning: Value for key '$key' is of unsupported type.");
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
  //   //     fco.logger.i("user voted ${data['when']}");
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
  Future<UserVoterRecord?> getUsersVote({required String pollName, required VoterId voterId}) async {
    // get user's vote in this poll (if exists)
    DocumentSnapshot voterSnap = await FirebaseFirestore.instance.doc('/apps/${fco.appName}/polls/$pollName/voters/$voterId').get();
    if (voterSnap.exists) {
      Map<String, dynamic> voterData = voterSnap.data() as Map<String, dynamic>;
      Timestamp when = voterData['when'];
      PollOptionId votedFor = voterData['option-id'];
      return (optionId: votedFor, when: when.millisecondsSinceEpoch);
    }
    return null;
  }

  @override
  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({required String pollName, required List<PollOptionId> pollOptionIds}) async {
    Map<PollOptionId, List<EmailAddress>> optionVotersMap = {};

    for (PollOptionId pollOptionId in pollOptionIds) {
      // each document in the voter collection represents a user who voted. The doc cannot be empty, so its id is the EmailAddress a property is time of vote.
      CollectionReference pollOptionVotes = FirebaseFirestore.instance.collection(
        '/apps/${fco.appName}/polls/$pollName/options/$pollOptionId/voters',
      );
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
  Future<void> saveVote({
    required String pollName,
    required VoterId voterId,
    required PollOptionId optionId,
    required Map<PollOptionId, int> newOptionVoteCountMap,
  }) async {
    // check whether already voted
    final docPath = '/apps/${fco.appName}/polls/$pollName/voters/$voterId';
    DocumentReference userVoteDocRef = FirebaseFirestore.instance.doc(docPath);
    DocumentSnapshot snap = await userVoteDocRef.get();
    if (!snap.exists) {
      // write the user's vote
      await userVoteDocRef.set({"when": Timestamp.now(), "option-id": optionId});
      // update the poll's record
      await FirebaseFirestore.instance.doc('/apps/${fco.appName}/polls/$pollName').set({"option-vote-counts": newOptionVoteCountMap});
    } else {
      Map<String, dynamic> voterData = snap.data() as Map<String, dynamic>;
      Timestamp when = voterData['when'];
      PollOptionId votedFor = voterData['option-id'];
      fco.logger.i('already voted for option $votedFor,  $when');
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
      result.children.add(await createAndPopulateFolderNode(ref: childFolderRef, parentNode: result));
    }
    return result;
  }

  @override
  Future<bool> tokenConfirmed(String token) async {
    DocumentReference tokenDocRef = FirebaseFirestore.instance.collection('/confirmed-tokens').doc(token);
    DocumentSnapshot doc = await tokenDocRef.get();
    return doc.exists;
  }

  DocumentReference get appDocRef => FirebaseFirestore.instance.collection('/apps').doc(fco.appName);

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
  //       fco.logger.d('Document ${document.id} migrated successfully');
  //     }
  //     // Optionally delete the old collection after migration
  //     // await oldCollectionRef.doc(document.id).delete();
  //   } catch (e) {
  //     fco.logger.w('Error during migration: $e');
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
  //       fco.logger.d('Document ${fromUserDoc.id} migrated successfully');
  //     }
  //     // Optionally delete the old collection after migration
  //     // await oldCollectionRef.doc(document.id).delete();
  //   } catch (e) {
  //     fco.logger.w('Error during migration: $e');
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
  //       fco.logger.d('Flowchart Document ${flowchartDoc.id} copied successfully');
  //     }
  //     // Optionally delete the old collection after migration
  //     // await oldCollectionRef.doc(document.id).delete();
  //   } catch (e) {
  //     fco.logger.w('Error during migration: $e');
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
  //     fco.logger.i(user.data());
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
  //       fco.logger.d('Document ${document.id} migrated successfully');
  //     }
  //     // Optionally delete the old collection after migration
  //     // await oldCollectionRef.doc(document.id).delete();
  //   } catch (e) {
  //     fco.logger.w('Error during migration: $e');
  //     // Handle errors appropriately
  //   }
  // }
}
