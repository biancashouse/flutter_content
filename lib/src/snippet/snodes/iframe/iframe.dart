// import 'package:flutter/material.dart';
// import 'dart:ui';
//
//
// class IFrame extends StatefulWidget {
//   final String name;
//   final String src;
//   final double iframeW;
//   final double iframeH;
//   final bool forceRefresh;
//
//   const IFrame({required this.name, required this.src, required this.iframeW, required this.iframeH, this.forceRefresh = false, super.key});
//
//   @override
//   State<IFrame> createState() => _IFrameState();
// }
//
// class _IFrameState extends State<IFrame> {
//   late IFrameElement _iframeElement;
//   late Widget _iframeWidget;
//   late bool _keepAlive = true;
//
//   // @override
//   // bool get wantKeepAlive => _keepAlive;
//
//   @override
//   void initState() {
//     super.initState();
//
//     fco.logger.i("IFrame initState");
//
//     _iframeElement = IFrameElement();
//     _iframeElement.src = widget.src;
//     _iframeElement.style.border = 'none';
//     // ignore: undefined_prefixed_name -
//     uiweb.platformViewRegistry.registerViewFactory('iframeElement', (int viewId) => _iframeElement);
//
//
//     _keepAlive = !widget.forceRefresh;
//     // updateKeepAlive();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //super.build(context);
//     _iframeElement.height = widget.iframeH.toString();
//     _iframeElement.width = widget.iframeW.toString();
//     _iframeElement.style.width = '${widget.iframeW}px';
//     _iframeElement.style.height = '${widget.iframeH}px';
//     _iframeWidget = HtmlElementView(key: UniqueKey(), viewType: 'iframeElement');
//     return ConstrainedBox(
//       constraints: BoxConstraints(minWidth: widget.iframeW, minHeight: widget.iframeH),
//       child: _iframeWidget,
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

const String iframeHTML = '''
    <html>
      <body>
        <iframe src="https://www.example_using_go_router.com" width="100%" height="100%"></iframe>
      </body>
    </html>
  ''';

class IFrame extends StatelessWidget {
  // final String name;
  final String src;
  final double iframeW;
  final double iframeH;

  const IFrame({
    // required this.name,
    this.src = 'http://example_using_go_router.com',
    required this.iframeW,
    required this.iframeH,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var navigationParams = const PlatformNavigationDelegateCreationParams();
    var controllerParams = const PlatformWebViewControllerCreationParams();
    var controller = PlatformWebViewController(controllerParams)
      // ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        LoadRequestParams(
          uri: Uri.parse(src),
        ),
      );
    var gestureRecognizers = <Factory<OneSequenceGestureRecognizer>>{
      Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
      ),
    };
    var widgetParams = PlatformWebViewWidgetCreationParams(
      controller: controller,
      gestureRecognizers: gestureRecognizers,
    );
    var webViewWidget = PlatformWebViewWidget(widgetParams);

    return webViewWidget.build(context);
  }
}
