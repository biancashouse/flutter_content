import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

// same as GoRoute, with onExit to dismiss any callouts
class FCRoute extends GoRoute {
  final WidgetBuilder widgetBuilder;

  FCRoute({
    required super.name,
    required super.path,
    required this.widgetBuilder,  // builder and pageBuilder are already decl by GoRoute class
  }) : super(
          onExit: (
            BuildContext context,
            GoRouterState state,
          ) async {
            Callout.dismissAll();
            return true;
          },
          builder: (BuildContext context, GoRouterState state) {
            return FlutterContentPage(
              key: FC().pageGKs['fc-demo2'] = GlobalKey(),
              pageName: name ?? 'must specify page name!',
              pageBuilder: widgetBuilder,
            );
          },
        );
}
