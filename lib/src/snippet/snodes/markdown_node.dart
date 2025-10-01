import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/markdown_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/blocks/leaf/link.dart';
import 'package:markdown_widget/widget/markdown.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

part 'markdown_node.mapper.dart';

@MappableClass()
class MarkdownNode extends CL with MarkdownNodeMappable {
  String data;

  MarkdownNode({
    this.data = SAMPLE_MD,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'Markdown',
      webLink: 'https://pub.dev/packages/flutter_markdown',
      snode: this,
      name: 'fyi',
    ),
    FlutterDocPNode(
      buttonLabel: 'Markdown Editor Plus',
      webLink: 'https://pub.dev/packages/markdown_editor_plus',
      snode: this,
      name: 'fyi2',
    ),
    MarkdownPNode(
      snode: this,
      name: 'data',
      stringValue: data,
      // stringValue: data,
      onStringChange: (newValue) {
        refreshWithUpdate(context, () => data = newValue ?? '');
      },
      calloutButtonSize: const Size(280, 3000),
      calloutWidth: fco.scrW * .8,
      calloutHeight: fco.scrH * .8,
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      return MarkdownWidget(
        key: createNodeWidgetGK(),
        data: data,
        config: MarkdownConfig(
          configs: [
            LinkConfig(
              // style: TextStyle(
              //   color: Colors.red,
              //   decoration: TextDecoration.underline,
              // ),
              onTap: (href) async {
                try {
                  Uri url = Uri.parse(href);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $href');
                  }
                } catch (e) {
                  fco.logger.d('Following exception ignored:');
                  fco.logger.e('', error: e);
                }
              },
            ),
          ],
        ),
      );
    } catch (e) {
      return Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
    }
  }

  @override
  String toString() => 'Markdown';

  static const String FLUTTER_TYPE = "Markdown";

  static const SAMPLE_MD = """
# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted
Dart code in your app.

## Titles

Setext-style

```
This is an H1
=============

This is an H2
-------------
```

Atx-style

```
# This is an H1

## This is an H2

###### This is an H6
```

Select the valid headers:

- [x] `# hello`
- [ ] `#hello`

## Links

[Google's Homepage][Google]

```
[inline-style](https://www.google.com)

[reference-style][Google]
```

## Images

![Flowers](/assets/images/flowers.jpg)

## Tables

|Syntax                                 |Result                               |
|---------------------------------------|-------------------------------------|
|`*italic 1*`                           |*italic 1*                           |
|`_italic 2_`                           | _italic 2_                          |
|`**bold 1**`                           |**bold 1**                           |
|`__bold 2__`                           |__bold 2__                           |
|`This is a ~~strikethrough~~`          |This is a ~~strikethrough~~          |
|`***italic bold 1***`                  |***italic bold 1***                  |
|`___italic bold 2___`                  |___italic bold 2___                  |
|`***~~italic bold strikethrough 1~~***`|***~~italic bold strikethrough 1~~***|
|`~~***italic bold strikethrough 2***~~`|~~***italic bold strikethrough 2***~~|

## Styling
Style text as _italic_, __bold__, ~~strikethrough~~, or `inline code`.

- Use bulleted lists
- To better clarify
- Your points

## Code blocks
Formatted Dart code looks really pretty too:

```
void main() {
  runApp(FlutterCalloutsApp(
    home: Scaffold(
      body: Markdown(data: markdownData),
    ),
  ));
}
```

## Center Title

###### ※ ※ ※

_* How to implement it see main.dart#L129 in example_using_go_router._

## Custom Syntax

NaOH + Al_2O_3 = NaAlO_2 + H_2O

C_4H_10 = C_2H_6 + C_2H_4

## Markdown widget

This is an example_using_go_router of how to create your own Markdown widget:

    Markdown(data: 'Hello _world_!');

Enjoy!

[Google]: https://www.google.com/

## Line Breaks

This is an example_using_go_router of how to create line breaks (tab or two whitespaces):

line 1


line 2



line 3
""";
}
