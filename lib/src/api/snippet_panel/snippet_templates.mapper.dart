// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snippet_templates.dart';

class SnippetTemplateEnumMapper extends EnumMapper<SnippetTemplateEnum> {
  SnippetTemplateEnumMapper._();

  static SnippetTemplateEnumMapper? _instance;
  static SnippetTemplateEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SnippetTemplateEnumMapper._());
    }
    return _instance!;
  }

  static SnippetTemplateEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SnippetTemplateEnum decode(dynamic value) {
    switch (value) {
      case r'empty':
        return SnippetTemplateEnum.empty;
      case r'drive_iframe':
        return SnippetTemplateEnum.drive_iframe;
      case r'markdown':
        return SnippetTemplateEnum.markdown;
      case r'scaffold_with_tabs':
        return SnippetTemplateEnum.scaffold_with_tabs;
      case r'scaffold_with_menubar':
        return SnippetTemplateEnum.scaffold_with_menubar;
      case r'splitview_with_2_placeholders':
        return SnippetTemplateEnum.splitview_with_2_placeholders;
      case r'rich_text':
        return SnippetTemplateEnum.rich_text;
      case r'callout_content':
        return SnippetTemplateEnum.callout_content;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SnippetTemplateEnum self) {
    switch (self) {
      case SnippetTemplateEnum.empty:
        return r'empty';
      case SnippetTemplateEnum.drive_iframe:
        return r'drive_iframe';
      case SnippetTemplateEnum.markdown:
        return r'markdown';
      case SnippetTemplateEnum.scaffold_with_tabs:
        return r'scaffold_with_tabs';
      case SnippetTemplateEnum.scaffold_with_menubar:
        return r'scaffold_with_menubar';
      case SnippetTemplateEnum.splitview_with_2_placeholders:
        return r'splitview_with_2_placeholders';
      case SnippetTemplateEnum.rich_text:
        return r'rich_text';
      case SnippetTemplateEnum.callout_content:
        return r'callout_content';
    }
  }
}

extension SnippetTemplateEnumMapperExtension on SnippetTemplateEnum {
  String toValue() {
    SnippetTemplateEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SnippetTemplateEnum>(this) as String;
  }
}
