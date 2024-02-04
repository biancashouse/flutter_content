// import 'dart:html';
// import 'dart:ui_web' as uiweb;
//
// import 'package:flutter/material.dart';
//
// class GoogleDoc extends StatelessWidget {
//   final String name;
//   final String src;
//   final double iframeW;
//   final double iframeH;
//
//   const GoogleDoc({required this.name, required this.src, required this.iframeW, required this.iframeH, super.key});
//
//   Widget _iframeWidget() => HtmlElementView(key: UniqueKey(), viewType: 'iframeElement');
//
//   @override
//   Widget build(BuildContext context) {
//     // create the iframe
//     final IFrameElement _iframeElement = IFrameElement();
//     _iframeElement.height = iframeH.toString();
//     _iframeElement.width = iframeW.toString();
//     _iframeElement.src = src;
//     _iframeElement.style.width = '${iframeW}px';
//     _iframeElement.style.height = '${iframeH}px';
//     _iframeElement.style.border = 'none';
//     // ignore: undefined_prefixed_name -
//     uiweb.platformViewRegistry.registerViewFactory('iframeElement', (int viewId) => _iframeElement);
//
//     return SizedBox(
//       width: iframeW,
//       height: iframeH,
//       child: _iframeWidget(),
//     );
//   }
// }
