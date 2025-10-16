import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

// same as GoRoute, with onExit to dismiss any callouts
class EditablePageRoute extends GoRoute {
  final Widget? child;
  final bool zoomable;
  // final bool provideNamedScrollController;

  static final Map<String, EditablePage> pages = {};

  EditablePageRoute({
    required super.path, // path is also the snippet name
    this.child,
    this.zoomable = true,
    // this.provideNamedScrollController = false,
    super.routes,
  }) : super(
         onExit: (BuildContext context, GoRouterState state) async {
           fco.dismissAll();
           return true;
         },
         builder: (BuildContext context, GoRouterState state) {
           return FutureBuilder<void>(
             future: Future.delayed(Duration.zero),
             builder: (ctx, snap) {
               if (snap.connectionState != ConnectionState.done && !snap.hasData) {
                 return const CircularProgressIndicator();
               } else {
                 if (state.path == null) {
                   return const Text('EditablePageRoute - missing route path!');
                 } else {
                   return pages[state.path!] ??= EditablePage(
                     key: ValueKey<String>(path), // provides access to state later
                     routePath: state.path!,
                     // zoomable: zoomable,
                     // provideNamedScrollController: provideNamedScrollController,
                     child: child ?? SnippetBuilder.fromNodes(
                       // panelName: state.path!,
                       snippetRootNode: SnippetRootNode(name: state.path!, child: PlaceholderNode()),
                       scName: state.path!,
                     ),
                   );
                 }
               }
             }
           );
         },
       );
}
