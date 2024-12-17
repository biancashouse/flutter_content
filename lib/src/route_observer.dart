import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    fco.dismissAll();
    if (FlutterContentApp.snippetBeingEdited != null) {
      FlutterContentApp.capiBloc.add(PopSnippetEditor());
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // print('MyTest didRemove: $route');
    fco.dismissAll();
    if (FlutterContentApp.snippetBeingEdited != null) {
      FlutterContentApp.capiBloc.add(PopSnippetEditor());
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('MyTest didReplace: $newRoute');
  }
}
