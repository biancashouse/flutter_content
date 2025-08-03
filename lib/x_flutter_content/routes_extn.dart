import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

extension RoutesExtension on FlutterContentMixins {
  // extract go routes
  void parseRouteConfig(List<String> names, List<RouteBase> routes) {
    for (var route in routes) {
      if (route is GoRoute && route.name != null) names.add(route.name!);
      parseRouteConfig(names, route.routes);
    }
  }

  void addSubRoute({
    required String newPath,
    required SnippetTemplateEnum template,
  }) {
    List<RouteBase> subRoutes = routingConfigVN.value.routes;
    if (!newPath.endsWith(' missing')) {
      subRoutes.add(DynamicPageRoute(path: newPath, template: template));
    }
  }

  void deleteSubRoute({required String path}) {
    List<RouteBase> subRoutes = routingConfigVN.value.routes;
    for (RouteBase sr in subRoutes) {
      if (sr is GoRoute && sr.path == path) {
        subRoutes.remove(sr);
      }
    }
  }

  List<String> get pageList {
    List<RouteBase> allRoutes = [];

    void routes(List<RouteBase> parentRoutes) {
      for (RouteBase route in parentRoutes) {
        allRoutes.add(route);
        if (route.routes.isNotEmpty) {
          routes(route.routes);
        }
      }
    }

    routes(routingConfigVN.value.routes);

    return allRoutes
        .map((route) {
          String path = (route as GoRoute).path;
          return path.startsWith('/') ? path : '/$path';
        })
        .toList()
        .where((routePath) => !appInfo.sandboxPageNames.contains(routePath))
        .toList();
  }
}
