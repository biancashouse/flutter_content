// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_info_model.dart';

class AppInfoModelMapper extends ClassMapperBase<AppInfoModel> {
  AppInfoModelMapper._();

  static AppInfoModelMapper? _instance;
  static AppInfoModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppInfoModelMapper._());
      SNodeMapper.ensureInitialized();
      TextStylePropertiesMapper.ensureInitialized();
      ButtonStylePropertiesMapper.ensureInitialized();
      ContainerStylePropertiesMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppInfoModel';

  static SNode? _$clipboard(AppInfoModel v) => v.clipboard;
  static const Field<AppInfoModel, SNode> _f$clipboard =
      Field('clipboard', _$clipboard, opt: true);
  static bool _$autoPublishDefault(AppInfoModel v) => v.autoPublishDefault;
  static const Field<AppInfoModel, bool> _f$autoPublishDefault =
      Field('autoPublishDefault', _$autoPublishDefault, opt: true, def: true);
  static List<String> _$snippetNames(AppInfoModel v) => v.snippetNames;
  static const Field<AppInfoModel, List<String>> _f$snippetNames =
      Field('snippetNames', _$snippetNames, opt: true, def: const []);
  static Map<String, TextStyleProperties> _$textStyles(AppInfoModel v) =>
      v.userTextStyles;
  static const Field<AppInfoModel, Map<String, TextStyleProperties>>
      _f$textStyles =
      Field('textStyles', _$textStyles, opt: true, def: const {});
  static Map<String, ButtonStyleProperties> _$buttonStyles(AppInfoModel v) =>
      v.userButtonStyles;
  static const Field<AppInfoModel, Map<String, ButtonStyleProperties>>
      _f$buttonStyles =
      Field('buttonStyles', _$buttonStyles, opt: true, def: const {});
  static Map<String, ContainerStyleProperties> _$containerStyles(
          AppInfoModel v) =>
      v.userContainerStyles;
  static const Field<AppInfoModel, Map<String, ContainerStyleProperties>>
      _f$containerStyles =
      Field('containerStyles', _$containerStyles, opt: true, def: const {});
  static List<String> _$sandboxPageNames(AppInfoModel v) => v.sandboxPageNames;
  static const Field<AppInfoModel, List<String>> _f$sandboxPageNames =
      Field('sandboxPageNames', _$sandboxPageNames, opt: true, def: const []);

  @override
  final MappableFields<AppInfoModel> fields = const {
    #clipboard: _f$clipboard,
    #autoPublishDefault: _f$autoPublishDefault,
    #snippetNames: _f$snippetNames,
    #textStyles: _f$textStyles,
    #buttonStyles: _f$buttonStyles,
    #containerStyles: _f$containerStyles,
    #sandboxPageNames: _f$sandboxPageNames,
  };

  static AppInfoModel _instantiate(DecodingData data) {
    return AppInfoModel(
        clipboard: data.dec(_f$clipboard),
        autoPublishDefault: data.dec(_f$autoPublishDefault),
        snippetNames: data.dec(_f$snippetNames),
        userTextStyles: data.dec(_f$textStyles),
        userButtonStyles: data.dec(_f$buttonStyles),
        userContainerStyles: data.dec(_f$containerStyles),
        sandboxPageNames: data.dec(_f$sandboxPageNames));
  }

  @override
  final Function instantiate = _instantiate;

  static AppInfoModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppInfoModel>(map);
  }

  static AppInfoModel fromJson(String json) {
    return ensureInitialized().decodeJson<AppInfoModel>(json);
  }
}

mixin AppInfoModelMappable {
  String toJson() {
    return AppInfoModelMapper.ensureInitialized()
        .encodeJson<AppInfoModel>(this as AppInfoModel);
  }

  Map<String, dynamic> toMap() {
    return AppInfoModelMapper.ensureInitialized()
        .encodeMap<AppInfoModel>(this as AppInfoModel);
  }

  AppInfoModelCopyWith<AppInfoModel, AppInfoModel, AppInfoModel> get copyWith =>
      _AppInfoModelCopyWithImpl<AppInfoModel, AppInfoModel>(
          this as AppInfoModel, $identity, $identity);
  @override
  String toString() {
    return AppInfoModelMapper.ensureInitialized()
        .stringifyValue(this as AppInfoModel);
  }

  @override
  bool operator ==(Object other) {
    return AppInfoModelMapper.ensureInitialized()
        .equalsValue(this as AppInfoModel, other);
  }

  @override
  int get hashCode {
    return AppInfoModelMapper.ensureInitialized()
        .hashValue(this as AppInfoModel);
  }
}

