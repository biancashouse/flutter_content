// // Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// // for details. All rights reserved. Use of this source code is governed by a
// // BSD-style license that can be found in the LICENSE file.
//
// import 'dart:async';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// /// A widget that downloads and displays a PlantUML image from Firebase Storage.
// class PlantUMLImage extends StatefulWidget {
//   /// A reference to the image in Firebase Storage.
//   final Reference ref;
//
//     /// See [Image.errorBuilder]
//   final Widget Function(
//       BuildContext context,
//       Object error, [
//       StackTrace? stackTrace,
//       ])? errorBuilder;
//
//   /// See [NetworkImage.scale]
//   final double scale;
//
//   /// See [Image.alignment]
//   final AlignmentGeometry alignment;
//
//   /// See [Image.network] docs
//   final int? cacheHeight;
//
//   /// See [Image.network] docs
//   final int? cacheWidth;
//
//   /// See [Image.centerSlice]
//   final Rect? centerSlice;
//
//   /// See [Image.color]
//   final Color? color;
//
//   /// See [Image.colorBlendMode]
//   final BlendMode? colorBlendMode;
//
//   /// See [Image.excludeFromSemantics]
//   final bool excludeFromSemantics;
//
//   /// See [Image.filterQuality]
//   final FilterQuality filterQuality;
//
//   /// See [Image.fit]
//   final BoxFit? fit;
//
//   /// See [Image.frameBuilder]
//   final ImageFrameBuilder? frameBuilder;
//
//   /// See [Image.gaplessPlayback]
//   final bool gaplessPlayback;
//
//   /// See [Image.headers]
//   final Map<String, String>? headers;
//
//   /// See [Image.height]
//   final double? height;
//
//   /// See [Image.isAntiAlias]
//   final bool isAntiAlias;
//
//   /// See [Image.loadingBuilder]
//   final ImageLoadingBuilder? loadingBuilder;
//
//   /// See [Image.matchTextDirection]
//   final bool matchTextDirection;
//
//   /// See [Image.repeat]
//   final ImageRepeat repeat;
//
//   /// See [Image.opacity]
//   final Animation<double>? opacity;
//
//   /// See [Image.semanticLabel]
//   final String? semanticLabel;
//
//   /// See [Image.width]
//   final double? width;
//
//   const PlantUMLImage({
//     super.key,
//     required this.ref,
//     this.errorBuilder,
//     this.scale = 1.0,
//     this.alignment = Alignment.center,
//     this.cacheHeight,
//     this.cacheWidth,
//     this.centerSlice,
//     this.color,
//     this.colorBlendMode,
//     this.excludeFromSemantics = false,
//     this.filterQuality = FilterQuality.low,
//     this.fit,
//     this.frameBuilder,
//     this.gaplessPlayback = false,
//     this.headers,
//     this.height,
//     this.isAntiAlias = false,
//     this.loadingBuilder,
//     this.matchTextDirection = false,
//     this.repeat = ImageRepeat.noRepeat,
//     this.opacity,
//     this.semanticLabel,
//     this.width,
//   });
//
//   @override
//   State<PlantUMLImage> createState() => _PlantUMLImageState();
// }
//
// class _PlantUMLImageState extends State<PlantUMLImage>
//     with SingleTickerProviderStateMixin {
//   late Future<String> downloadUrlFuture = widget.ref.getDownloadURL();
//
//   Reference get ref => widget.ref;
//
//   late final ctrl = widget.opacity == null
//       ? AnimationController(
//     vsync: this,
//     duration: 1000.ms,
//   )
//       : null;
//
//   late final Animation<double> opacity = widget.opacity ??
//       CurvedAnimation(
//         parent: ctrl!,
//         curve:  Curves.easeOutExpo,
//       );
//
//   void maybeAnimate() {
//     if (ctrl == null) return;
//     if (ctrl!.isAnimating) return;
//     if (ctrl!.value == 1.0) return;
//
//     ctrl!.forward();
//   }
//
//   bool animationsCompleted = false;
//
//   @override
//   void initState() {
//     super.initState();
//     opacity.addStatusListener(_onOpacityStatus);
//   }
//
//   void _onOpacityStatus(AnimationStatus status) {
//     if (status != AnimationStatus.completed) return;
//     if (animationsCompleted) return;
//
//     setState(() {
//       animationsCompleted = true;
//     });
//   }
//
//   GlobalKey placeholderKey = GlobalKey();
//
//   Widget frameBuilder(
//       BuildContext context,
//       Widget child,
//       int? frame,
//       bool wasSynchronouslyLoaded,
//       ) {
//     if (animationsCompleted) {
//       return child;
//     }
//
//     if (wasSynchronouslyLoaded || frame != null) {
//       maybeAnimate();
//     }
//
//     return child;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: downloadUrlFuture,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           final customError =
//           widget.errorBuilder?.call(context, snapshot.error!);
//           return customError ?? const SizedBox.shrink();
//         }
//
//         if (snapshot.hasData) {
//           return Image.network(
//             snapshot.data as String,
//             scale: widget.scale,
//             alignment: widget.alignment,
//             cacheHeight: widget.cacheHeight,
//             cacheWidth: widget.cacheWidth,
//             centerSlice: widget.centerSlice,
//             color: widget.color,
//             colorBlendMode: widget.colorBlendMode,
//             errorBuilder: widget.errorBuilder,
//             excludeFromSemantics: widget.excludeFromSemantics,
//             filterQuality: widget.filterQuality,
//             fit: widget.fit,
//             frameBuilder: widget.frameBuilder ?? frameBuilder,
//             gaplessPlayback: widget.gaplessPlayback,
//             headers: widget.headers,
//             height: widget.height,
//             isAntiAlias: widget.isAntiAlias,
//             loadingBuilder: widget.loadingBuilder,
//             matchTextDirection: widget.matchTextDirection,
//             repeat: widget.repeat,
//             opacity: opacity,
//             semanticLabel: widget.semanticLabel,
//             width: widget.width,
//           );
//         }
//
//         return (widget.frameBuilder ?? frameBuilder).call(
//           context,
//           Container(),
//           null,
//           false,
//         );
//       },
//     );
//   }
//
//   @override
//   void didUpdateWidget(PlantUMLImage oldWidget) {
//     super.didUpdateWidget(oldWidget);
//
//     if (oldWidget.ref.fullPath != widget.ref.fullPath) {
//       downloadUrlFuture = widget.ref.getDownloadURL();
//     }
//   }
//
//   @override
//   void dispose() {
//     ctrl?.dispose();
//     opacity.removeStatusListener(_onOpacityStatus);
//     super.dispose();
//   }
// }
