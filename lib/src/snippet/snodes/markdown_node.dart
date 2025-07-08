import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

part 'markdown_node.mapper.dart';

@MappableClass()
class MarkdownNode extends CL with MarkdownNodeMappable {
  String data;

  MarkdownNode(
      {this.data = """
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
  runApp(MaterialApp(
    home: Scaffold(
      body: Markdown(data: markdownData),
    ),
  ));
}
```

## Center Title

###### ※ ※ ※

_* How to implement it see main.dart#L129 in example._

## Custom Syntax

NaOH + Al_2O_3 = NaAlO_2 + H_2O

C_4H_10 = C_2H_6 + C_2H_4

## Markdown widget

This is an example of how to create your own Markdown widget:

    Markdown(data: 'Hello _world_!');

Enjoy!

[Google]: https://www.google.com/

## Line Breaks

This is an example of how to create line breaks (tab or two whitespaces):

line 1


line 2



line 3
"""});

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'Markdown',
        webLink:
        'https://pub.dev/packages/flutter_markdown',
        snode: this,
        name: 'fyi'),
    StringPNode(
          snode: this,
          name: 'data',
          nameOnSeparateLine: true,
          expands: true,
          numLines: 9999,
          stringValue: data,
          onStringChange: (newValue) {
            refreshWithUpdate(context,() => data = newValue ?? '');
          },
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 300,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      return Markdown(
            key: createNodeWidgetGK(),
            data: data,
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(color: Colors.red),
              p: const TextStyle(color: Colors.black),
              a: const TextStyle(color: Colors.blue),
              codeblockDecoration: BoxDecoration(color: Colors.yellow[100]),
              code: const TextStyle(color: Colors.purple),
            ),
            onTapLink: (String text, String? href, String title) async {
              if (href != null) {
                try {
                  Uri url = Uri.parse(href);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $href');
                  }
                } catch (e) {
                  fco.logger.d('Following exception ignored:');
                  fco.logger.e('', error:e);
                }
              }
            },
          );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  @override
  String toString() => 'Markdown';

  static const String FLUTTER_TYPE = "Markdown";
}
