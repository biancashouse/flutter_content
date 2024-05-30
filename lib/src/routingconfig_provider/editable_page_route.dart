import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/snippet_templates.dart';
import 'package:go_router/go_router.dart';

// same as GoRoute, with onExit to dismiss any callouts
class EditableRoute extends GoRoute {
  final SnippetTemplateEnum template;

  EditableRoute({
    required super.path,  // path is also the snippet name
    required this.template,
  }) : super(
          onExit: (BuildContext context, GoRouterState state) async {
            Callout.dismissAll();
            return true;
          },
          builder: (BuildContext context, GoRouterState state) {
            String routePath = state.path ?? 'missing route path!';
            FC().currentRoute = routePath;
            GlobalKey pageGK = GlobalKey();
            return EditablePage(
              key: pageGK,
              routePath: state.path!,
              builder: (context) => SnippetPanel.fromNodes(
                panelName: routePath,
                snippetRootNode: template.clone()..name = state.path!,
              ),
            );
          },
        );
}
