// // ignore_for_file: constant_identifier_names
// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:gap/gap.dart';
//
// part 'appbar_with_tabbar_node.mapper.dart';
//
// @MappableClass()
// class AppBarWithTabBarNode extends STreeNode with AppBarWithTabBarNodeMappable {
//   String tabBarName;
//   int? bgColorValue;
//   int? fgColorValue;
//   double? height;
//   GenericSingleChildNode? leading;
//   GenericSingleChildNode? title;
//   TabBarNode bottom;
//   GenericMultiChildNode? actions;
//
//   AppBarWithTabBarNode({
//     required this.tabBarName,
//     this.bgColorValue,
//     this.fgColorValue,
//     this.height,
//     this.leading,
//     this.title,
//     required this.bottom,
//     this.actions,
//   });
//
//   @override
//   List<PTreeNode> properties(BuildContext context, SNode? parentSNode) {
//     // fco.logger.i("ContainerNode.properties()...");
//     return [
//       StringPNode(
//         snode: this,
//         name: 'TabBar name',
//         stringValue: tabBarName,
//         skipHelperText: true,
//         onStringChange: (newValue) =>
//             refreshWithUpdate(() => tabBarName = newValue!),
//         calloutButtonSize: const Size(280, 70),
//         calloutWidth: 400,
//         numLines: 1,
//       ),
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
//       // find scaffold node
//       // add a back button if scaffold has tabs
//       SnippetPanelState? spState = SnippetPanel.of(context);
//       Widget leadingWidget() {
//         if (spState != null) {
//           TabBarNode? tabBarNode = spState.tabBars[tabBarName];
//           if (tabBarNode?.prevTabQ.isNotEmpty ?? false) {
//             return IconButton(
//               onPressed: () {
//                 if (tabBarNode?.prevTabQ.isNotEmpty ?? false) {
//                   int prev = tabBarNode!.prevTabQ.removeLast();
//                   tabBarNode.backBtnPressed = true;
//                   tabBarNode.tabC?.index = prev;
//                   tabBarNode.prevTabQSize.value = tabBarNode.prevTabQ.length;
//                   fco.logger.i("back to tab: $prev,  ${tabBarNode.prevTabQ.toString()}");
//                 }
//               },
//               icon: const Icon(Icons.arrow_back),
//             );
//           } else {
//             return const Offstage();
//           }
//         } else {
//           return const Offstage();
//         }
//       }
//
//       var actionWidgets = actions?.toWidgetProperty(context, this);
//       var titleWidget = title?.toWidgetProperty(context, this);
//
//       try {
//         TabBarNode? tabBarNode = spState?.tabBars[tabBarName];
//         var appBar = AppBar(
//           key: createNodeGK(),
//           leading: leading != null && tabBarNode != null
//               ? ListenableBuilder(
//                   listenable: tabBarNode!.prevTabQSize,
//                   builder: (_, __) => leadingWidget())
//               : null,
//           title: titleWidget,
//           toolbarHeight: height,
//           bottom: bottom.toWidget(context, this),
//           actions: actionWidgets,
//           backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
//           foregroundColor: fgColorValue != null ? Color(fgColorValue!) : null,
//         );
//         return height != null
//             ? PreferredSize(
//                 preferredSize: Size.fromHeight(height!), child: appBar)
//             : appBar;
//       } catch (e) {
//         fco.logger.i('AppBarWithTabBarNode.toWidget() failed!');
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
//   static const String FLUTTER_TYPE = "AppBar+TabBar";
// }
