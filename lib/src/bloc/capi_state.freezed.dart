// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CAPIState {
// required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
  String? get initialValueJsonAssetPath =>
      throw _privateConstructorUsedError; // both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
  bool get hideIframes => throw _privateConstructorUsedError;
  bool get hideSnippetPencilIcons =>
      throw _privateConstructorUsedError; // @Default(Offset.zero) Offset? snippetTreeCalloutInitialPos,
  double? get snippetTreeCalloutW => throw _privateConstructorUsedError;
  double? get snippetTreeCalloutH => throw _privateConstructorUsedError;
  Offset? get directoryTreeCalloutInitialPos =>
      throw _privateConstructorUsedError;
  double? get directoryTreeCalloutW => throw _privateConstructorUsedError;
  double? get directoryTreeCalloutH =>
      throw _privateConstructorUsedError; // @Default(600) double? snippetPropertiesCalloutW,
// @Default(600) double? snippetPropertiesCalloutH,
// @Default({}) Map<String, TargetGroupModel> targetGroupMap,
// @Default([]) List<TargetModel> playList,
// current selection
// List<TargetModel> targetCovers
// TargetModel? hideTargetCoversExcept,
// TargetModel? hideTargetBtnsExcept,
// @Default(false) bool hideAllTargetCovers,
// @Default(false) bool hideAllTargetBtns,
//
  TargetModel? get newestTarget => throw _privateConstructorUsedError;
  TargetModel? get selectedTarget => throw _privateConstructorUsedError; //
  String? get selectedPanel => throw _privateConstructorUsedError; //
// content
  bool get trainerIsSignedn =>
      throw _privateConstructorUsedError; // String? jsonRootDirectoryNode,
// EncodedJson? jsonClipboardForMove,
  bool get showClipboardContent => throw _privateConstructorUsedError;
  int get force =>
      throw _privateConstructorUsedError; // hacky way to force a transition
  bool get onlyTargetsWrappers =>
      throw _privateConstructorUsedError; // hacky way to force a transition
//==========================================================================================
//====  PAGE ROUTE NAME  ===================================================================
//==========================================================================================
  String? get routeName =>
      throw _privateConstructorUsedError; //==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
  SnippetBeingEdited? get snippetBeingEdited =>
      throw _privateConstructorUsedError;
  bool get ONLY_TESTING => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CAPIStateCopyWith<CAPIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CAPIStateCopyWith<$Res> {
  factory $CAPIStateCopyWith(CAPIState value, $Res Function(CAPIState) then) =
      _$CAPIStateCopyWithImpl<$Res, CAPIState>;
  @useResult
  $Res call(
      {String? initialValueJsonAssetPath,
      bool hideIframes,
      bool hideSnippetPencilIcons,
      double? snippetTreeCalloutW,
      double? snippetTreeCalloutH,
      Offset? directoryTreeCalloutInitialPos,
      double? directoryTreeCalloutW,
      double? directoryTreeCalloutH,
      TargetModel? newestTarget,
      TargetModel? selectedTarget,
      String? selectedPanel,
      bool trainerIsSignedn,
      bool showClipboardContent,
      int force,
      bool onlyTargetsWrappers,
      String? routeName,
      SnippetBeingEdited? snippetBeingEdited,
      bool ONLY_TESTING});
}

