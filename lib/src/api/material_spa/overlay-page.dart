// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:pointer_interceptor/pointer_interceptor.dart';
//
// class OverlayPage extends StatelessWidget {
//   final PanelName pageName;
//   final WidgetBuilder pageBuilder;
//
//
//   const OverlayPage({
//     required this.pageName,
//     required this.pageBuilder,
//     required super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) =>
//     Overlay(
//             key: FC().pageOverlayGKs[widget.pageName] = GlobalKey(),
//             initialEntries: [
//               OverlayEntry(builder: (BuildContext ctx) =>
//                   GestureDetector(
//                     onTap: () {
//                       exitEditMode();
//                     },
//                     child: Material(
//                       child: Stack(
//                         children: [
//                           Zoomer(
//                             child: widget.pageBuilder(context),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),),
//             ],
//           );
//   }
// }
