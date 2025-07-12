// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CAPIState {

// TargetModel? tcByNameOrUid(TargetModel tc) => tc.single
//     ? SingleTargetWrapper.singleTarget(name: tc.wName)
//     : _targetGroup(
//   uid: tc.uid,
// );
// TargetModel? tcByUid(TargetModel tc) => _targetGroup(uid: tc.uid);
// TargetModel? _targetGroup({required int uid}) {
//   // then must be an image target
//   for (String name in targetGroupMap.keys) {
//     TargetGroupModel? tcl = imageConfig(name);
//     TargetModel? result;
//     try {
//       result = tcl?.targets.singleWhere((tc) => tc.uid == uid);
//       if (result != null) return result;
//     } catch (e) {
//       // ignore and return null
//     }
//   }
//   return null;
// }
// int numTargetsOnPage() {
//   int numTCs = 0;
//   for (TargetGroupModel list in targetGroupMap.values) {
//     numTCs += list.targets.length;
//   }
//   return numTCs;
// }
 double get CAPI_TARGET_BTN_RADIUS;// required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
// String?
// initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
 bool get hideIframes; bool get hideSnippetPencilIcons;// @Default(Offset.zero) Offset? snippetTreeCalloutInitialPos,
 double? get snippetTreeCalloutW; double? get snippetTreeCalloutH; Offset? get directoryTreeCalloutInitialPos; double? get directoryTreeCalloutW; double? get directoryTreeCalloutH;// @Default(600) double? snippetPropertiesCalloutW,
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
 TargetModel? get newestTarget; TargetModel? get selectedTarget;//
 String? get selectedPanel;//
// content
 bool get trainerIsSignedn;// String? jsonRootDirectoryNode,
// EncodedJson? jsonClipboardForMove,
 bool get showClipboardContent; int get force;// hacky way to force a transition
 bool get onlyTargetsWrappers;// hacky way to force a transition
//==========================================================================================
//====  PAGE ROUTE NAME  ===================================================================
//==========================================================================================
 String? get routeName;//==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
 SnippetName? get snippetNameShowingPinkOverlaysFor; SnippetBeingEdited? get snippetBeingEdited;// VersionId? snippetBeingEditedVersionId,
 bool get ONLY_TESTING;
/// Create a copy of CAPIState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CAPIStateCopyWith<CAPIState> get copyWith => _$CAPIStateCopyWithImpl<CAPIState>(this as CAPIState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CAPIState&&(identical(other.CAPI_TARGET_BTN_RADIUS, CAPI_TARGET_BTN_RADIUS) || other.CAPI_TARGET_BTN_RADIUS == CAPI_TARGET_BTN_RADIUS)&&(identical(other.hideIframes, hideIframes) || other.hideIframes == hideIframes)&&(identical(other.hideSnippetPencilIcons, hideSnippetPencilIcons) || other.hideSnippetPencilIcons == hideSnippetPencilIcons)&&(identical(other.snippetTreeCalloutW, snippetTreeCalloutW) || other.snippetTreeCalloutW == snippetTreeCalloutW)&&(identical(other.snippetTreeCalloutH, snippetTreeCalloutH) || other.snippetTreeCalloutH == snippetTreeCalloutH)&&(identical(other.directoryTreeCalloutInitialPos, directoryTreeCalloutInitialPos) || other.directoryTreeCalloutInitialPos == directoryTreeCalloutInitialPos)&&(identical(other.directoryTreeCalloutW, directoryTreeCalloutW) || other.directoryTreeCalloutW == directoryTreeCalloutW)&&(identical(other.directoryTreeCalloutH, directoryTreeCalloutH) || other.directoryTreeCalloutH == directoryTreeCalloutH)&&(identical(other.newestTarget, newestTarget) || other.newestTarget == newestTarget)&&(identical(other.selectedTarget, selectedTarget) || other.selectedTarget == selectedTarget)&&(identical(other.selectedPanel, selectedPanel) || other.selectedPanel == selectedPanel)&&(identical(other.trainerIsSignedn, trainerIsSignedn) || other.trainerIsSignedn == trainerIsSignedn)&&(identical(other.showClipboardContent, showClipboardContent) || other.showClipboardContent == showClipboardContent)&&(identical(other.force, force) || other.force == force)&&(identical(other.onlyTargetsWrappers, onlyTargetsWrappers) || other.onlyTargetsWrappers == onlyTargetsWrappers)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.snippetNameShowingPinkOverlaysFor, snippetNameShowingPinkOverlaysFor) || other.snippetNameShowingPinkOverlaysFor == snippetNameShowingPinkOverlaysFor)&&(identical(other.snippetBeingEdited, snippetBeingEdited) || other.snippetBeingEdited == snippetBeingEdited)&&(identical(other.ONLY_TESTING, ONLY_TESTING) || other.ONLY_TESTING == ONLY_TESTING));
}


