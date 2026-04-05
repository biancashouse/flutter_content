import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

/// Web SVG renderer using a native browser [HTMLImageElement] via [HtmlElementView].
///
/// Using an `<img>` element rather than [SvgPicture] avoids CSS rendering
/// limitations in flutter_svg and lets the browser handle complex SVGs
/// (including Mermaid diagrams with embedded `<style>` blocks) correctly.
class SvgView extends StatefulWidget {
  /// The Kroki SVG URL to load.
  final String url;

  /// Optional widget shown while the SVG is loading.
  ///
  /// On web the browser controls loading; this builder is ignored.
  // ignore: unused_field
  final WidgetBuilder? loadingBuilder;

  /// Optional widget shown when loading fails.
  ///
  /// On web the browser controls error display; this builder is ignored.
  // ignore: unused_field
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  /// Width constraint. Defaults to unconstrained.
  final double? width;

  /// Height constraint. Defaults to unconstrained.
  final double? height;

  /// How to inscribe the SVG into the allocated space. Defaults to [BoxFit.contain].
  final BoxFit fit;

  /// Creates a web SVG view.
  const SvgView({
    super.key,
    required this.url,
    this.loadingBuilder,
    this.errorBuilder,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  State<SvgView> createState() => _SvgViewState();
}

class _SvgViewState extends State<SvgView> {
  static bool _registered = false;
  static const String _viewType = 'flutter_uml__svg_view';

  @override
  void initState() {
    super.initState();
    if (!_registered) {
      ui_web.platformViewRegistry.registerViewFactory(
        _viewType,
        (int viewId, {Object? params}) {
          final p = params as Map<Object?, Object?>;
          final img = web.HTMLImageElement()
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.objectFit = (p['objectFit'] as String?) ?? 'contain';
          final url = p['url'] as String?;
          if (url != null && url.isNotEmpty) {
            img.src = url;
          }
          return img;
        },
      );
      _registered = true;
    }
  }

  String _objectFitFromBoxFit(BoxFit fit) {
    switch (fit) {
      case BoxFit.fill:
        return 'fill';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fitWidth:
        return 'scale-down';
      case BoxFit.fitHeight:
        return 'scale-down';
      case BoxFit.none:
        return 'none';
      case BoxFit.contain:
      case BoxFit.scaleDown:
        return 'contain';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(
        key: ValueKey(widget.url),
        viewType: _viewType,
        creationParams: {
          'url': widget.url,
          'objectFit': _objectFitFromBoxFit(widget.fit),
        },
      ),
    );
  }
}
