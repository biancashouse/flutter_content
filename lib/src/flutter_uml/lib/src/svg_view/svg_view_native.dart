import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Native (mobile/desktop) SVG renderer backed by [SvgPicture.network].
class SvgView extends StatelessWidget {
  /// The Kroki SVG URL to load.
  final String url;

  /// Optional widget shown while the SVG is loading.
  final WidgetBuilder? loadingBuilder;

  /// Optional widget shown when loading fails.
  final Widget Function(BuildContext context, Object error)?
      errorBuilder;

  /// Width constraint. Defaults to unconstrained.
  final double? width;

  /// Height constraint. Defaults to unconstrained.
  final double? height;

  /// How to inscribe the SVG into the allocated space. Defaults to [BoxFit.contain].
  final BoxFit fit;

  /// Creates a native SVG view.
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
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      width: width,
      height: height,
      fit: fit,
      placeholderBuilder: loadingBuilder != null
          ? (ctx) => loadingBuilder!(ctx)
          : (ctx) => const Center(child: CircularProgressIndicator()),
    );
  }
}
