// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'markdown_node.dart';

class MarkdownNodeMapper extends SubClassMapperBase<MarkdownNode> {
  MarkdownNodeMapper._();

  static MarkdownNodeMapper? _instance;
  static MarkdownNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MarkdownNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'MarkdownNode';

  static String _$data(MarkdownNode v) => v.data;
  static const Field<MarkdownNode, String> _f$data =
      Field('data', _$data, opt: true, def: """
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
""");
  static String _$uid(MarkdownNode v) => v.uid;
  static const Field<MarkdownNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(MarkdownNode v) => v.isExpanded;
  static const Field<MarkdownNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(MarkdownNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<MarkdownNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(MarkdownNode v) =>
      v.nodeWidgetGK;
  static const Field<MarkdownNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<MarkdownNode> fields = const {
    #data: _f$data,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'MarkdownNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static MarkdownNode _instantiate(DecodingData data) {
    return MarkdownNode(data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static MarkdownNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MarkdownNode>(map);
  }

  static MarkdownNode fromJson(String json) {
    return ensureInitialized().decodeJson<MarkdownNode>(json);
  }
}

mixin MarkdownNodeMappable {
  String toJson() {
    return MarkdownNodeMapper.ensureInitialized()
        .encodeJson<MarkdownNode>(this as MarkdownNode);
  }

  Map<String, dynamic> toMap() {
    return MarkdownNodeMapper.ensureInitialized()
        .encodeMap<MarkdownNode>(this as MarkdownNode);
  }

  MarkdownNodeCopyWith<MarkdownNode, MarkdownNode, MarkdownNode> get copyWith =>
      _MarkdownNodeCopyWithImpl(this as MarkdownNode, $identity, $identity);
  @override
  String toString() {
    return MarkdownNodeMapper.ensureInitialized()
        .stringifyValue(this as MarkdownNode);
  }

  @override
  bool operator ==(Object other) {
    return MarkdownNodeMapper.ensureInitialized()
        .equalsValue(this as MarkdownNode, other);
  }

  @override
  int get hashCode {
    return MarkdownNodeMapper.ensureInitialized()
        .hashValue(this as MarkdownNode);
  }
}

extension MarkdownNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MarkdownNode, $Out> {
  MarkdownNodeCopyWith<$R, MarkdownNode, $Out> get $asMarkdownNode =>
      $base.as((v, t, t2) => _MarkdownNodeCopyWithImpl(v, t, t2));
}

abstract class MarkdownNodeCopyWith<$R, $In extends MarkdownNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? data});
  MarkdownNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MarkdownNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MarkdownNode, $Out>
    implements MarkdownNodeCopyWith<$R, MarkdownNode, $Out> {
  _MarkdownNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MarkdownNode> $mapper =
      MarkdownNodeMapper.ensureInitialized();
  @override
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  MarkdownNode $make(CopyWithData data) =>
      MarkdownNode(data: data.get(#data, or: $value.data));

  @override
  MarkdownNodeCopyWith<$R2, MarkdownNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MarkdownNodeCopyWithImpl($value, $cast, t);
}
