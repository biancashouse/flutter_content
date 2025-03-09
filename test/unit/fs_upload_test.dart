// import 'package:flutter_test/flutter_test.dart';
// import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
// import 'package:flutter/services.dart' show rootBundle;
//
// import '../fs_mocks_test.dart';
//
// void main() {
//   const filename = 'flutter-transparent.png';
//
//   // setupAll() runs once before any test in the suite
//   setUpAll(() async {
//     // fco.logger.d('Setting up common resources...');
//   });
//
//   // setup() runs before each test in the suite
//   setUp(() async {
//
//   });
//
//
//   // Test cases
//   //...
//   test('uploading an image to firebase storage', () async {
//     final storage = MockFirebaseStorage();
//     final storageRef = storage.ref().child(filename);
//     // final localImage = await rootBundle.load("assets/$filename");
//     // final task = await storageRef.putData(localImage.buffer.asUint8List());
//     final task = storageRef.putFile(getFakeImageFile());
//     expect(
//         task.snapshot.ref.fullPath, equals('gs://some-bucket/flutter-transparent.png'));
//     expect(storage.storedFilesMap.containsKey('/$filename'), isTrue);
//     // printPrettyJson(rootNode.toMap(), indent: 2);
//   });
//
//   // tearDown() runs after each test in the suite
//   tearDown(() {
//     // fco.logger.d('\nTearing down resources after a test...');
//   });
//
//   // tearDownAll() runs once after all tests in the suite
//   tearDownAll(() {
//     // fco.logger.d('\nTearing down common resources...');
//   });
//
// }
