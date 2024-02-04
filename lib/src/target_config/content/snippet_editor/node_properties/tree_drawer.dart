// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/callout_snippet_tree.dart';
// import 'package:pointer_interceptor/pointer_interceptor.dart';
//
// class TreeDrawer extends StatelessWidget {
//   const TreeDrawer({super.key});
//
//   static hideDrawer() {
//     CAPIBloc.I.add(CAPIEvent.hideSnippetTree());
//     unhideAllSingleTargetBtns();
//     // CAPIBloc.I.add(const CAPIEvent.hideAllTargetGroupBtns());
//     // CAPIBloc.I.add(const CAPIEvent.hideTargetGroupsExcept());
//   }
//
//   @override
//   Widget build(BuildContext context) => BlocBuilder<CAPIBloc, CAPIState>(builder: (context, state) {
//         if (state.showingSnippetTree == null) {
//           return const Offstage();
//         }
//
//         return PointerInterceptor(
//           child: Drawer(
//             child: Container(
//               color:Colors.black,
//               width: 300,
//               child: SnippetTree(
//                 snippetName: state.showingSnippetTree!,
//                 // ancestorHScrollController: ancestorHScrollController,
//                 // ancestorVScrollController: ancestorVScrollController,
//                 // allowButtonCallouts: allowButtonCallouts,
//               ),
//             ),
//           ),
//         );
//       });
// }
