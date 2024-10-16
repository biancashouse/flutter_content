// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_callouts/flutter_callouts.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:multi_split_view/multi_split_view.dart';
// import 'package:http/http.dart' as http;
//
// class PropertyButtonUML extends StatelessWidget {
//   final UMLRecord originalUMLRecord;
//   final String? label;
//   final Size calloutButtonSize;
//   final GlobalKey propertyBtnGK;
//   final ValueChanged<UMLRecord> onChangeF;
//
//   const PropertyButtonUML({
//     required this.originalUMLRecord,
//     this.label,
//     required this.calloutButtonSize,
//     required this.onChangeF,
//     required this.propertyBtnGK,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//       String editedText = originalUMLRecord.text ?? '';
//       String textLabel() =>
//           editedText.isNotEmpty ? '$label: $editedText' : '$label...';
//       Widget labelWidget = Text(
//         textLabel(),
//         style: const TextStyle(color: Colors.white),
//         overflow: TextOverflow.ellipsis,
//       );
//       return GestureDetector(
//         onTap: () {
//           CalloutConfig teCC = CalloutConfig(
//             cId: 'uml-te',
//             containsTextField: true,
//             barrier: CalloutBarrier(
//                 opacity: .25,
//                 onTappedF: () {
//                   fco.dismiss('uml-te');
//                 }),
//             fillColor: Colors.white,
//             arrowType: ArrowType.NONE,
//             initialCalloutW: fco.scrW * .8,
//             initialCalloutH: fco.scrH * .8,
//             onDismissedF: () {},
//             onAcceptedF: () {},
//             onResizeF: (Size newSize) {},
//             onDragF: (Offset newOffset) {},
//             draggable: false,
//             notUsingHydratedStorage: true,
//           );
//
//           Widget calloutContent = PlantUMLTextEditor(
//             umlRecord: (text: editedText, encodedText: null, bytes: null),
//             onChangeF: () {},
//           );
//
//           fco.showOverlay(
//             calloutConfig: teCC,
//             calloutContent: calloutContent,
//             targetGkF: () => propertyBtnGK,
//           );
//         },
//         child: Container(
//           alignment: Alignment.centerLeft,
//           key: propertyBtnGK,
//           width: calloutButtonSize.width,
//           height: calloutButtonSize.height,
//           child: labelWidget,
//         ),
//       );
//     });
//   }
// }
//
// class PlantUMLTextEditor extends StatefulWidget {
//   final UMLRecord umlRecord;
//   final ValueChanged<UMLRecord> onChangeF;
//
//   const PlantUMLTextEditor({
//     required this.umlRecord,
//     required this.onChangeF,
//     super.key,
//   });
//
//   @override
//   State<PlantUMLTextEditor> createState() => _PlantUMLTextEditorState();
// }
//
// class _PlantUMLTextEditorState extends State<PlantUMLTextEditor> {
//   late TextEditingController teC;
//   late FocusNode focusNode;
//   Uint8List? pngBytes;
//
//   @override
//   void initState() {
//     teC = TextEditingController();
//     teC.text = widget.umlRecord.text??'';
//     focusNode = FocusNode();
//     fco.afterNextBuildDo(() async {
//       final umlEncodedText = await _cloudRunEncodeTextForPlantUML(teC.text);
//       if (umlEncodedText != null) {
//         pngBytes = await _fetchPngFromPlantUML(umlEncodedText);
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Area> areas = [
//       Area(builder: (ctx, area) => _textArea()),
//       Area(
//           builder: (ctx, area) => _plantUMLImageArea(
//                 pngBytes ?? Uint8List.fromList(missingPng.codeUnits),
//               )),
//     ];
//
//     return MultiSplitViewTheme(
//       data: MultiSplitViewThemeData(
//         dividerPainter: DividerPainters.grooved1(
//           color: Colors.indigo[100]!,
//           highlightedColor: Colors.indigo[900]!,
//         ),
//       ),
//       child: MultiSplitView(
//         axis: Axis.horizontal,
//         initialAreas: areas,
//       ),
//     );
//   }
//
//   Widget _textArea() => Container(
//         color: Colors.yellowAccent,
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 fco.coloredText('@startuml', color: Colors.purple),
//                 IconButton(
//                   onPressed: () async {
//                     final umlEncodedText =
//                         await _cloudRunEncodeTextForPlantUML(teC.text);
//                     if (umlEncodedText != null) {
//                       pngBytes = await _fetchPngFromPlantUML(umlEncodedText);
//                     }
//                     refresh(umlEncodedText);
//                   },
//                   icon: const Icon(
//                     Icons.refresh,
//                     color: Colors.purple,
//                   ),
//                 ),
//               ],
//             ),
//             _umlTextField(),
//             Row(
//               children: [
//                 fco.coloredText('@enduml', color: Colors.purple),
//                 IconButton(
//                   onPressed: () async {
//                     final umlEncodedText =
//                         await _cloudRunEncodeTextForPlantUML(teC.text);
//                     if (umlEncodedText != null) {
//                       pngBytes = await _fetchPngFromPlantUML(umlEncodedText);
//                     }
//                     refresh(umlEncodedText);
//                   },
//                   icon: const Icon(
//                     Icons.refresh,
//                     color: Colors.purple,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//
//   void refresh(umlEncodedText) {
//     setState(() {
//       widget.onChangeF
//           .call((text: teC.text, encodedText: umlEncodedText, bytes: pngBytes));
//     });
//   }
//
//   Widget _plantUMLImageArea(Uint8List pngBytes) => Center(
//         child: SingleChildScrollView(
//           child: Image.memory(pngBytes),
//         ),
//       );
//
//   /// http POST - send uml text to my cloud run server to encode into a string.
//   /// That string can then be sent to https://www.plantuml.com/plantuml/png/<encoded-text>
//   Future<String?> _cloudRunEncodeTextForPlantUML(String umlText) async {
//     final bodyMap = {"uml": "$umlText"};
//     final body = json.encode(bodyMap);
//     final response = await http.Client().post(
//       Uri.parse(
//           'https://gcr-plantuml-encoder-js-188627927914.australia-southeast1.run.app'),
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
//   Future<Uint8List?> _fetchPngFromPlantUML(String encodedUMLText) async {
//     final url =
//         Uri.parse('https://www.plantuml.com/plantuml/png/$encodedUMLText');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         return response.bodyBytes;
//       } else {
//         print('Error fetching PNG: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching PNG: $e');
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
//             FocusScope(
//               canRequestFocus: true,
//               child: TextField(
//                 controller: teC,
//                 decoration: const InputDecoration(
//                   hintText: "PlantUML text",
//                 ),
//                 focusNode: focusNode,
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'monospace',
//                     letterSpacing: 2,
//                     color: Colors.blue[900]),
//                 textAlign: TextAlign.left,
//                 textAlignVertical: TextAlignVertical.top,
//                 onTap: () {
//                   focusNode.requestFocus();
//                 },
//                 onChanged: (s) {
//                   teC.text = s;
//                 },
//                 onTapOutside: (_) {},
//                 autocorrect: false,
//                 enableInteractiveSelection: true,
//                 scrollPadding: const EdgeInsets.all(10),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 999,
//                 autofocus: true,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
