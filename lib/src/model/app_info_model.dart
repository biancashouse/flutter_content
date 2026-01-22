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

  static bool needToSave = false;

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

  void showFloatingClipboard() {
    fco.dismiss("floating-clipboard");
    fco.showOverlay(
      calloutContent: const ClipboardView(),
      calloutConfig: CalloutConfig(
        cId: "floating-clipboard",
        initialCalloutW: 300,
        initialCalloutH: 180,
        initialCalloutPos: OffsetModel(fco.scrW - 400, 0),
        decorationFillColors: ColorOrGradient.color(Colors.transparent),
        decorationBorderRadius: 16,
        targetPointerType: TargetPointerType.none(),
        
      ),
    );
  }

  final Map<SnippetName, SnippetInfoModel> _snippetInfoCache = {};


   SnippetInfoModel? cachedSnippetInfo(String snippetName) {
    return _snippetInfoCache[snippetName];
  }

  /// a snippet gets cached when first read from FB or a new version created
   void cacheSnippetInfo(String snippetName, SnippetInfoModel sni) {
    // _snippetInfoCache[snippetName.startsWith('/') ? snippetName.substring(1) : snippetName] = sni;
    _snippetInfoCache[snippetName] = sni;
  }

   List<String> cachedSnippetNames() => _snippetInfoCache.keys.toList();

   void removeFromCache(String snippetName) =>
      _snippetInfoCache.remove(snippetName);


}