@override
int get hashCode => Object.hashAll([runtimeType,CAPI_TARGET_BTN_RADIUS,hideIframes,hideSnippetPencilIcons,snippetTreeCalloutW,snippetTreeCalloutH,directoryTreeCalloutInitialPos,directoryTreeCalloutW,directoryTreeCalloutH,newestTarget,selectedTarget,selectedPanel,trainerIsSignedn,showClipboardContent,force,onlyTargetsWrappers,routeName,snippetNameShowingPinkOverlaysFor,snippetBeingEdited,ONLY_TESTING]);

@override
String toString() {
  return 'CAPIState(CAPI_TARGET_BTN_RADIUS: $CAPI_TARGET_BTN_RADIUS, hideIframes: $hideIframes, hideSnippetPencilIcons: $hideSnippetPencilIcons, snippetTreeCalloutW: $snippetTreeCalloutW, snippetTreeCalloutH: $snippetTreeCalloutH, directoryTreeCalloutInitialPos: $directoryTreeCalloutInitialPos, directoryTreeCalloutW: $directoryTreeCalloutW, directoryTreeCalloutH: $directoryTreeCalloutH, newestTarget: $newestTarget, selectedTarget: $selectedTarget, selectedPanel: $selectedPanel, trainerIsSignedn: $trainerIsSignedn, showClipboardContent: $showClipboardContent, force: $force, onlyTargetsWrappers: $onlyTargetsWrappers, routeName: $routeName, snippetNameShowingPinkOverlaysFor: $snippetNameShowingPinkOverlaysFor, snippetBeingEdited: $snippetBeingEdited, ONLY_TESTING: $ONLY_TESTING)';
}


}

