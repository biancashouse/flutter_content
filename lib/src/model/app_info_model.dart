import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/button_styles.dart';
import 'package:flutter_content/container_styles.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/text_styles.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  bool autoPublishDefault;
  SNode? clipboard;
  List<SnippetName> snippetNames; // a snippet may be a Page snippet; i.e. also has a Route Path property
  Map<TextStyleName, TextStyleProperties> userTextStyles;
  Map<ButtonStyleName, ButtonStyleProperties> userButtonStyles;
  Map<ContainerStyleName, ContainerStyleProperties> userContainerStyles;
  List<String> sandboxPageNames;

  AppInfoModel({
    this.clipboard,
    this.autoPublishDefault = true,
    this.snippetNames = const [],
    this.userTextStyles = const {},
    this.userButtonStyles = const {},
    this.userContainerStyles = const {},
    this.sandboxPageNames = const [],
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
