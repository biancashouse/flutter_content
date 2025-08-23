import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/clipboard/clipboard_view.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  bool autoPublishDefault;
  SNode? clipboard;
  List<SnippetName> snippetNames; // a snippet may be a Page snippet; i.e. also has a Route Path property
  Map<TextStyleName, TextStyleProperties> userTextStyles;
  Map<ButtonStyleName, ButtonStyleProperties> userButtonStyles;
  Map<ContainerStyleName, ContainerStyleProperties> userContainerStyles;
  @MappableField(key: 'anonymous-user-pages')
  List<String> anonymousUserEditablePages;
  @MappableField(key: 'editor-passwords')
  List<String> editorPasswords;

  AppInfoModel({
    this.clipboard,
    this.autoPublishDefault = true,
    this.snippetNames = const [],
    this.userTextStyles = const {},
    this.userButtonStyles = const {},
    this.userContainerStyles = const {},
    this.anonymousUserEditablePages = const [],
    // managed manually in firestore console
    this.editorPasswords = const ['password123'],
  });

  bool get clipboardIsEmpty => clipboard == null;

  void hideClipboard() => fco.dismiss("floating-clipboard");

  void showFloatingClipboard({ScrollControllerName? scName}) {
    fco.dismiss("floating-clipboard");
    fco.showOverlay(
      calloutContent: const ClipboardView(),
      calloutConfig: CalloutConfigModel(
        cId: "floating-clipboard",
        initialCalloutW: 300,
        initialCalloutH: 180,
        initialCalloutPos: OffsetModel(fco.scrW - 400, 0),
        fillColor: ColorModel.fromColor(Colors.transparent),
        arrowType: ArrowTypeEnum.NONE,
        borderRadius: 16,
        scrollControllerName: scName,
      ),
    );
  }

}

