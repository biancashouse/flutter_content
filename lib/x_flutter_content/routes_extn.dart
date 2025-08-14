import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/pages.dart';
import 'package:flutter_content/src/route_observer.dart';
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
    // required SnippetTemplateEnum template,
  }) {
    List<RouteBase> subRoutes = routingConfigVN.value.routes;
    if (!newPath.endsWith(' missing')) {
      subRoutes.add(EditablePageRoute(path: newPath));
    }
  }

  void deleteSubRoute({required String path}) {
    List<RouteBase> subRoutes = routingConfigVN.value.routes;
    for (RouteBase sr in subRoutes) {
      if (sr is GoRoute && sr.path == path) {
        subRoutes.remove(sr);
      }
    }
    pageList.remove(path);
  }

  void get populatePageList {
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

    pageList = allRoutes
        .map((route) {
          String path = (route as GoRoute).path;
          return path.startsWith('/') ? path : '/$path';
        })
        // .toList()
        // .where((routePath) => !appInfo.userEditablePages.contains(routePath))
        .toList();
  }

  void addDynamicPages() {
    // add more routes from the snippet names to below the "/" route
    // RouteBase home = routingConfig.routes.first;
    for (String snippetName in appInfo.snippetNames) {
      if (snippetName.startsWith('/') && !pageList.contains(snippetName)) {
        addSubRoute(newPath: snippetName);
        pageList.add(snippetName);
      }
    }
  }

  void initRouter(RoutingConfig routingConfig, String initialRoutePath) {
    routingConfigVN = ValueNotifier<RoutingConfig>(routingConfig);
    router = GoRouter.routingConfig(
      navigatorKey: fco.globalNavigatorKey,
      debugLogDiagnostics: false,
      initialLocation: initialRoutePath,
      routingConfig: routingConfigVN,

      // onException: (_, GoRouterState state, GoRouter router) {
      //   router.go('/404', extra: state.uri.toString());
      // },

      // when page not found by router
      errorBuilder: (context, state) {
        String matchedLocation = state.matchedLocation;
        // var param = state.pathParameters;

        // implicit built-in page
        if (matchedLocation == '/pages') {
          if (fco.canEditContent()) {
            return Pages();
          } else {
            return AlertDialog(
              title: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                child: fco.coloredText(
                  'Viewing the Page list:\nYou must be signed in as an editor !',
                  color: Colors.red,
                ),
              ),
            );
          }
        }
        // may have already been created (incl content callout snippets)

        final snippetNames = appInfo.snippetNames;
        bool dynamicPageExists = snippetNames.contains(matchedLocation);

        // if (dynamicPageExists) {
        //   EditablePage.removeAllNodeWidgetOverlays();
        //   // fco.dismiss('exit-editMode');
        //   final snippetName = matchedLocation;
        //   final rootNode = SnippetTemplateEnum.empty.clone()
        //     ..name = snippetName;
        //   SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
        //     snippetName: snippetName,
        //     templateSnippetRootNode: rootNode,
        //   );
        //   final dynamicPage = EditablePage(
        //     key: GlobalKey(), // provides access to state later
        //     routePath: matchedLocation,
        //     child: SnippetPanel.fromSnippet(
        //       panelName: "dynamic panel",
        //       snippetName: snippetName,
        //       scName: null,
        //       key: ValueKey<String>(snippetName),
        //     ),
        //   );
        //   return dynamicPage;
        // }

        // // page doesn't exist yet
        // // editor can ask to create it
        // if (canEditContent()) {
        //   return AlertDialog(
        //     title: Text('Page "$matchedLocation" does not Exist !'),
        //     content: SingleChildScrollView(
        //       child: ListBody(
        //         children: const <Widget>[Text('Want to create it now ?')],
        //       ),
        //     ),
        //     actions: <Widget>[
        //       TextButton(
        //         child: Text('Yes, Create page $matchedLocation'),
        //         onPressed: () {
        //           final String destUrl = matchedLocation;
        //           EditablePage.removeAllNodeWidgetOverlays();
        //           // fco.dismiss('exit-editMode');
        //           // bool userCanEdit = canEditContent.isTrue;
        //           final snippetName = destUrl;
        //           final rootNode = SnippetTemplateEnum.empty.clone()
        //             ..name = snippetName;
        //           SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
        //             snippetName: snippetName,
        //             templateSnippetRootNode: rootNode,
        //           ).then((_) {
        //             afterNextBuildDo(() {
        //               // SnippetInfoModel.snippetInfoCache;
        //               router.push(destUrl);
        //               // router.go('/');
        //             });
        //           });
        //         },
        //       ),
        //       TextButton(
        //         child: const Text('Cancel'),
        //         onPressed: () {
        //           context.go('/');
        //         },
        //       ),
        //     ],
        //   );
        // }

        // dynamic user-editable page
        /*    if (fco.appInfo.userEditablePages.contains(matchedLocation)) {
          final String destUrl = matchedLocation;
          EditablePage.removeAllNodeWidgetOverlays();
          // fco.dismiss('exit-editMode');
          // bool userCanEdit = canEditContent.isTrue;
          final snippetName = destUrl;
          final rootNode = SnippetTemplateEnum.empty.clone()
            ..name = snippetName;
          SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
            snippetName: snippetName,
            templateSnippetRootNode: rootNode,
          ).then((_) {
            afterNextBuildDo(() {
              // SnippetInfoModel.snippetInfoCache;
              router.push(destUrl);
              // router.go('/');
            });
          });
        }
*/
        return AlertDialog(
          title: const Text('Page does not Exist !'),
          content: ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('go back'),
          ),
        );
      },
      observers: [GoRouterObserver()],
    );
  }
}
