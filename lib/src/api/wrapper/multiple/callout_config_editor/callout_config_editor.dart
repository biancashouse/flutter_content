// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_arrow_type.dart';
//
// class CalloutConfigEditor extends StatefulWidget {
//   final AlignmentEnum? nodeTargetAlignment;
//   final AlignmentEnum? nodeCalloutAlignment;
//   final ArrowTypeEnum? nodeArrowType;
//   final CalloutConfigChangedF onChangeF;
//
//   const CalloutConfigEditor({this.nodeTargetAlignment, this.nodeCalloutAlignment, this.nodeArrowType, required this.onChangeF, super.key});
//
//   @override
//   State<CalloutConfigEditor> createState() => CalloutConfigEditorState();
// }
//
// class CalloutConfigEditorState extends State<CalloutConfigEditor> {
//   GlobalKey gk = GlobalKey();
//   late Size calloutSize;
//   late AlignmentEnum _nodeTargetAlignment;
//   late AlignmentEnum _nodeCalloutAlignment;
//   late ArrowTypeEnum _nodeArrowType;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _nodeTargetAlignment = widget.nodeTargetAlignment ?? AlignmentEnum.topLeft;
//     _nodeCalloutAlignment = widget.nodeTargetAlignment ?? AlignmentEnum.bottomRight;
//     _nodeArrowType = widget.nodeArrowType ?? ArrowTypeEnum.POINTY;
//
//     // Useful.afterNextBuildDo(() {
//     //   showContentCalloutConfigEditor();
//     // });
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   Useful.instance.initWithContext(context);
//   //   super.didChangeDependencies();
//   // }
//
//   reShow() {
//     Callout.dismiss(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.name);
//     showContentCalloutConfigEditor();
//   }
//
//   void showContentCalloutConfigEditor() {
//     Callout.showOverlay(
//         targetGkF: () => gk,
//         boxContentF: (_) => GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _nodeCalloutAlignment = switch (_nodeCalloutAlignment) {
//                     AlignmentEnum.topCenter => AlignmentEnum.topRight,
//                     AlignmentEnum.topRight => AlignmentEnum.centerRight,
//                     AlignmentEnum.centerRight => AlignmentEnum.bottomRight,
//                     AlignmentEnum.bottomRight => AlignmentEnum.bottomCenter,
//                     AlignmentEnum.bottomCenter => AlignmentEnum.bottomLeft,
//                     AlignmentEnum.bottomLeft => AlignmentEnum.centerLeft,
//                     AlignmentEnum.centerLeft => AlignmentEnum.topLeft,
//                     AlignmentEnum.topLeft => AlignmentEnum.topCenter,
//                     _ => AlignmentEnum.center,
//                   };
//                   Callout.dismiss(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.name);
//                   showContentCalloutConfigEditor();
//                   widget.onChangeF(_nodeTargetAlignment, _nodeArrowType);
//                 });
//               },
//               onDoubleTap: () {},
//               onLongPress: () {
//                 setState(() {
//                   _nodeArrowType = switch (_nodeArrowType) {
//                     ArrowTypeEnum.VERY_THIN => ArrowTypeEnum.VERY_THIN_REVERSED,
//                     ArrowTypeEnum.VERY_THIN_REVERSED => ArrowTypeEnum.THIN,
//                     ArrowTypeEnum.THIN => ArrowTypeEnum.THIN_REVERSED,
//                     ArrowTypeEnum.THIN_REVERSED => ArrowTypeEnum.MEDIUM,
//                     ArrowTypeEnum.MEDIUM => ArrowTypeEnum.MEDIUM_REVERSED,
//                     ArrowTypeEnum.MEDIUM_REVERSED => ArrowTypeEnum.LARGE,
//                     ArrowTypeEnum.LARGE => ArrowTypeEnum.LARGE_REVERSED,
//                     ArrowTypeEnum.LARGE_REVERSED => ArrowTypeEnum.POINTY,
//                     // ArrowType.HUGE => ArrowType.HUGE_REVERSED,
//                     // ArrowType.HUGE_REVERSED => ArrowType.POINTY,
//                     ArrowTypeEnum.POINTY => ArrowTypeEnum.NO_CONNECTOR,
//                     ArrowTypeEnum.NO_CONNECTOR => ArrowTypeEnum.VERY_THIN,
//                     // _ => ArrowTypeEnum.POINTY,
//                   };
//                   Callout.dismiss(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.name);
//                   showContentCalloutConfigEditor();
//                   widget.onChangeF(_nodeTargetAlignment, _nodeArrowType);
//                 });
//               },
//               // CALLOUT
//               child: Center(
//                   child: Text(
//                 'callout',
//                 style: TextStyle(color: Colors.blue[900]),
//               )),
//             ),
//         calloutConfig: CalloutConfig(
//           feature: CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.name,
//           suppliedCalloutW: 80,
//           suppliedCalloutH: 50,
//           initialTargetAlignment: _nodeTargetAlignment.flutterValue,
//           initialCalloutAlignment: _nodeCalloutAlignment.flutterValue,
//           arrowType: _nodeArrowType.flutterValue,
//           finalSeparation: 80,
//           color: Colors.white,
//           draggable: false,
//           notUsingHydratedStorage: true,
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 600,
//                 height: 500,
//                 color: FUCHSIA_X,
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 1),
//                       padding: const EdgeInsets.all(8.0),
//                       color: Colors.yellow[700],
//                       child: Text('TargetAlignment: ${_nodeTargetAlignment.toString()}', style: const TextStyle(color: Colors.black)),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _nodeTargetAlignment = switch (_nodeTargetAlignment) {
//                             AlignmentEnum.topCenter => AlignmentEnum.topRight,
//                             AlignmentEnum.topRight => AlignmentEnum.centerRight,
//                             AlignmentEnum.centerRight => AlignmentEnum.bottomRight,
//                             AlignmentEnum.bottomRight => AlignmentEnum.bottomCenter,
//                             AlignmentEnum.bottomCenter => AlignmentEnum.bottomLeft,
//                             AlignmentEnum.bottomLeft => AlignmentEnum.centerLeft,
//                             AlignmentEnum.centerLeft => AlignmentEnum.topLeft,
//                             AlignmentEnum.topLeft => AlignmentEnum.topCenter,
//                             _ => AlignmentEnum.center,
//                           };
//                           _nodeCalloutAlignment = AlignmentEnum.of(_nodeTargetAlignment.oppositeEnum.index)!;
//                           Callout.dismiss(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.name);
//                           showContentCalloutConfigEditor();
//                           widget.onChangeF(_nodeTargetAlignment, _nodeArrowType);
//                         });
//                       },
//                       // TARGET
//                       child: Container(
//                         key: gk,
//                         color: Colors.yellow[700],
//                         margin: const EdgeInsets.all(4.0),
//                         padding: const EdgeInsets.all(12.0),
//                         child: const Text("Target"),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       margin: const EdgeInsets.only(bottom: 1),
//                       color: Colors.white,
//                       child: Text('CalloutAlignment: ${_nodeCalloutAlignment.toString()}', style: TextStyle(color: Colors.blue[900])),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 10,
//               right: 10,
//               child: SnippetPanel(
//                 panelName: 'callout-config-editor-help',
//                 snippetName: 'callout-config-editor-help',
//                 allowButtonCallouts: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
