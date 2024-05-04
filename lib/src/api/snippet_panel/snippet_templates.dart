// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_axis.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/snippet/snodes/edgeinsets_node_value.dart';

enum SnippetTemplate {
  empty_snippet,
  scaffold_with_tabs,
  scaffold_with_menubar,
  scaffold_with_actions,
  target_content_widget,
  splitview_with_2_images,
  column_with_2_images,
  splitview_with_2_snippets,
  column_with_2_snippets,
  save_as_snippet_test,
  failed_to_load,
}

List<SnippetRootNode> templates = [
  // empty snippet for test only
  SnippetRootNode(
      name: SnippetTemplate.empty_snippet.name, child: PlaceholderNode()),
  // SnippetRootNode(
  //   name: SnippetTemplate.target_content_widget.name,
  //   // child: SizedBoxNode(
  //   //     width: 200,
  //   //     height: 150,
  //   //     child: ContainerNode(fillColorValues: UpTo6ColorValues(
  //   //       color1Value: Colors.white.value,
  //   //     ))),
  // ),
  // Scaffold with a TabBar in its AppBar bottom
  SnippetRootNode(
    name: SnippetTemplate.scaffold_with_tabs.name,
    child: ScaffoldNode(
      appBar: AppBarNode(
        bgColorValue: Colors.grey.value,
        title: GenericSingleChildNode(
            propertyName: 'title', child: TextNode(text: 'my title')),
        bottom: GenericSingleChildNode(
          propertyName: 'bottom',
          child: TabBarNode(
            children: [
              TextNode(text: 'tab 1'),
              TextNode(text: 'Tab 2'),
            ],
          ),
        ),
      ),
      body: GenericSingleChildNode(
        propertyName: 'body',
        child: TabBarViewNode(
          children: [
            PlaceholderNode(
                centredLabel: 'page 1', colorValue: Colors.yellow.value),
            PlaceholderNode(
                centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
          ],
        ),
      ),
    ),
  ),
  // Scaffold with a MenuBar in its AppBar bottom
  SnippetRootNode(
    name: SnippetTemplate.scaffold_with_menubar.name,
    child: ScaffoldNode(
      appBar: AppBarNode(
        bgColorValue: Colors.grey.value,
        title: GenericSingleChildNode(
            propertyName: 'title', child: TextNode(text: 'my title')),
        bottom: GenericSingleChildNode(
          propertyName: 'bottom',
          child: MenuBarNode(children: [
            MenuItemButtonNode(itemLabel: 'item 1'),
            MenuItemButtonNode(itemLabel: 'item 2'),
            MenuItemButtonNode(itemLabel: 'item 3'),
          ]),
        ),
      ),
      body: GenericSingleChildNode(
        propertyName: 'body',
        child: PlaceholderNode(
            name: 'body-placeholder', centredLabel: 'menu item destination'),
      ),
    ),
  ),
  SnippetRootNode(
    name: SnippetTemplate.scaffold_with_actions.name,
    child: ScaffoldNode(
      appBar: AppBarNode(
        bgColorValue: Colors.grey.value,
        title: GenericSingleChildNode(
            propertyName: 'title', child: TextNode(text: 'my title')),
        actions: GenericMultiChildNode(propertyName: 'actions', children: [
          FilledButtonNode(child: TextNode(text: 'action 1')),
          FilledButtonNode(child: TextNode(text: 'action 2')),
          FilledButtonNode(child: TextNode(text: 'action 3')),
        ]),
      ),
      body: GenericSingleChildNode(
        propertyName: 'body',
        child: PlaceholderNode(
            name: BODY_PLACEHOLDER, centredLabel: 'menu item destination'),
      ),
    ),
  ),
  // tab bar with 1st tab view containing a splitview of 2 embedded snippets
  SnippetRootNode(
    name: SnippetTemplate.splitview_with_2_images.name,
    child: SplitViewNode(
      axis: AxisEnum.vertical,
      children: [
        SizedBoxNode(
          child: CenterNode(
            child: AssetImageNode(name: 'assets/images/bridging-the-gap-logo.jpeg'),
          ),
        ),
        SizedBoxNode(
          child: CenterNode(
            child: HotspotsNode(
              child: AssetImageNode(name: 'assets/images/top-cat-gang.png'),
            ),
          ),
        ),
      ],
    ),
  ),
  SnippetRootNode(
    name: SnippetTemplate.column_with_2_images.name,
    child: ColumnNode(
      mainAxisSize: MainAxisSizeEnum.max,
      children: [
        SizedBoxNode(
          child: CenterNode(
            child: AssetImageNode(name: 'assets/images/bridging-the-gap-logo.jpeg'),
          ),
        ),
        SizedBoxNode(
          child: CenterNode(
            child: HotspotsNode(
              child: AssetImageNode(name: 'assets/images/top-cat-gang.png'),
            ),
          ),
        ),
      ],
    ),
  ),
  SnippetRootNode(
    name: SnippetTemplate.save_as_snippet_test.name,
    child: ContainerNode(
      padding: EdgeInsetsValue(top: 30, left: 30, bottom: 30, right: 30),
      child: CenterNode(
        child: AssetImageNode(name: 'assets/images/bridging-the-gap-logo.jpeg'),
      ),
    ),
  ),
  SnippetRootNode(
    name: SnippetTemplate.failed_to_load.name,
    child: ContainerNode(
      padding: EdgeInsetsValue(top: 6, left: 6, bottom: 6, right: 6),
      child: TextNode(text: 'Failed to load snippet'),
    ),
  ),
];
