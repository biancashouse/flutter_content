import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

import 'page_bh.dart';
import 'page_home.dart';
import 'page_row_of_2_panels.dart';

final webRoutingConfig = RoutingConfig(
  routes: <RouteBase>[
    EditablePageRoute(
      path: '/',
      child: const Page_Home(),
      routes: [
        EditablePageRoute(
          path: Page_BH.pagePath,
          child: const Page_BH(),
          provideNamedScrollController: true,
        ),
        GoRoute(
          name: 'row-of-2-panels',
          path: 'row-of-2-panels',
          builder: (BuildContext context, GoRouterState state) =>
          const Page_RowOf2Panels(),
        ),
        // GoRoute(
        //   path: '/callout-content-editor',
        //   builder: (BuildContext context, GoRouterState state) =>
        //       CalloutContentEditablePage(
        //         tcAndFrom: state.extra as (TargetModel,String), key: GlobalKey(),)
        // ),
        // GoRoute(
        //     path: '/algorithm-editor',
        //     builder: (BuildContext context, GoRouterState state) =>
        //         AlgorithmEditorPage(flowchartId: state.extra as String?/*flowchart id*/)
        // ),
        // only use DynamicPageRoute to create a templated page
        // DynamicPageRoute(
        //   path: 'snippet-sandbox',
        //   template: SnippetTemplateEnum.empty,
        // ),
      ],
    ),
  ],
);

const mobileRoutingConfig = RoutingConfig(
  routes: <RouteBase>[],
);

final desktopRoutingConfig = webRoutingConfig;
