import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

// same as GoRoute, with onExit to dismiss any callouts
class EditablePageRoute extends GoRoute {
  final Widget child;

  EditablePageRoute({
    required super.path, // path is also the snippet name
    required this.child,
  }) : super(
          onExit: (BuildContext context, GoRouterState state) async {
            return true;
          },
          builder: (BuildContext context, GoRouterState state) {
            return FutureBuilder<void>(
              future: fco.initLocalStorage(),
              builder: (ctx, snap) {
                if (snap.connectionState != ConnectionState.done &&
                    !snap.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  String routePath = state.path ?? 'missing route path!';
                  fco.currentRoute = routePath;
                  return EditablePage(
                    key: GlobalKey(), // provides access to state later
                    routePath: state.path!,
                    child: child,
                  );
                }
              },
            );
          },
        );
}
