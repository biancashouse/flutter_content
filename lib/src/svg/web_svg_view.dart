// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui_web' as ui_web;
// import 'package:web/web.dart' as web;
//
// class WebSvgView extends StatefulWidget {
//   final String url;
//
//   const WebSvgView({super.key, required this.url});
//
//   @override
//   State<WebSvgView> createState() => _WebSvgViewState();
// }
//
// class _WebSvgViewState extends State<WebSvgView> {
//   static bool _registered = false;
//   static const String _viewType = 'kroki-svg-view';
//
//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb && !_registered) {
//       ui_web.platformViewRegistry.registerViewFactory(
//         _viewType,
//         (int viewId, {Object? params}) {
//           final img = web.HTMLImageElement()
//             ..style.width = '100%'
//             ..style.height = '100%'
//             ..style.objectFit = 'contain';
//           if (params is String) {
//             img.src = params;
//           }
//           return img;
//         },
//       );
//       _registered = true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!kIsWeb) {
//       return const Center(child: Text('Only supported on Web'));
//     }
//
//     return HtmlElementView(
//       key: ValueKey(widget.url),
//       viewType: _viewType,
//       creationParams: widget.url,
//     );
//   }
// }
