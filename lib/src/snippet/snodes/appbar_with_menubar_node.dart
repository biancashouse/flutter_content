// // ignore_for_file: constant_identifier_names
// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:gap/gap.dart';
//
// part 'appbar_with_menubar_node.mapper.dart';
//
// @MappableClass()
// class AppBarWithMenuBarNode extends STreeNode with AppBarWithMenuBarNodeMappable {
//   int? bgColorValue;
//   int? fgColorValue;
//   double? height;
//   GenericSingleChildNode? leading;
//   GenericSingleChildNode? title;
//   GenericSingleChildNode? bottom;
//   GenericMultiChildNode? actions;
//
//   AppBarWithMenuBarNode({
//     this.bgColorValue,
//     this.fgColorValue,
//     this.height,
//     this.leading,
//     this.title,
//     this.bottom,
//     this.actions,
//   });
//
//   @override
//   List<PTreeNode> properties(BuildContext context, SNode? parentSNode) {
//     // fco.logger.i("ContainerNode.properties()...");
//     return [
//       DecimalPNode(
//         snode: this,
//         name: 'height',
//         decimalValue: height,
//         onDoubleChange: (newValue) =>
//             refreshWithUpdate(() => height = newValue),
//         calloutButtonSize: const Size(90, 20),
//       ),
//       ColorPNode(
//         snode: this,
//         name: 'bg color',
//         tooltip: "The fill color to use for an app bar's Material.",
//         colorValue: bgColorValue,
//         onColorIntChange: (newValue) =>
//             refreshWithUpdate(() => bgColorValue = newValue),
//         calloutButtonSize: const Size(130, 20),
//       ),
//       ColorPNode(
//         snode: this,
//         name: 'fg color',
//         tooltip: 'The default color for Text and Icons within the app bar.',
//         colorValue: fgColorValue,
//         onColorIntChange: (newValue) =>
//             refreshWithUpdate(() => fgColorValue = newValue),
//         calloutButtonSize: const Size(130, 20),
//       ),
//     ];
//   }
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     try {
//       setParent(parentNode); // propagating parents down from root
//
//       var bottomWidget = bottom?.toWidgetProperty(context, this);
//       if (bottomWidget is! PreferredSizeWidget?) {
//         fco.logger.i("Oops.");
//       }
//       var actionWidgets = actions?.toWidgetProperty(context, this);
//       var titleWidget = title?.toWidgetProperty(context, this);
//
//       try {
//         var appBar = AppBar(
//           key: createNodeGK(),
//           title: titleWidget,
//           toolbarHeight: height,
//           bottom: bottomWidget as PreferredSizeWidget?,
//           actions: actionWidgets,
//           backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
//           foregroundColor: fgColorValue != null ? Color(fgColorValue!) : null,
//         );
//         return height != null
//             ? PreferredSize(
//                 preferredSize: Size.fromHeight(height!), child: appBar)
//             : appBar;
//       } catch (e) {
//         fco.logger.i('AppBarNode.toWidget() failed!');
//         return Material(
//           textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Icon(Icons.error, color: Colors.red),
//                 const Gap(10),
//                 fco.coloredText(e.toString()),
//               ],
//             ),
//           ),
//         );
//       }
//     } catch (e) {
//       return Error(
//           key: createNodeGK(),
//           FLUTTER_TYPE,
//           color: Colors.red,
//           size: 16,
//           errorMsg: e.toString());
//     }
//   }
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
//   static const String FLUTTER_TYPE = "AppBar+MenuBar";
// }
