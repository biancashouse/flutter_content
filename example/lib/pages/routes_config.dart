

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

import 'page_home.dart';
import 'page_row_of_2_panels.dart';

final webRoutingConfig = RoutingConfig(
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const Page_Home(),
    ),
    GoRoute(
      name: 'row-of-2-panels',
      path: '/row-of-2-panels',
      builder: (BuildContext context, GoRouterState state) => const Page_RowOf2Panels(),
    ),
    DynamicPageRoute(
      path: '/snippet-sandbox',
      template: SnippetTemplateEnum.empty,
    ),
    DynamicPageRoute(
      path: '/editable-scaffold-with-menubar',
      template: SnippetTemplateEnum.scaffold_with_menubar,
    ),
    DynamicPageRoute(
      path: '/editable-scaffold-with-tabbar',
      template: SnippetTemplateEnum.scaffold_with_tabbar,
    ),
    DynamicPageRoute(
      path: '/editable-rich-text',
      template: SnippetTemplateEnum.rich_text,
    ),
  ],
);

const mobileRoutingConfig = RoutingConfig(
  routes: <RouteBase>[],
);