extension AppInfoModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppInfoModel, $Out> {
  AppInfoModelCopyWith<$R, AppInfoModel, $Out> get $asAppInfoModel =>
      $base.as((v, t, t2) => _AppInfoModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppInfoModelCopyWith<$R, $In extends AppInfoModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SNodeCopyWith<$R, SNode, SNode>? get clipboard;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get snippetNames;
  MapCopyWith<
      $R,
      String,
      TextStyleProperties,
      TextStylePropertiesCopyWith<$R, TextStyleProperties,
          TextStyleProperties>> get textStyles;
  MapCopyWith<
      $R,
      String,
      ButtonStyleProperties,
      ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
          ButtonStyleProperties>> get buttonStyles;
  MapCopyWith<
      $R,
      String,
      ContainerStyleProperties,
      ContainerStylePropertiesCopyWith<$R, ContainerStyleProperties,
          ContainerStyleProperties>> get containerStyles;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get sandboxPageNames;
  $R call(
      {SNode? clipboard,
      bool? autoPublishDefault,
      List<String>? snippetNames,
      Map<String, TextStyleProperties>? textStyles,
      Map<String, ButtonStyleProperties>? buttonStyles,
      Map<String, ContainerStyleProperties>? containerStyles,
      List<String>? sandboxPageNames});
  AppInfoModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppInfoModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppInfoModel, $Out>
    implements AppInfoModelCopyWith<$R, AppInfoModel, $Out> {
  _AppInfoModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppInfoModel> $mapper =
      AppInfoModelMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get clipboard =>
      $value.clipboard?.copyWith.$chain((v) => call(clipboard: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get snippetNames => ListCopyWith(
          $value.snippetNames,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(snippetNames: v));
  @override
  MapCopyWith<
      $R,
      String,
      TextStyleProperties,
      TextStylePropertiesCopyWith<$R, TextStyleProperties,
          TextStyleProperties>> get textStyles => MapCopyWith($value.userTextStyles,
      (v, t) => v.copyWith.$chain(t), (v) => call(textStyles: v));
  @override
  MapCopyWith<
      $R,
      String,
      ButtonStyleProperties,
      ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
          ButtonStyleProperties>> get buttonStyles => MapCopyWith(
      $value.userButtonStyles,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(buttonStyles: v));
  @override
  MapCopyWith<
      $R,
      String,
      ContainerStyleProperties,
      ContainerStylePropertiesCopyWith<$R, ContainerStyleProperties,
          ContainerStyleProperties>> get containerStyles => MapCopyWith(
      $value.userContainerStyles,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(containerStyles: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get sandboxPageNames => ListCopyWith(
          $value.sandboxPageNames,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(sandboxPageNames: v));
  @override
  $R call(
          {Object? clipboard = $none,
          bool? autoPublishDefault,
          List<String>? snippetNames,
          Map<String, TextStyleProperties>? textStyles,
          Map<String, ButtonStyleProperties>? buttonStyles,
          Map<String, ContainerStyleProperties>? containerStyles,
          List<String>? sandboxPageNames}) =>
      $apply(FieldCopyWithData({
        if (clipboard != $none) #clipboard: clipboard,
        if (autoPublishDefault != null) #autoPublishDefault: autoPublishDefault,
        if (snippetNames != null) #snippetNames: snippetNames,
        if (textStyles != null) #textStyles: textStyles,
        if (buttonStyles != null) #buttonStyles: buttonStyles,
        if (containerStyles != null) #containerStyles: containerStyles,
        if (sandboxPageNames != null) #sandboxPageNames: sandboxPageNames
      }));
  @override
  AppInfoModel $make(CopyWithData data) => AppInfoModel(
      clipboard: data.get(#clipboard, or: $value.clipboard),
      autoPublishDefault:
          data.get(#autoPublishDefault, or: $value.autoPublishDefault),
      snippetNames: data.get(#snippetNames, or: $value.snippetNames),
      userTextStyles: data.get(#textStyles, or: $value.userTextStyles),
      userButtonStyles: data.get(#buttonStyles, or: $value.userButtonStyles),
      userContainerStyles: data.get(#containerStyles, or: $value.userContainerStyles),
      sandboxPageNames:
          data.get(#sandboxPageNames, or: $value.sandboxPageNames));

  @override
  AppInfoModelCopyWith<$R2, AppInfoModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppInfoModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
