import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  bool autoPublishDefault;
  SNode? clipboard;
  List<SnippetName> snippetNames; // a snippet may be a Page snippet; i.e. also has a Route Path property
  Map<TextStyleName, TextStyleProperties> textStyles;
  Map<ButtonStyleName, ButtonStyleProperties> buttonStyles;

  AppInfoModel({
    this.clipboard,
    this.autoPublishDefault = true,
    this.snippetNames = const [],
    this.textStyles = const {},
    this.buttonStyles = const {},
  });
}

/// we don't persist this linked list
// final class VersionEntryItem extends LinkedListEntry<VersionEntryItem> {
//   final VersionId versionId;
//   VersionEntryItem(this.versionId);
//
//   @override
//   String toString() {
//     return versionId;
//   }
// }