/// @nodoc
abstract mixin class $CAPIStateCopyWith<$Res>  {
  factory $CAPIStateCopyWith(CAPIState value, $Res Function(CAPIState) _then) = _$CAPIStateCopyWithImpl;
@useResult
$Res call({
 bool hideIframes, bool hideSnippetPencilIcons, double? snippetTreeCalloutW, double? snippetTreeCalloutH, Offset? directoryTreeCalloutInitialPos, double? directoryTreeCalloutW, double? directoryTreeCalloutH, TargetModel? newestTarget, TargetModel? selectedTarget, String? selectedPanel, bool trainerIsSignedn, bool showClipboardContent, int force, bool onlyTargetsWrappers, String? routeName, SnippetName? snippetNameShowingPinkOverlaysFor, SnippetBeingEdited? snippetBeingEdited, bool ONLY_TESTING
});




}
/// @nodoc
class _$CAPIStateCopyWithImpl<$Res>
    implements $CAPIStateCopyWith<$Res> {
  _$CAPIStateCopyWithImpl(this._self, this._then);

  final CAPIState _self;
  final $Res Function(CAPIState) _then;

/// Create a copy of CAPIState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hideIframes = null,Object? hideSnippetPencilIcons = null,Object? snippetTreeCalloutW = freezed,Object? snippetTreeCalloutH = freezed,Object? directoryTreeCalloutInitialPos = freezed,Object? directoryTreeCalloutW = freezed,Object? directoryTreeCalloutH = freezed,Object? newestTarget = freezed,Object? selectedTarget = freezed,Object? selectedPanel = freezed,Object? trainerIsSignedn = null,Object? showClipboardContent = null,Object? force = null,Object? onlyTargetsWrappers = null,Object? routeName = freezed,Object? snippetNameShowingPinkOverlaysFor = freezed,Object? snippetBeingEdited = freezed,Object? ONLY_TESTING = null,}) {
  return _then(_self.copyWith(
hideIframes: null == hideIframes ? _self.hideIframes : hideIframes // ignore: cast_nullable_to_non_nullable
as bool,hideSnippetPencilIcons: null == hideSnippetPencilIcons ? _self.hideSnippetPencilIcons : hideSnippetPencilIcons // ignore: cast_nullable_to_non_nullable
as bool,snippetTreeCalloutW: freezed == snippetTreeCalloutW ? _self.snippetTreeCalloutW : snippetTreeCalloutW // ignore: cast_nullable_to_non_nullable
as double?,snippetTreeCalloutH: freezed == snippetTreeCalloutH ? _self.snippetTreeCalloutH : snippetTreeCalloutH // ignore: cast_nullable_to_non_nullable
as double?,directoryTreeCalloutInitialPos: freezed == directoryTreeCalloutInitialPos ? _self.directoryTreeCalloutInitialPos : directoryTreeCalloutInitialPos // ignore: cast_nullable_to_non_nullable
as Offset?,directoryTreeCalloutW: freezed == directoryTreeCalloutW ? _self.directoryTreeCalloutW : directoryTreeCalloutW // ignore: cast_nullable_to_non_nullable
as double?,directoryTreeCalloutH: freezed == directoryTreeCalloutH ? _self.directoryTreeCalloutH : directoryTreeCalloutH // ignore: cast_nullable_to_non_nullable
as double?,newestTarget: freezed == newestTarget ? _self.newestTarget : newestTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,selectedTarget: freezed == selectedTarget ? _self.selectedTarget : selectedTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,selectedPanel: freezed == selectedPanel ? _self.selectedPanel : selectedPanel // ignore: cast_nullable_to_non_nullable
as String?,trainerIsSignedn: null == trainerIsSignedn ? _self.trainerIsSignedn : trainerIsSignedn // ignore: cast_nullable_to_non_nullable
as bool,showClipboardContent: null == showClipboardContent ? _self.showClipboardContent : showClipboardContent // ignore: cast_nullable_to_non_nullable
as bool,force: null == force ? _self.force : force // ignore: cast_nullable_to_non_nullable
as int,onlyTargetsWrappers: null == onlyTargetsWrappers ? _self.onlyTargetsWrappers : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
as bool,routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,snippetNameShowingPinkOverlaysFor: freezed == snippetNameShowingPinkOverlaysFor ? _self.snippetNameShowingPinkOverlaysFor : snippetNameShowingPinkOverlaysFor // ignore: cast_nullable_to_non_nullable
as SnippetName?,snippetBeingEdited: freezed == snippetBeingEdited ? _self.snippetBeingEdited : snippetBeingEdited // ignore: cast_nullable_to_non_nullable
as SnippetBeingEdited?,ONLY_TESTING: null == ONLY_TESTING ? _self.ONLY_TESTING : ONLY_TESTING // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CAPIState].
extension CAPIStatePatterns on CAPIState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CAPIState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CAPIState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CAPIState value)  $default,){
final _that = this;
switch (_that) {
case _CAPIState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CAPIState value)?  $default,){
final _that = this;
switch (_that) {
case _CAPIState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hideIframes,  bool hideSnippetPencilIcons,  double? snippetTreeCalloutW,  double? snippetTreeCalloutH,  Offset? directoryTreeCalloutInitialPos,  double? directoryTreeCalloutW,  double? directoryTreeCalloutH,  TargetModel? newestTarget,  TargetModel? selectedTarget,  String? selectedPanel,  bool trainerIsSignedn,  bool showClipboardContent,  int force,  bool onlyTargetsWrappers,  String? routeName,  SnippetName? snippetNameShowingPinkOverlaysFor,  SnippetBeingEdited? snippetBeingEdited,  bool ONLY_TESTING)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CAPIState() when $default != null:
return $default(_that.hideIframes,_that.hideSnippetPencilIcons,_that.snippetTreeCalloutW,_that.snippetTreeCalloutH,_that.directoryTreeCalloutInitialPos,_that.directoryTreeCalloutW,_that.directoryTreeCalloutH,_that.newestTarget,_that.selectedTarget,_that.selectedPanel,_that.trainerIsSignedn,_that.showClipboardContent,_that.force,_that.onlyTargetsWrappers,_that.routeName,_that.snippetNameShowingPinkOverlaysFor,_that.snippetBeingEdited,_that.ONLY_TESTING);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hideIframes,  bool hideSnippetPencilIcons,  double? snippetTreeCalloutW,  double? snippetTreeCalloutH,  Offset? directoryTreeCalloutInitialPos,  double? directoryTreeCalloutW,  double? directoryTreeCalloutH,  TargetModel? newestTarget,  TargetModel? selectedTarget,  String? selectedPanel,  bool trainerIsSignedn,  bool showClipboardContent,  int force,  bool onlyTargetsWrappers,  String? routeName,  SnippetName? snippetNameShowingPinkOverlaysFor,  SnippetBeingEdited? snippetBeingEdited,  bool ONLY_TESTING)  $default,) {final _that = this;
switch (_that) {
case _CAPIState():
return $default(_that.hideIframes,_that.hideSnippetPencilIcons,_that.snippetTreeCalloutW,_that.snippetTreeCalloutH,_that.directoryTreeCalloutInitialPos,_that.directoryTreeCalloutW,_that.directoryTreeCalloutH,_that.newestTarget,_that.selectedTarget,_that.selectedPanel,_that.trainerIsSignedn,_that.showClipboardContent,_that.force,_that.onlyTargetsWrappers,_that.routeName,_that.snippetNameShowingPinkOverlaysFor,_that.snippetBeingEdited,_that.ONLY_TESTING);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hideIframes,  bool hideSnippetPencilIcons,  double? snippetTreeCalloutW,  double? snippetTreeCalloutH,  Offset? directoryTreeCalloutInitialPos,  double? directoryTreeCalloutW,  double? directoryTreeCalloutH,  TargetModel? newestTarget,  TargetModel? selectedTarget,  String? selectedPanel,  bool trainerIsSignedn,  bool showClipboardContent,  int force,  bool onlyTargetsWrappers,  String? routeName,  SnippetName? snippetNameShowingPinkOverlaysFor,  SnippetBeingEdited? snippetBeingEdited,  bool ONLY_TESTING)?  $default,) {final _that = this;
switch (_that) {
case _CAPIState() when $default != null:
return $default(_that.hideIframes,_that.hideSnippetPencilIcons,_that.snippetTreeCalloutW,_that.snippetTreeCalloutH,_that.directoryTreeCalloutInitialPos,_that.directoryTreeCalloutW,_that.directoryTreeCalloutH,_that.newestTarget,_that.selectedTarget,_that.selectedPanel,_that.trainerIsSignedn,_that.showClipboardContent,_that.force,_that.onlyTargetsWrappers,_that.routeName,_that.snippetNameShowingPinkOverlaysFor,_that.snippetBeingEdited,_that.ONLY_TESTING);case _:
  return null;

}
}

}

