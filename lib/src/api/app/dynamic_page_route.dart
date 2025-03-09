import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

// same as GoRoute, with onExit to dismiss any callouts
class DynamicPageRoute extends GoRoute {
  final SnippetTemplateEnum template;

  DynamicPageRoute({
    required super.path, // path is also the snippet name
    required this.template,
  }) : super(
          onExit: (BuildContext context, GoRouterState state) async {
            fco.dismissAll();
            return true;
          },
          builder: (BuildContext context, GoRouterState state) {
            return FutureBuilder<void>(
              future: Future.delayed(Duration.zero),
              builder: (ctx, snap) {
                if (snap.connectionState != ConnectionState.done &&
                    !snap.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  String routePath = state.path ?? 'missing route path!';
                  // fco.currentRoute = routePath;
                  return EditablePage(
                    key: GlobalKey(), // provides access to state later
                    routePath: routePath,
                    child: SnippetPanel.fromNodes(
                      panelName: routePath,
                      snippetRootNode: template.clone()..name = state.path!,
                      scName: routePath,
                    ),
                  );
                }
              },
            );
          },
        );
}
