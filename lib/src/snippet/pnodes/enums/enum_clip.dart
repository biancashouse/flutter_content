import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/stack_clip_editor.dart';

part 'enum_clip.mapper.dart';

@MappableEnum()
enum ClipEnum {
  hardEdge(Clip.hardEdge),
  antiAlias(Clip.antiAlias),
  antiAliasWithSaveLayer(Clip.antiAliasWithSaveLayer);

  const ClipEnum(this.flutterValue);

  final Clip flutterValue;

  String toSource() => 'Clip.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      SizedBox(
        width: 280,
        height: 100,
        child: Column(
          children: [
            fco.coloredText('clip:', color: Colors.white),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fco.coloredText('hardEdge', color: Colors.white),
                fco.coloredText('antiAlias', color: Colors.white),
                fco.coloredText('antiAlias\nWithSaveLayer', color: Colors.white),
              ],
            ),
            StackClipEditor(
              originalValue: ClipEnum.of(enumValueIndex),
              onChangedF: (ClipEnum? newValue) {
                onChangedF?.call(newValue?.index);
              },
            ),
          ],
        ),
      );

  // @override
  // Clip toWidget({ThemeData? themeData}) {
  //   return switch (this) {
  //     ClipEnum.hardEdge => Clip.hardEdge,
  //     ClipEnum.antiAlias => Clip.antiAlias,
  //     ClipEnum.antiAliasWithSaveLayer => Clip.antiAliasWithSaveLayer,
  //   };
  // }

  Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static ClipEnum? of(int? index) => index != null ? ClipEnum.values.elementAtOrNull(index) : null;
}