/// @nodoc


class _CAPIState extends CAPIState {
   _CAPIState({this.hideIframes = false, this.hideSnippetPencilIcons = false, this.snippetTreeCalloutW = 400, this.snippetTreeCalloutH = 600, this.directoryTreeCalloutInitialPos = Offset.zero, this.directoryTreeCalloutW = 400, this.directoryTreeCalloutH = 600, this.newestTarget, this.selectedTarget, this.selectedPanel, this.trainerIsSignedn = false, this.showClipboardContent = true, this.force = 0, this.onlyTargetsWrappers = false, this.routeName, this.snippetNameShowingPinkOverlaysFor, this.snippetBeingEdited, this.ONLY_TESTING = true}): super._();
  

// required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
// String?
// initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
@override@JsonKey() final  bool hideIframes;
@override@JsonKey() final  bool hideSnippetPencilIcons;
// @Default(Offset.zero) Offset? snippetTreeCalloutInitialPos,
@override@JsonKey() final  double? snippetTreeCalloutW;
@override@JsonKey() final  double? snippetTreeCalloutH;
@override@JsonKey() final  Offset? directoryTreeCalloutInitialPos;
@override@JsonKey() final  double? directoryTreeCalloutW;
@override@JsonKey() final  double? directoryTreeCalloutH;
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
@override final  TargetModel? newestTarget;
@override final  TargetModel? selectedTarget;
//
@override final  String? selectedPanel;
//
// content
@override@JsonKey() final  bool trainerIsSignedn;
// String? jsonRootDirectoryNode,
// EncodedJson? jsonClipboardForMove,
@override@JsonKey() final  bool showClipboardContent;
@override@JsonKey() final  int force;
// hacky way to force a transition
@override@JsonKey() final  bool onlyTargetsWrappers;
// hacky way to force a transition
//==========================================================================================
//====  PAGE ROUTE NAME  ===================================================================
//==========================================================================================
@override final  String? routeName;
//==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
@override final  SnippetName? snippetNameShowingPinkOverlaysFor;
@override final  SnippetBeingEdited? snippetBeingEdited;
// VersionId? snippetBeingEditedVersionId,
@override@JsonKey() final  bool ONLY_TESTING;

/// Create a copy of CAPIState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CAPIStateCopyWith<_CAPIState> get copyWith => __$CAPIStateCopyWithImpl<_CAPIState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CAPIState&&(identical(other.hideIframes, hideIframes) || other.hideIframes == hideIframes)&&(identical(other.hideSnippetPencilIcons, hideSnippetPencilIcons) || other.hideSnippetPencilIcons == hideSnippetPencilIcons)&&(identical(other.snippetTreeCalloutW, snippetTreeCalloutW) || other.snippetTreeCalloutW == snippetTreeCalloutW)&&(identical(other.snippetTreeCalloutH, snippetTreeCalloutH) || other.snippetTreeCalloutH == snippetTreeCalloutH)&&(identical(other.directoryTreeCalloutInitialPos, directoryTreeCalloutInitialPos) || other.directoryTreeCalloutInitialPos == directoryTreeCalloutInitialPos)&&(identical(other.directoryTreeCalloutW, directoryTreeCalloutW) || other.directoryTreeCalloutW == directoryTreeCalloutW)&&(identical(other.directoryTreeCalloutH, directoryTreeCalloutH) || other.directoryTreeCalloutH == directoryTreeCalloutH)&&(identical(other.newestTarget, newestTarget) || other.newestTarget == newestTarget)&&(identical(other.selectedTarget, selectedTarget) || other.selectedTarget == selectedTarget)&&(identical(other.selectedPanel, selectedPanel) || other.selectedPanel == selectedPanel)&&(identical(other.trainerIsSignedn, trainerIsSignedn) || other.trainerIsSignedn == trainerIsSignedn)&&(identical(other.showClipboardContent, showClipboardContent) || other.showClipboardContent == showClipboardContent)&&(identical(other.force, force) || other.force == force)&&(identical(other.onlyTargetsWrappers, onlyTargetsWrappers) || other.onlyTargetsWrappers == onlyTargetsWrappers)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.snippetNameShowingPinkOverlaysFor, snippetNameShowingPinkOverlaysFor) || other.snippetNameShowingPinkOverlaysFor == snippetNameShowingPinkOverlaysFor)&&(identical(other.snippetBeingEdited, snippetBeingEdited) || other.snippetBeingEdited == snippetBeingEdited)&&(identical(other.ONLY_TESTING, ONLY_TESTING) || other.ONLY_TESTING == ONLY_TESTING));
}


