// ignore_for_file: camel_case_types

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';

part 'snippet_templates.mapper.dart';

@MappableEnum()
enum SnippetTemplateEnum {
  empty,
  scaffold_with_tabbar,
  scaffold_with_menubar,
  splitview_with_2_placeholders,
  column_with_2_placeholders,
  rich_text,
  callout_content;

  Widget toMenuItem() => FContent().coloredText(_menuItem(), color: Colors.white);

  String _menuItem() => switch (this) {
        SnippetTemplateEnum.empty => 'placeholder',
        SnippetTemplateEnum.scaffold_with_tabbar => 'scaffold with a tab bar',
        SnippetTemplateEnum.scaffold_with_menubar => 'scaffold with a menu bar',
        SnippetTemplateEnum.splitview_with_2_placeholders => 'splitview with 2 placeholders',
        SnippetTemplateEnum.column_with_2_placeholders => 'column with 2 placeholders',
        SnippetTemplateEnum.rich_text => 'rich text',
        SnippetTemplateEnum.callout_content => 'callout contents'
      };

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(280, 80),
        calloutSize: Size(300, values.length * 80),
      );

  SnippetRootNode templateSnippet() => switch (this) {
        //
        SnippetTemplateEnum.empty => SnippetRootNode(name: SnippetTemplateEnum.empty.name, child: PlaceholderNode()),
        //
        SnippetTemplateEnum.scaffold_with_tabbar => SnippetRootNode(
            name: SnippetTemplateEnum.scaffold_with_tabbar.name,
            child: ScaffoldNode(
              appBar: AppBarNode(
                bgColorValue: Colors.grey.value,
                title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
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
                    PlaceholderNode(),
                    PlaceholderNode(),
                  ],
                ),
              ),
            ),
          ),
        //
        SnippetTemplateEnum.scaffold_with_menubar => SnippetRootNode(
            name: SnippetTemplateEnum.scaffold_with_menubar.name,
            child: ScaffoldNode(
              appBar: AppBarNode(
                bgColorValue: Colors.grey.value,
                title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
                bottom: GenericSingleChildNode(
                  propertyName: 'bottom',
                  child: MenuBarNode(children: [
                    MenuItemButtonNode(child: TextNode(text:'item 1')),
                    MenuItemButtonNode(child: TextNode(text:'item 2')),
                    MenuItemButtonNode(child: TextNode(text:'item 3')),
                  ]),
                ),
              ),
              body: GenericSingleChildNode(
                propertyName: 'body',
                child: PlaceholderNode(name: 'body-placeholder'),
              ),
            ),
          ),
        //
        SnippetTemplateEnum.splitview_with_2_placeholders => SnippetRootNode(
            name: SnippetTemplateEnum.splitview_with_2_placeholders.name,
            child: SplitViewNode(
              axis: AxisEnum.vertical,
              children: [
                PlaceholderNode(),
                PlaceholderNode(),
              ],
            ),
          ),
        //
        SnippetTemplateEnum.column_with_2_placeholders => SnippetRootNode(
            name: SnippetTemplateEnum.column_with_2_placeholders.name,
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
        //
        SnippetTemplateEnum.rich_text => SnippetRootNode(
            name: SnippetTemplateEnum.rich_text.name,
            child: RichTextNode(
              text: TextSpanNode(
                text: 'ABC',
                children: [TextSpanNode(text: ' def')],
              ),
            ),
          ),
        //
        SnippetTemplateEnum.callout_content => SnippetRootNode(name: SnippetTemplateEnum.empty.name, child: PlaceholderNode()),
      };

  List<Widget> get allItems => values.map((e) => e.toMenuItem()).toList();

  SnippetRootNode clone() => templateSnippet()
    ..clone()
    ..validateTree();
}