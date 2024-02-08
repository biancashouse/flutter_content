// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
//
// class PropertiesDrawer extends StatelessWidget {
//   const PropertiesDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) =>
//       BlocBuilder<CAPIBloc, CAPIState>(
//         builder: (context, state) {
//           return FlutterContent().capiBloc.selectedNode != null
//               // properties
//               ? ListView(
//             padding: const EdgeInsets.all(20),
//             children: state.selectedNode!.nodePropertyEditors(context, allowButtonCallouts: false),
//           )
//               // snippet tree
//               : Container(width: 200, height: 700, color:Colors.red);
//           // SnippetTree(
//           //   snippetName: snippetName,
//           //   ancestorHScrollController: ancestorHScrollController,
//           //   ancestorVScrollController: ancestorVScrollController,
//           //   onChangedF: onChangedF,
//           //   onExpiredF: onExpiredF,
//           //   allowButtonCallouts: allowButtonCallouts,
//           // );
//         },
//       );
// }