@override
int get hashCode => Object.hash(runtimeType,hideIframes,hideSnippetPencilIcons,snippetTreeCalloutW,snippetTreeCalloutH,directoryTreeCalloutInitialPos,directoryTreeCalloutW,directoryTreeCalloutH,newestTarget,selectedTarget,selectedPanel,trainerIsSignedn,showClipboardContent,force,onlyTargetsWrappers,routeName,snippetNameShowingPinkOverlaysFor,snippetBeingEdited,ONLY_TESTING);

@override
String toString() {
  return 'CAPIState(hideIframes: $hideIframes, hideSnippetPencilIcons: $hideSnippetPencilIcons, snippetTreeCalloutW: $snippetTreeCalloutW, snippetTreeCalloutH: $snippetTreeCalloutH, directoryTreeCalloutInitialPos: $directoryTreeCalloutInitialPos, directoryTreeCalloutW: $directoryTreeCalloutW, directoryTreeCalloutH: $directoryTreeCalloutH, newestTarget: $newestTarget, selectedTarget: $selectedTarget, selectedPanel: $selectedPanel, trainerIsSignedn: $trainerIsSignedn, showClipboardContent: $showClipboardContent, force: $force, onlyTargetsWrappers: $onlyTargetsWrappers, routeName: $routeName, snippetNameShowingPinkOverlaysFor: $snippetNameShowingPinkOverlaysFor, snippetBeingEdited: $snippetBeingEdited, ONLY_TESTING: $ONLY_TESTING)';
}


}

