import 'dart:async';

import 'package:admin/bh-apps.firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

// main when using the flutter_content package
Future<void> main({bool useEmulator = false}) async {
  WidgetsFlutterBinding.ensureInitialized();
  fco.appName = 'biancashouse';
  var fbOptions = BH_APPS_DefaultFirebaseOptions.currentPlatform;
  var modelRepo = FireStoreModelRepository(fbOptions);
  await modelRepo.possiblyInitFireStoreRelatedAPIs(useEmulator: false);
  AppInfoModel? appInfo = await modelRepo.getAppInfo();

  // Deep Copy /apps/* to /flutter-content/*
  // Firestore does not provide a built-in method for deep copying documents
  // and their subcollections directly...

  // Retrieve the data of the source document you wish to copy.
  DocumentReference sourceDocRef = FirebaseFirestore.instance
      .collection('apps')
      .doc(fco.appName);
  DocumentSnapshot sourceDocSnap = await sourceDocRef.get();

  // Set the data of the new document /flutter-content/$appName
  DocumentReference newDocRef = FirebaseFirestore.instance
      .collection('flutter-content')
      .doc(fco.appName);
  await newDocRef.set(sourceDocSnap.data());

  // Iterate through the snippets collection of the source document and recursively
  // copy its documents to the target collection.
  // Get documents from the source subcollection
  QuerySnapshot snippets = await sourceDocRef.collection('snippets').get();
  for (QueryDocumentSnapshot snippetDoc in snippets.docs) {

    print('${snippetDoc.id}');

    QuerySnapshot versions = await sourceDocRef.collection('snippets/${snippetDoc.id}/versions').get();

    for (QueryDocumentSnapshot versionDoc in versions.docs) {
      await newDocRef
          .collection('snippets')
          .doc(snippetDoc.id)
          .collection('versions')
          .doc(versionDoc.id)
          .set(versionDoc.data() as Map<String, dynamic>);
    }

    await newDocRef
      .collection('snippets')
      .doc(snippetDoc.id)
      .set(snippetDoc.data() as Map<String, dynamic>);
  }

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Firestore Admin.',
      home: Material(
        child: Scaffold(
          appBar: AppBar(title: Text('Firestore Admin')),
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(appInfo.toString()),
          ),
        ),
      ),
    ),
  );
}