/// @nodoc
class _$CAPIStateCopyWithImpl<$Res, $Val extends CAPIState>
    implements $CAPIStateCopyWith<$Res> {
  _$CAPIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialValueJsonAssetPath = freezed,
    Object? hideIframes = null,
    Object? hideSnippetPencilIcons = null,
    Object? snippetTreeCalloutW = freezed,
    Object? snippetTreeCalloutH = freezed,
    Object? directoryTreeCalloutInitialPos = freezed,
    Object? directoryTreeCalloutW = freezed,
    Object? directoryTreeCalloutH = freezed,
    Object? newestTarget = freezed,
    Object? selectedTarget = freezed,
    Object? selectedPanel = freezed,
    Object? trainerIsSignedn = null,
    Object? showClipboardContent = null,
    Object? force = null,
    Object? onlyTargetsWrappers = null,
    Object? routeName = freezed,
    Object? snippetBeingEdited = freezed,
    Object? ONLY_TESTING = null,
  }) {
    return _then(_value.copyWith(
      initialValueJsonAssetPath: freezed == initialValueJsonAssetPath
          ? _value.initialValueJsonAssetPath
          : initialValueJsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String?,
      hideIframes: null == hideIframes
          ? _value.hideIframes
          : hideIframes // ignore: cast_nullable_to_non_nullable
              as bool,
      hideSnippetPencilIcons: null == hideSnippetPencilIcons
          ? _value.hideSnippetPencilIcons
          : hideSnippetPencilIcons // ignore: cast_nullable_to_non_nullable
              as bool,
      snippetTreeCalloutW: freezed == snippetTreeCalloutW
          ? _value.snippetTreeCalloutW
          : snippetTreeCalloutW // ignore: cast_nullable_to_non_nullable
              as double?,
      snippetTreeCalloutH: freezed == snippetTreeCalloutH
          ? _value.snippetTreeCalloutH
          : snippetTreeCalloutH // ignore: cast_nullable_to_non_nullable
              as double?,
      directoryTreeCalloutInitialPos: freezed == directoryTreeCalloutInitialPos
          ? _value.directoryTreeCalloutInitialPos
          : directoryTreeCalloutInitialPos // ignore: cast_nullable_to_non_nullable
              as Offset?,
      directoryTreeCalloutW: freezed == directoryTreeCalloutW
          ? _value.directoryTreeCalloutW
          : directoryTreeCalloutW // ignore: cast_nullable_to_non_nullable
              as double?,
      directoryTreeCalloutH: freezed == directoryTreeCalloutH
          ? _value.directoryTreeCalloutH
          : directoryTreeCalloutH // ignore: cast_nullable_to_non_nullable
              as double?,
      newestTarget: freezed == newestTarget
          ? _value.newestTarget
          : newestTarget // ignore: cast_nullable_to_non_nullable
              as TargetModel?,
      selectedTarget: freezed == selectedTarget
          ? _value.selectedTarget
          : selectedTarget // ignore: cast_nullable_to_non_nullable
              as TargetModel?,
      selectedPanel: freezed == selectedPanel
          ? _value.selectedPanel
          : selectedPanel // ignore: cast_nullable_to_non_nullable
              as String?,
      trainerIsSignedn: null == trainerIsSignedn
          ? _value.trainerIsSignedn
          : trainerIsSignedn // ignore: cast_nullable_to_non_nullable
              as bool,
      showClipboardContent: null == showClipboardContent
          ? _value.showClipboardContent
          : showClipboardContent // ignore: cast_nullable_to_non_nullable
              as bool,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as int,
      onlyTargetsWrappers: null == onlyTargetsWrappers
          ? _value.onlyTargetsWrappers
          : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
              as bool,
      routeName: freezed == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      snippetBeingEdited: freezed == snippetBeingEdited
          ? _value.snippetBeingEdited
          : snippetBeingEdited // ignore: cast_nullable_to_non_nullable
              as SnippetBeingEdited?,
      ONLY_TESTING: null == ONLY_TESTING
          ? _value.ONLY_TESTING
          : ONLY_TESTING // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CAPIStateImplCopyWith<$Res>
    implements $CAPIStateCopyWith<$Res> {
  factory _$$CAPIStateImplCopyWith(
          _$CAPIStateImpl value, $Res Function(_$CAPIStateImpl) then) =
      __$$CAPIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? initialValueJsonAssetPath,
      bool hideIframes,
      bool hideSnippetPencilIcons,
      double? snippetTreeCalloutW,
      double? snippetTreeCalloutH,
      Offset? directoryTreeCalloutInitialPos,
      double? directoryTreeCalloutW,
      double? directoryTreeCalloutH,
      TargetModel? newestTarget,
      TargetModel? selectedTarget,
      String? selectedPanel,
      bool trainerIsSignedn,
      bool showClipboardContent,
      int force,
      bool onlyTargetsWrappers,
      String? routeName,
      SnippetBeingEdited? snippetBeingEdited,
      bool ONLY_TESTING});
}

/// @nodoc
class __$$CAPIStateImplCopyWithImpl<$Res>
    extends _$CAPIStateCopyWithImpl<$Res, _$CAPIStateImpl>
    implements _$$CAPIStateImplCopyWith<$Res> {
  __$$CAPIStateImplCopyWithImpl(
      _$CAPIStateImpl _value, $Res Function(_$CAPIStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialValueJsonAssetPath = freezed,
    Object? hideIframes = null,
    Object? hideSnippetPencilIcons = null,
    Object? snippetTreeCalloutW = freezed,
    Object? snippetTreeCalloutH = freezed,
    Object? directoryTreeCalloutInitialPos = freezed,
    Object? directoryTreeCalloutW = freezed,
    Object? directoryTreeCalloutH = freezed,
    Object? newestTarget = freezed,
    Object? selectedTarget = freezed,
    Object? selectedPanel = freezed,
    Object? trainerIsSignedn = null,
    Object? showClipboardContent = null,
    Object? force = null,
    Object? onlyTargetsWrappers = null,
    Object? routeName = freezed,
    Object? snippetBeingEdited = freezed,
    Object? ONLY_TESTING = null,
  }) {
    return _then(_$CAPIStateImpl(
      initialValueJsonAssetPath: freezed == initialValueJsonAssetPath
          ? _value.initialValueJsonAssetPath
          : initialValueJsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String?,
      hideIframes: null == hideIframes
          ? _value.hideIframes
          : hideIframes // ignore: cast_nullable_to_non_nullable
              as bool,
      hideSnippetPencilIcons: null == hideSnippetPencilIcons
          ? _value.hideSnippetPencilIcons
          : hideSnippetPencilIcons // ignore: cast_nullable_to_non_nullable
              as bool,
      snippetTreeCalloutW: freezed == snippetTreeCalloutW
          ? _value.snippetTreeCalloutW
          : snippetTreeCalloutW // ignore: cast_nullable_to_non_nullable
              as double?,
      snippetTreeCalloutH: freezed == snippetTreeCalloutH
          ? _value.snippetTreeCalloutH
          : snippetTreeCalloutH // ignore: cast_nullable_to_non_nullable
              as double?,
      directoryTreeCalloutInitialPos: freezed == directoryTreeCalloutInitialPos
          ? _value.directoryTreeCalloutInitialPos
          : directoryTreeCalloutInitialPos // ignore: cast_nullable_to_non_nullable
              as Offset?,
      directoryTreeCalloutW: freezed == directoryTreeCalloutW
          ? _value.directoryTreeCalloutW
          : directoryTreeCalloutW // ignore: cast_nullable_to_non_nullable
              as double?,
      directoryTreeCalloutH: freezed == directoryTreeCalloutH
          ? _value.directoryTreeCalloutH
          : directoryTreeCalloutH // ignore: cast_nullable_to_non_nullable
              as double?,
      newestTarget: freezed == newestTarget
          ? _value.newestTarget
          : newestTarget // ignore: cast_nullable_to_non_nullable
              as TargetModel?,
      selectedTarget: freezed == selectedTarget
          ? _value.selectedTarget
          : selectedTarget // ignore: cast_nullable_to_non_nullable
              as TargetModel?,
      selectedPanel: freezed == selectedPanel
          ? _value.selectedPanel
          : selectedPanel // ignore: cast_nullable_to_non_nullable
              as String?,
      trainerIsSignedn: null == trainerIsSignedn
          ? _value.trainerIsSignedn
          : trainerIsSignedn // ignore: cast_nullable_to_non_nullable
              as bool,
      showClipboardContent: null == showClipboardContent
          ? _value.showClipboardContent
          : showClipboardContent // ignore: cast_nullable_to_non_nullable
              as bool,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as int,
      onlyTargetsWrappers: null == onlyTargetsWrappers
          ? _value.onlyTargetsWrappers
          : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
              as bool,
      routeName: freezed == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      snippetBeingEdited: freezed == snippetBeingEdited
          ? _value.snippetBeingEdited
          : snippetBeingEdited // ignore: cast_nullable_to_non_nullable
              as SnippetBeingEdited?,
      ONLY_TESTING: null == ONLY_TESTING
          ? _value.ONLY_TESTING
          : ONLY_TESTING // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CAPIStateImpl extends _CAPIState {
  _$CAPIStateImpl(
      {this.initialValueJsonAssetPath,
      this.hideIframes = false,
      this.hideSnippetPencilIcons = false,
      this.snippetTreeCalloutW = 400,
      this.snippetTreeCalloutH = 600,
      this.directoryTreeCalloutInitialPos = Offset.zero,
      this.directoryTreeCalloutW = 400,
      this.directoryTreeCalloutH = 600,
      this.newestTarget,
      this.selectedTarget,
      this.selectedPanel,
      this.trainerIsSignedn = false,
      this.showClipboardContent = true,
      this.force = 0,
      this.onlyTargetsWrappers = false,
      this.routeName,
      this.snippetBeingEdited,
      this.ONLY_TESTING = true})
      : super._();

// required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
  @override
  final String? initialValueJsonAssetPath;
// both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
  @override
  @JsonKey()
  final bool hideIframes;
  @override
  @JsonKey()
  final bool hideSnippetPencilIcons;
// @Default(Offset.zero) Offset? snippetTreeCalloutInitialPos,
  @override
  @JsonKey()
  final double? snippetTreeCalloutW;
  @override
  @JsonKey()
  final double? snippetTreeCalloutH;
  @override
  @JsonKey()
  final Offset? directoryTreeCalloutInitialPos;
  @override
  @JsonKey()
  final double? directoryTreeCalloutW;
  @override
  @JsonKey()
  final double? directoryTreeCalloutH;
// @Default(600) double? snippetPropertiesCalloutW,
// @Default(600) double? snippetPropertiesCalloutH,
// @Default({}) Map<String, TargetGroupModel> targetGroupMap,
// @Default([]) List<TargetModel> playList,
// current selection
// List<TargetModel> targetCovers
// TargetModel? hideTargetCoversExcept,
// TargetModel? hideTargetBtnsExcept,
// @Default(false) bool hideAllTargetCovers,
// @Default(false) bool hideAllTargetBtns,
//
  @override
  final TargetModel? newestTarget;
  @override
  final TargetModel? selectedTarget;
//
  @override
  final String? selectedPanel;
//
// content
  @override
  @JsonKey()
  final bool trainerIsSignedn;
// String? jsonRootDirectoryNode,
// EncodedJson? jsonClipboardForMove,
  @override
  @JsonKey()
  final bool showClipboardContent;
  @override
  @JsonKey()
  final int force;
// hacky way to force a transition
  @override
  @JsonKey()
  final bool onlyTargetsWrappers;
// hacky way to force a transition
//==========================================================================================
//====  PAGE ROUTE NAME  ===================================================================
//==========================================================================================
  @override
  final String? routeName;
//==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
  @override
  final SnippetBeingEdited? snippetBeingEdited;
  @override
  @JsonKey()
  final bool ONLY_TESTING;

  @override
  String toString() {
    return 'CAPIState(initialValueJsonAssetPath: $initialValueJsonAssetPath, hideIframes: $hideIframes, hideSnippetPencilIcons: $hideSnippetPencilIcons, snippetTreeCalloutW: $snippetTreeCalloutW, snippetTreeCalloutH: $snippetTreeCalloutH, directoryTreeCalloutInitialPos: $directoryTreeCalloutInitialPos, directoryTreeCalloutW: $directoryTreeCalloutW, directoryTreeCalloutH: $directoryTreeCalloutH, newestTarget: $newestTarget, selectedTarget: $selectedTarget, selectedPanel: $selectedPanel, trainerIsSignedn: $trainerIsSignedn, showClipboardContent: $showClipboardContent, force: $force, onlyTargetsWrappers: $onlyTargetsWrappers, routeName: $routeName, snippetBeingEdited: $snippetBeingEdited, ONLY_TESTING: $ONLY_TESTING)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CAPIStateImpl &&
            (identical(other.initialValueJsonAssetPath,
                    initialValueJsonAssetPath) ||
                other.initialValueJsonAssetPath == initialValueJsonAssetPath) &&
            (identical(other.hideIframes, hideIframes) ||
                other.hideIframes == hideIframes) &&
            (identical(other.hideSnippetPencilIcons, hideSnippetPencilIcons) ||
                other.hideSnippetPencilIcons == hideSnippetPencilIcons) &&
            (identical(other.snippetTreeCalloutW, snippetTreeCalloutW) ||
                other.snippetTreeCalloutW == snippetTreeCalloutW) &&
            (identical(other.snippetTreeCalloutH, snippetTreeCalloutH) ||
                other.snippetTreeCalloutH == snippetTreeCalloutH) &&
            (identical(other.directoryTreeCalloutInitialPos,
                    directoryTreeCalloutInitialPos) ||
                other.directoryTreeCalloutInitialPos ==
                    directoryTreeCalloutInitialPos) &&
            (identical(other.directoryTreeCalloutW, directoryTreeCalloutW) ||
                other.directoryTreeCalloutW == directoryTreeCalloutW) &&
            (identical(other.directoryTreeCalloutH, directoryTreeCalloutH) ||
                other.directoryTreeCalloutH == directoryTreeCalloutH) &&
            (identical(other.newestTarget, newestTarget) ||
                other.newestTarget == newestTarget) &&
            (identical(other.selectedTarget, selectedTarget) ||
                other.selectedTarget == selectedTarget) &&
            (identical(other.selectedPanel, selectedPanel) ||
                other.selectedPanel == selectedPanel) &&
            (identical(other.trainerIsSignedn, trainerIsSignedn) ||
                other.trainerIsSignedn == trainerIsSignedn) &&
            (identical(other.showClipboardContent, showClipboardContent) ||
                other.showClipboardContent == showClipboardContent) &&
            (identical(other.force, force) || other.force == force) &&
            (identical(other.onlyTargetsWrappers, onlyTargetsWrappers) ||
                other.onlyTargetsWrappers == onlyTargetsWrappers) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.snippetBeingEdited, snippetBeingEdited) ||
                other.snippetBeingEdited == snippetBeingEdited) &&
            (identical(other.ONLY_TESTING, ONLY_TESTING) ||
                other.ONLY_TESTING == ONLY_TESTING));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      initialValueJsonAssetPath,
      hideIframes,
      hideSnippetPencilIcons,
      snippetTreeCalloutW,
      snippetTreeCalloutH,
      directoryTreeCalloutInitialPos,
      directoryTreeCalloutW,
      directoryTreeCalloutH,
      newestTarget,
      selectedTarget,
      selectedPanel,
      trainerIsSignedn,
      showClipboardContent,
      force,
      onlyTargetsWrappers,
      routeName,
      snippetBeingEdited,
      ONLY_TESTING);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CAPIStateImplCopyWith<_$CAPIStateImpl> get copyWith =>
      __$$CAPIStateImplCopyWithImpl<_$CAPIStateImpl>(this, _$identity);
}

abstract class _CAPIState extends CAPIState {
  factory _CAPIState(
      {final String? initialValueJsonAssetPath,
      final bool hideIframes,
      final bool hideSnippetPencilIcons,
      final double? snippetTreeCalloutW,
      final double? snippetTreeCalloutH,
      final Offset? directoryTreeCalloutInitialPos,
      final double? directoryTreeCalloutW,
      final double? directoryTreeCalloutH,
      final TargetModel? newestTarget,
      final TargetModel? selectedTarget,
      final String? selectedPanel,
      final bool trainerIsSignedn,
      final bool showClipboardContent,
      final int force,
      final bool onlyTargetsWrappers,
      final String? routeName,
      final SnippetBeingEdited? snippetBeingEdited,
      final bool ONLY_TESTING}) = _$CAPIStateImpl;
  _CAPIState._() : super._();

  @override // required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
  String? get initialValueJsonAssetPath;
  @override // both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
  bool get hideIframes;
  @override
  bool get hideSnippetPencilIcons;
  @override // @Default(Offset.zero) Offset? snippetTreeCalloutInitialPos,
  double? get snippetTreeCalloutW;
  @override
  double? get snippetTreeCalloutH;
  @override
  Offset? get directoryTreeCalloutInitialPos;
  @override
  double? get directoryTreeCalloutW;
  @override
  double? get directoryTreeCalloutH;
  @override // @Default(600) double? snippetPropertiesCalloutW,
// @Default(600) double? snippetPropertiesCalloutH,
// @Default({}) Map<String, TargetGroupModel> targetGroupMap,
// @Default([]) List<TargetModel> playList,
// current selection
// List<TargetModel> targetCovers
// TargetModel? hideTargetCoversExcept,
// TargetModel? hideTargetBtnsExcept,
// @Default(false) bool hideAllTargetCovers,
// @Default(false) bool hideAllTargetBtns,
//
  TargetModel? get newestTarget;
  @override
  TargetModel? get selectedTarget;
  @override //
  String? get selectedPanel;
  @override //
// content
  bool get trainerIsSignedn;
  @override // String? jsonRootDirectoryNode,
// EncodedJson? jsonClipboardForMove,
  bool get showClipboardContent;
  @override
  int get force;
  @override // hacky way to force a transition
  bool get onlyTargetsWrappers;
  @override // hacky way to force a transition
//==========================================================================================
//====  PAGE ROUTE NAME  ===================================================================
//==========================================================================================
  String? get routeName;
  @override //==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
  SnippetBeingEdited? get snippetBeingEdited;
  @override
  bool get ONLY_TESTING;
  @override
  @JsonKey(ignore: true)
  _$$CAPIStateImplCopyWith<_$CAPIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