/// @nodoc
abstract mixin class _$CAPIStateCopyWith<$Res> implements $CAPIStateCopyWith<$Res> {
  factory _$CAPIStateCopyWith(_CAPIState value, $Res Function(_CAPIState) _then) = __$CAPIStateCopyWithImpl;
@override @useResult
$Res call({
 bool hideIframes, bool hideSnippetPencilIcons, double? snippetTreeCalloutW, double? snippetTreeCalloutH, Offset? directoryTreeCalloutInitialPos, double? directoryTreeCalloutW, double? directoryTreeCalloutH, TargetModel? newestTarget, TargetModel? selectedTarget, String? selectedPanel, bool trainerIsSignedn, bool showClipboardContent, int force, bool onlyTargetsWrappers, String? routeName, SnippetName? snippetNameShowingPinkOverlaysFor, SnippetBeingEdited? snippetBeingEdited, bool ONLY_TESTING
});




}
/// @nodoc
class __$CAPIStateCopyWithImpl<$Res>
    implements _$CAPIStateCopyWith<$Res> {
  __$CAPIStateCopyWithImpl(this._self, this._then);

  final _CAPIState _self;
  final $Res Function(_CAPIState) _then;

/// Create a copy of CAPIState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hideIframes = null,Object? hideSnippetPencilIcons = null,Object? snippetTreeCalloutW = freezed,Object? snippetTreeCalloutH = freezed,Object? directoryTreeCalloutInitialPos = freezed,Object? directoryTreeCalloutW = freezed,Object? directoryTreeCalloutH = freezed,Object? newestTarget = freezed,Object? selectedTarget = freezed,Object? selectedPanel = freezed,Object? trainerIsSignedn = null,Object? showClipboardContent = null,Object? force = null,Object? onlyTargetsWrappers = null,Object? routeName = freezed,Object? snippetNameShowingPinkOverlaysFor = freezed,Object? snippetBeingEdited = freezed,Object? ONLY_TESTING = null,}) {
  return _then(_CAPIState(
hideIframes: null == hideIframes ? _self.hideIframes : hideIframes // ignore: cast_nullable_to_non_nullable
as bool,hideSnippetPencilIcons: null == hideSnippetPencilIcons ? _self.hideSnippetPencilIcons : hideSnippetPencilIcons // ignore: cast_nullable_to_non_nullable
as bool,snippetTreeCalloutW: freezed == snippetTreeCalloutW ? _self.snippetTreeCalloutW : snippetTreeCalloutW // ignore: cast_nullable_to_non_nullable
as double?,snippetTreeCalloutH: freezed == snippetTreeCalloutH ? _self.snippetTreeCalloutH : snippetTreeCalloutH // ignore: cast_nullable_to_non_nullable
as double?,directoryTreeCalloutInitialPos: freezed == directoryTreeCalloutInitialPos ? _self.directoryTreeCalloutInitialPos : directoryTreeCalloutInitialPos // ignore: cast_nullable_to_non_nullable
as Offset?,directoryTreeCalloutW: freezed == directoryTreeCalloutW ? _self.directoryTreeCalloutW : directoryTreeCalloutW // ignore: cast_nullable_to_non_nullable
as double?,directoryTreeCalloutH: freezed == directoryTreeCalloutH ? _self.directoryTreeCalloutH : directoryTreeCalloutH // ignore: cast_nullable_to_non_nullable
as double?,newestTarget: freezed == newestTarget ? _self.newestTarget : newestTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,selectedTarget: freezed == selectedTarget ? _self.selectedTarget : selectedTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,selectedPanel: freezed == selectedPanel ? _self.selectedPanel : selectedPanel // ignore: cast_nullable_to_non_nullable
as String?,trainerIsSignedn: null == trainerIsSignedn ? _self.trainerIsSignedn : trainerIsSignedn // ignore: cast_nullable_to_non_nullable
as bool,showClipboardContent: null == showClipboardContent ? _self.showClipboardContent : showClipboardContent // ignore: cast_nullable_to_non_nullable
as bool,force: null == force ? _self.force : force // ignore: cast_nullable_to_non_nullable
as int,onlyTargetsWrappers: null == onlyTargetsWrappers ? _self.onlyTargetsWrappers : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
as bool,routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,snippetNameShowingPinkOverlaysFor: freezed == snippetNameShowingPinkOverlaysFor ? _self.snippetNameShowingPinkOverlaysFor : snippetNameShowingPinkOverlaysFor // ignore: cast_nullable_to_non_nullable
as SnippetName?,snippetBeingEdited: freezed == snippetBeingEdited ? _self.snippetBeingEdited : snippetBeingEdited // ignore: cast_nullable_to_non_nullable
as SnippetBeingEdited?,ONLY_TESTING: null == ONLY_TESTING ? _self.ONLY_TESTING : ONLY_TESTING // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
