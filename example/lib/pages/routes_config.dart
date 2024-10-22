import 'package:example/pages/page_pagelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

import 'page_home.dart';
import 'page_row_of_2_panels.dart';

final webRoutingConfig = RoutingConfig(
  routes: <RouteBase>[
    EditablePageRoute(
      path: '/',
      child: const Page_Home(),
      routes: [
        EditablePageRoute(
          path: 'pages',
          child: const Page_PageList(),
        ),
        GoRoute(
          name: 'row-of-2-panels',
          path: 'row-of-2-panels',
          builder: (BuildContext context, GoRouterState state) =>
          const Page_RowOf2Panels(),
        ),
        DynamicPageRoute(
          path: 'hotspot-demo',
          template: SnippetTemplateEnum.empty,
        ),
        DynamicPageRoute(
          path: 'snippet-sandbox',
          template: SnippetTemplateEnum.empty,
        ),
        DynamicPageRoute(
          path: 'editable-scaffold-with-menubar',
          template: SnippetTemplateEnum.scaffold_with_menubar,
        ),
        DynamicPageRoute(
          path: 'editable-scaffold-with-tabbar',
          template: SnippetTemplateEnum.scaffold_with_tabs,
        ),
        DynamicPageRoute(
          path: 'editable-rich-text',
          template: SnippetTemplateEnum.rich_text,
        ),
        DynamicPageRoute(
          path: 'md-example',
          template: SnippetTemplateEnum.markdown,
        ),
      ]
    ),
  ],
);

const mobileRoutingConfig = RoutingConfig(
  routes: <RouteBase>[],
);

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}