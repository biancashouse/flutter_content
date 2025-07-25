// ignore_for_file: camel_case_types

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

part 'snippet_templates.mapper.dart';

@MappableEnum()
enum SnippetTemplateEnum {
  empty,
  drive_iframe,
  markdown,
  scaffold_with_tabs,
  scaffold_with_menubar,
  splitview_with_2_placeholders,
  rich_text,
  callout_content;

  Widget toMenuItem() => fco.coloredText(_menuItem(), color: Colors.white);

  String _menuItem() => switch (this) {
        SnippetTemplateEnum.empty => 'placeholder',
        SnippetTemplateEnum.drive_iframe => 'google drive doc',
        SnippetTemplateEnum.markdown => 'markdown',
        SnippetTemplateEnum.scaffold_with_tabs => 'scaffold with tabs',
        SnippetTemplateEnum.scaffold_with_menubar => 'scaffold with a menu bar',
        SnippetTemplateEnum.splitview_with_2_placeholders =>
          'splitview with 2 placeholders',
        SnippetTemplateEnum.rich_text => 'rich text',
        SnippetTemplateEnum.callout_content => 'callout contents'
      };

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
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
        scName: scName,
      );

  SnippetRootNode templateSnippet() {
    final uniqueTabBarName = DateTime.now().millisecondsSinceEpoch.toString();
    return switch (this) {
      //
      SnippetTemplateEnum.empty => SnippetRootNode(
          name: SnippetTemplateEnum.empty.name,
          child: PlaceholderNode(),
        ),
      //
      SnippetTemplateEnum.drive_iframe => SnippetRootNode(
          name: SnippetTemplateEnum.drive_iframe.name,
          child: IFrameNode(),
        ),
      //
      SnippetTemplateEnum.markdown => SnippetRootNode(
          name: SnippetTemplateEnum.markdown.name,
          child: MarkdownNode(),
        ),
      //
      SnippetTemplateEnum.scaffold_with_tabs => SnippetRootNode(
          name: SnippetTemplateEnum.scaffold_with_tabs.name,
          child: ScaffoldNode(
            appBar: AppBarNode(
              tabBarName: uniqueTabBarName,
              bgColor: ColorModel.grey(),
              title: GenericSingleChildNode(
                propertyName: 'title',
                child: TextNode(
                    text: 'my title', tsPropGroup: TextStyleProperties()),
              ),
              bottom: GenericSingleChildNode(
                propertyName: 'bottom',
                child: TabBarNode(
                  name: uniqueTabBarName,
                  labelTSPropGroup: TextStyleProperties(),
                  children: [
                    TextNode(text: 'tab 1', tsPropGroup: TextStyleProperties()),
                    TextNode(text: 'Tab 2', tsPropGroup: TextStyleProperties()),
                  ],
                ),
              ),
            ),
            body: GenericSingleChildNode(
              propertyName: 'body',
              child: TabBarViewNode(
                tabBarName: uniqueTabBarName,
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
              bgColor: ColorModel.grey(),
              title: GenericSingleChildNode(
                  propertyName: 'title',
                  child: TextNode(
                      text: 'my title', tsPropGroup: TextStyleProperties())),
              bottom: GenericSingleChildNode(
                propertyName: 'bottom',
                child: MenuBarNode(children: [
                  MenuItemButtonNode(
                      child: TextNode(
                          text: 'item 1', tsPropGroup: TextStyleProperties()),
                      bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties())),
                  MenuItemButtonNode(
                      child: TextNode(
                          text: 'item 2', tsPropGroup: TextStyleProperties()),
                      bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties())),
                  MenuItemButtonNode(
                      child: TextNode(
                          text: 'item 3', tsPropGroup: TextStyleProperties()),
                      bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties())),
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
      SnippetTemplateEnum.rich_text => SnippetRootNode(
          name: SnippetTemplateEnum.rich_text.name,
          child: RichTextNode(
            text: TextSpanNode(
              text: 'ABC',
              tsPropGroup: TextStyleProperties(),
              children: [
                TextSpanNode(text: ' def', tsPropGroup: TextStyleProperties())
              ],
            ),
          ),
        ),
      //
      SnippetTemplateEnum.callout_content => SnippetRootNode(
          name: SnippetTemplateEnum.empty.name, child: PlaceholderNode()),
    };
  }

  /// in the case of scaffold with tabs, can pass in the
  Widget toWidget(BuildContext context, SNode? parentNode,
          {double? appBarHeight}) =>
      templateSnippet().toWidget(context, parentNode);

  List<Widget> get allItems => values.map((e) => e.toMenuItem()).toList();

  SnippetRootNode clone() => templateSnippet()
    ..clone()
    ..validateTree();
}
