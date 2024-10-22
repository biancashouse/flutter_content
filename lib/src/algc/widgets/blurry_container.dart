// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// const double kBlur = 3.0;
// const EdgeInsetsGeometry kDefaultPadding = EdgeInsets.all(16);
// const Color kDefaultColor = Colors.transparent;
// const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(20));
// const double kColorOpacity = 0.0;
//
// class BlurryContainer extends StatelessWidget {
//   final Widget? child;
//   final double blur;
//   final double? height, width;
//   final EdgeInsetsGeometry padding;
//   final Color? bgColor;
//
//   final BorderRadius borderRadius;
//
//   //final double colorOpacity;
//
//   const BlurryContainer({
//     Key? key,
//     this.child,
//     this.blur = 50,
//     required this.height,
//     required this.width,
//     this.padding = EdgeInsets.zero,
//     this.bgColor = kDefaultColor,
//     this.borderRadius = kBorderRadius,
//     //this.colorOpacity = kColorOpacity,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return bgColor == null
//         ? Container(
//             height: height!,
//             width: width!,
//             padding: padding,
//             child: child,
//           )
//         : ClipRRect(
//             borderRadius: borderRadius,
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
//               child: Container(
//                 height: height!,
//                 width: width!,
//                 padding: padding,
//                 color: bgColor!,
//                 child: child,
//               ),
//             ),
//           );
//   }
// }
