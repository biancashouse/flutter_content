// import 'dart:convert';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_ui_shared/firebase_ui_shared.dart';
// import 'package:firebase_ui_storage/firebase_ui_storage.dart'
//     show
//         FirebaseUIStorage,
//         FirebaseUIStorageConfiguration /*, UuidFileUploadNamingPolicy*/,
//         KeepOriginalNameUploadPolicy;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/snodes/widget/fs_uint8list_upload_btn.dart';
// import 'package:http/http.dart' as http;
// import 'package:multi_split_view/multi_split_view.dart';
//
// class PlantUMLMSV extends StatefulWidget {
//   final SNode snode;
//   final UMLRecord originalUMLRecord;
//   final TextEditingController teC;
//   final ValueChanged<UMLRecord> onChangeF;
//   final ValueChanged<Size> onSizedF;
//
//   const PlantUMLMSV({
//     required this.snode,
//     required this.originalUMLRecord,
//     required this.teC,
//     required this.onChangeF,
//     required this.onSizedF,
//     super.key,
//   });
//
//   @override
//   State<PlantUMLMSV> createState() => PlantUMLMSVState();
// }
//
// class PlantUMLMSVState extends State<PlantUMLMSV> {
//   late FocusNode focusNode;
//   late GlobalKey gkForSizing;
//   UMLRecord? umlRecord;
//   late Future<void> fConfigureStorageUIForFolder;
//
//   Future<void> _fbStorageConfigure() async {
//     final folderRef = fco.folderPathRef('/plantuml-images');
//     try {
//       await FirebaseUIStorage.configure(
//         FirebaseUIStorageConfiguration(
//           storage: FirebaseStorage.instance,
//           uploadRoot: folderRef,
//           namingPolicy: const KeepOriginalNameUploadPolicy(),
//           // optional, will generate a UUID for each uploaded file
//         ),
//       );
//     } catch (e) {
//       fco.logger.e('', error: e);
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     focusNode = FocusNode();
//     gkForSizing = GlobalKey();
//     fConfigureStorageUIForFolder = _fbStorageConfigure();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // remove @startuml and @enduml from text
//
//     return FutureBuilder<UMLRecord>(
//       future: encodeThenFetchPng(widget.teC.text, widget.onChangeF),
//       builder: (futureContext, snapshot) {
//         if (snapshot.connectionState != ConnectionState.done) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         void getSize() {
//           final RenderBox? renderBox =
//               gkForSizing.currentContext?.findRenderObject() as RenderBox?;
//           if (renderBox != null) {
//             final size = renderBox.size;
//             widget.onSizedF(size);
//             fco.logger.d('Image size: $size');
//           }
//         }
//
//         fco.afterNextBuildDo(() => getSize());
//
//         UMLRecord? umlRecord = snapshot.data;
//
//         UMLImageNode umlNode = widget.snode as UMLImageNode;
//
//         List<Area> areas = [
//           Area(builder: (ctx, area) => _textArea()),
//           Area(
//             builder: (ctx, area) => _plantUMLImageArea(
//               umlRecord?.bytes ?? Uint8List.fromList(missingPng.codeUnits),
//               umlNode.name?.isNotEmpty ?? false ? umlNode.name! : umlNode.uid,
//             ),
//           ),
//         ];
//
//         return MultiSplitViewTheme(
//           data: MultiSplitViewThemeData(
//             dividerPainter: DividerPainters.grooved1(
//               color: Colors.indigo[100]!,
//               highlightedColor: Colors.indigo[900]!,
//             ),
//           ),
//           child: MultiSplitView(axis: Axis.horizontal, initialAreas: areas),
//         );
//       },
//     );
//   }
//
//   Widget _textArea() => Container(
//     color: Colors.yellowAccent,
//     padding: const EdgeInsets.all(10),
//     child: Column(
//       children: [
//         Row(
//           children: [
//             fco.coloredText('refresh', color: Colors.purple),
//             IconButton(
//               onPressed: () async {
//                 setState(() {});
//               },
//               icon: const Icon(Icons.refresh, color: Colors.purple),
//             ),
//           ],
//         ),
//         _umlTextField(),
//         Row(
//           children: [
//             fco.coloredText('refresh', color: Colors.purple),
//             IconButton(
//               onPressed: () async {
//                 setState(() {});
//               },
//               icon: const Icon(Icons.refresh, color: Colors.purple),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
//
//   // void refreshImage( ) {
//   //   setState(() {
//   //     widget.onChangeF
//   //         .call((text: teC.text, encodedText: umlEncodedText, bytes: pngBytes));
//   //   });
//   // }
//
//   Widget _plantUMLImageArea(Uint8List pngBytes, String fsFileName) => Stack(
//     children: [
//       SizedBox(
//         height: 80,
//         child: Align(
//           alignment: Alignment.topRight,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextButton.icon(
//                 onPressed: () async {
//                   if (fco.firebaseOptions == null) return;
//
//                   final Uri url = Uri.parse(
//                     'https://console.cloud.google.com/storage/browser/${fco.firebaseOptions!.storageBucket}/${fco.appName}?${fco.firebaseOptions!.projectId}',
//                   );
//                   if (!await launchUrl(url)) {
//                     throw Exception('Could not launch $url');
//                   }
//                 },
//                 label: const Icon(Icons.link),
//                 icon: const Text(' Cloud Storage Console'),
//               ),
//               Tooltip(
//                 message: 'to folder: /plantuml-images',
//                 child: FSBytesUploadButton(
//                   fileName: fsFileName,
//                   bytes: pngBytes,
//                   onError: (e, s) => ScaffoldMessenger.of(
//                     context,
//                   ).showSnackBar(SnackBar(content: Text(e.toString()))),
//                   onUploadComplete: (ref) {
//                     setState(() {});
//                   },
//                   variant: ButtonVariant.text,
//                 ),
//               ),
//               // FilledButton(
//               //   onPressedressed: () async {
//               //     // 1. Show a loading indicator to the user
//               //     fco.showToast(msg: 'Uploading UML image...');
//               //
//               //     // 2. Define the path in Firebase Storage.
//               //     // It's good practice to use the snode's unique ID to create a unique path.
//               //     final storagePath = 'plantuml-images/${widget.snode.uid}.png';
//               //
//               //     // 3. Get a reference to the location you want to upload to.
//               //     final storageRef = FirebaseStorage.instance.ref().child(
//               //       storagePath,
//               //     );
//               //
//               //     try {
//               //       // 5. Upload the data using putData.
//               //       // You can also provide metadata like the content type.
//               //       final metadata = SettableMetadata(contentType: "image/png");
//               //       final uploadTask = await storageRef.putData(
//               //         pngBytes,
//               //         metadata,
//               //       );
//               //
//               //       // 6. (Optional) Get the download URL after the upload is complete.
//               //       final downloadUrl = await uploadTask.ref.getDownloadURL();
//               //
//               //       // You could save this URL to Firestore or use it elsewhere.
//               //       fco.logger.i('Upload complete! URL: $downloadUrl');
//               //       fco.showToast(
//               //         msg: 'Upload successful!',
//               //         bgColor: Colors.green,
//               //       );
//               //     } on FirebaseException catch (e) {
//               //       // 7. Handle any errors.
//               //       fco.logger.e('Firebase Storage Error: ${e.message}');
//               //       fco.showToast(
//               //         msg: 'Error uploading: ${e.code}',
//               //         bgColor: Colors.red,
//               //       );
//               //     } catch (e) {
//               //       fco.logger.e('An unknown error occurred: $e');
//               //       fco.showToast(
//               //         msg: 'An unknown error occurred.',
//               //         bgColor: Colors.red,
//               //       );
//               //     }
//               //   },
//               //
//               //   child: Tooltip(
//               //     message:
//               //         'upload to firebase storage\n\n(i.e. cache generated uml image)',
//               //     child: const Icon(Icons.upload),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       Center(
//         child: SingleChildScrollView(
//           child: Image.memory(
//             key: gkForSizing,
//             pngBytes,
//             errorBuilder: (context, o, stackTrace) {
//               return Error(
//                 key: GlobalKey(),
//                 "PlantUMLTextEditor Image.memory",
//                 color: Colors.red,
//                 size: 18,
//                 errorMsg: 'Bad pngBytes',
//               );
//             },
//           ),
//         ),
//       ),
//     ],
//   );
//
//   static Future<UMLRecord> encodeThenFetchPng(
//     String umlText,
//     ValueChanged<UMLRecord> onchangeF,
//   ) async {
//     String umlTextWithoutStartAndEnd = umlText.replaceAll(
//       RegExp(r'@startuml\n'),
//       '',
//     );
//     umlTextWithoutStartAndEnd = umlText.replaceAll(RegExp(r'\n@enduml'), '');
//
//     String? encodedText = await _cloudRunEncodeTextForPlantUML(
//       umlTextWithoutStartAndEnd,
//     );
//     encodedText ??= missingPng;
//     Uint8List? pngBytes = await _fetchPngFromPlantUML(encodedText);
//     // Uint8List? pngBytes = await _fetchPngFromPlantUML(encodedText);
//     UMLRecord umlRecord = (
//       text: umlText,
//       bytes: pngBytes,
//       width: null,
//       height: null,
//     );
//     onchangeF.call(umlRecord);
//     return umlRecord;
//   }
//
//   /// http POST - send uml text to my cloud run server to encode into a string.
//   /// That string can then be sent to https://www.plantuml.com/plantuml/png/<encoded-text>
//   static Future<String?> _cloudRunEncodeTextForPlantUML(String umlText) async {
//     final bodyMap = {"uml": umlText};
//     final body = json.encode(bodyMap);
//     final response = await http.Client().post(
//       Uri.parse(
//         'https://gcr-plantuml-encoder-js-188627927914.australia-southeast1.run.app',
//       ),
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       },
//       body: body,
//     );
//     final responseBody = response.body;
//     final String encodedText = responseBody;
//     return response.statusCode == 200
//         ? encodedText
//         : null; // "cloudRunEncodeTextForPlantUML() received a bad response!";
//   }
//
//   static Future<Uint8List?> _fetchPngeFromKroki(String umlText) async {
//     final url = Uri.parse(
//       'https://kroki-188627927914.us-central1.run.app/plantuml/$umlText',
//     );
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         return response.bodyBytes;
//       } else {
//         fco.logger.w('Error fetching PNG: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       fco.logger.w('Error fetching PNG: $e');
//       return null;
//     }
//   }
//
//   static Future<Uint8List?> _fetchPngFromPlantUML(String encodedUMLText) async {
//     final url = Uri.parse(
//       'https://www.plantuml.com/plantuml/png/$encodedUMLText',
//     );
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         return response.bodyBytes;
//       } else {
//         fco.logger.w('Error fetching PNG: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       fco.logger.w('Error fetching PNG: $e');
//       return null;
//     }
//   }
//
//   Widget _umlTextField() {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: widget.teC,
//               decoration: const InputDecoration(hintText: "PlantUML text"),
//               focusNode: focusNode,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'monospace',
//                 letterSpacing: 2,
//                 color: Colors.blue[900],
//               ),
//               textAlign: TextAlign.left,
//               textAlignVertical: TextAlignVertical.top,
//               onTap: () {
//                 focusNode.requestFocus();
//               },
//               onChanged: (s) {},
//               onTapOutside: (_) {
//                 focusNode.unfocus();
//               },
//               autocorrect: false,
//               enableInteractiveSelection: true,
//               scrollPadding: const EdgeInsets.all(10),
//               keyboardType: TextInputType.multiline,
//               maxLines: 999,
//               autofocus: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
