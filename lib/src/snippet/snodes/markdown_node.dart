import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

part 'markdown_node.mapper.dart';

@MappableClass()
class MarkdownNode extends CL with MarkdownNodeMappable {
  String data;

  MarkdownNode({
    this.data = """
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
"""
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
    StringPropertyValueNode(
      snode: this,
      name: 'data',
      nameOnSeparateLine: true,
      expands: true,
      numLines: 3,
      stringValue: data,
      onStringChange: (newValue) {
        refreshWithUpdate(() => data = newValue??'');
      },
      calloutButtonSize: const Size(280, 70),
      calloutWidth: 300,
    ),
  ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    possiblyHighlightSelectedNode();
    return Markdown(
      key: createNodeGK(),
      data: data,
      styleSheet: MarkdownStyleSheet(
        h1: TextStyle(color: Colors.red),
        p: TextStyle(color: Colors.black),
        a: TextStyle(color: Colors.blue),
        codeblockDecoration: BoxDecoration(color: Colors.yellow[100]),
        code: TextStyle(color: Colors.purple),
      ),  );
  }

  @override
  String toString() => 'Markdown';

  static const String FLUTTER_TYPE = "Markdown";
}