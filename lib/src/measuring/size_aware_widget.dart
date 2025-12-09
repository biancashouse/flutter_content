import 'dart:convert'; // Import for base64Decode

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';

/// written by Gemini ;-)
///
/// A widget that measures the final rendered size of its child
/// and reports it via the [onSizeAvailable] callback.
///
/// This is particularly useful for measuring widgets whose size is not
/// known during the first build frame, such as images loaded from the
/// network, assets, or memory (base64).
class SizeAwareWidget extends StatefulWidget {
  /// The child widget to measure.
  final Widget child;

  /// A callback that is invoked when the child widget has been rendered
  /// and its final size is available.
  final Function(Size) onSizeAvailable;

  const SizeAwareWidget({
    super.key,
    required this.child,
    required this.onSizeAvailable,
  });

  /// Factory constructor to easily create a SizeAwareWidget for a network image.
  ///
  /// The [onSizeAvailable] callback will be triggered after the image
  /// from [imageUrl] has been successfully downloaded and rendered.
  factory SizeAwareWidget.network({
    required String imageUrl,
    double? scale,
    BoxFit? fit,
    Alignment? alignment,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    Key? key,
    required Function(Size) onSizeAvailable,
    Widget? loadingWidget,
  }) {
    return SizeAwareWidget(
      key: key,
      onSizeAvailable: onSizeAvailable,
      child: Image.network(
        imageUrl,
        scale: scale ?? 1.0,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        errorBuilder: errorBuilder,
        // The frameBuilder is used to detect when the image is ready.
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          // Returning the child (the image) is essential.
          return child;
        },
        // A loading builder provides a better user experience.
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return loadingWidget ??
              const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  /// Factory constructor to easily create a SizeAwareWidget for a network image.
  ///
  /// The [onSizeAvailable] callback will be triggered after the image
  /// from [imageUrl] has been successfully downloaded and rendered.
  factory SizeAwareWidget.storage({
    required String fsFullPath,
    double? width,
    double? height,
    double? scale,
    BoxFit? fit,
    Alignment? alignment,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    Key? key,
    required Function(Size) onSizeAvailable,
    Widget? loadingWidget,
  }) {
    return SizeAwareWidget(
      key: key,
      onSizeAvailable: onSizeAvailable,
      child: StorageImage(
        fit: fit,
        width: width,
        height: height,
        scale: scale ?? 1.0,
        alignment: alignment ?? Alignment.center,
        ref: FirebaseStorage.instance.ref(
          fsFullPath, // ?? 'gs://${fco.firebaseOptions!.storageBucket}/flutter-content-pkg/missing-image.png',
        ),
      ),
    );
  }

  /// Factory constructor to easily create a SizeAwareWidget for an asset image.
  ///
  /// The [onSizeAvailable] callback will be triggered after the image
  /// from [assetPath] has been loaded and rendered.
  factory SizeAwareWidget.asset({
    required String assetPath,
    double? scale,
    BoxFit? fit,
    Alignment? alignment,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    Key? key,
    required Function(Size) onSizeAvailable,
  }) {
    return SizeAwareWidget(
      key: key,
      onSizeAvailable: onSizeAvailable,
      child: Image.asset(
        assetPath,
        scale: scale,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        errorBuilder: errorBuilder,
        // frameBuilder is still useful for consistency, especially with animated GIFs.
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
      ),
    );
  }

  /// Factory constructor to easily create a SizeAwareWidget for a base64-encoded image.
  ///
  /// The [onSizeAvailable] callback will be triggered after the image
  /// from the [base64String] has been decoded and rendered.
  factory SizeAwareWidget.base64({
    required String base64String,
    Key? key,
    required Function(Size) onSizeAvailable,
    Widget? errorWidget,
  }) {
    return SizeAwareWidget(
      key: key,
      onSizeAvailable: onSizeAvailable,
      child: Image.memory(
        base64Decode(base64String),
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ?? const Icon(Icons.error, color: Colors.red);
        },
      ),
    );
  }

  @override
  State<SizeAwareWidget> createState() => _SizeAwareWidgetState();
}

class _SizeAwareWidgetState extends State<SizeAwareWidget> {
  @override
  void initState() {
    super.initState();
    // addPostFrameCallback ensures that we try to measure the size *after*
    // the first frame has been painted. This is crucial for all widget types.
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureSize());
  }

  @override
  void didUpdateWidget(SizeAwareWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the child widget identity changes, we should re-measure after the next frame.
    if (widget.child != oldWidget.child) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureSize());
    }
  }

  void _measureSize() {
    if (mounted) {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        // The size is now available, so we invoke the callback.
        widget.onSizeAvailable(renderBox.size);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // We simply return the child. The magic happens in the post-frame callback.
    return widget.child;
  }
}
