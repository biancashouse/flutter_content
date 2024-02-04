// // ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
//
// class C_MenuItemDestinationPanel extends StatefulWidget {
//   final SnippetName sName;
//   final double width;
//   final double height;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   C_MenuItemDestinationPanel({
//     required this.sName,
//     required this.width,
//     required this.height,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//   });
//
//   @override
//   State<C_MenuItemDestinationPanel> createState() => MenuItemPanelState();
// }
//
// class MenuItemPanelState extends State<C_MenuItemDestinationPanel> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   Useful.instance.initWithContext(context, force: true);
//   //   super.didChangeDependencies();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(width: 1, color: Colors.purpleAccent, style: BorderStyle.solid),
//       ),
//       child: BlocBuilder<CAPIBloC, CAPIState>(builder: (context, state) {
//         STreeNode? selectedMenuItemNode = CAPIBloC.selectedNode;
//         if (selectedMenuItemNode is MenuItemButtonNode) {
//           // String miSnippetName = selectedMenuItemNode.destinationSnippetName;
//           // return SnippetPanel(sName: widget.sName);
//         }
//         return const Icon(Icons.warning, color: Colors.red);
//       }),
//     );
//   }
// }
