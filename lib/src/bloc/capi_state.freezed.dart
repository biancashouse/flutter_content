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

// required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
// String?
// initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
// @Default(false) bool hideIframes,
// @Default(false) bool hideSnippetPencilIcons,
// @Default(Offset.zero) Offset? directoryTreeCalloutInitialPos,
// @Default(400) double? directoryTreeCalloutW,
// @Default(600) double? directoryTreeCalloutH,
 TargetModel? get newestTarget; TargetModel? get selectedTarget;//
// String? selectedPanel,
 bool get isSignedIn; bool get signedInAsGuestEditor; bool get showClipboardContent; int get force;// hacky way to force a transition
 bool get onlyTargetsWrappers;// hacky way to force a transition
//==========================================================================================
//====  PAGE ROUTE NAME  ===================================================================
//==========================================================================================
 String? get routeName;//==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
// filters page s.t. only named snippet rendered
 SnippetName? get showOnlySnippet;// when set invoke bloc listener to show tappables
 SnippetName? get snippetNameShowingTappableOverlaysFor; SnippetBeingEdited? get snippetBeingEdited;// VersionId? snippetBeingEditedVersionId,
 bool get ONLY_TESTING;
/// Create a copy of CAPIState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CAPIStateCopyWith<CAPIState> get copyWith => _$CAPIStateCopyWithImpl<CAPIState>(this as CAPIState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CAPIState&&(identical(other.newestTarget, newestTarget) || other.newestTarget == newestTarget)&&(identical(other.selectedTarget, selectedTarget) || other.selectedTarget == selectedTarget)&&(identical(other.isSignedIn, isSignedIn) || other.isSignedIn == isSignedIn)&&(identical(other.signedInAsGuestEditor, signedInAsGuestEditor) || other.signedInAsGuestEditor == signedInAsGuestEditor)&&(identical(other.showClipboardContent, showClipboardContent) || other.showClipboardContent == showClipboardContent)&&(identical(other.force, force) || other.force == force)&&(identical(other.onlyTargetsWrappers, onlyTargetsWrappers) || other.onlyTargetsWrappers == onlyTargetsWrappers)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.showOnlySnippet, showOnlySnippet) || other.showOnlySnippet == showOnlySnippet)&&(identical(other.snippetNameShowingTappableOverlaysFor, snippetNameShowingTappableOverlaysFor) || other.snippetNameShowingTappableOverlaysFor == snippetNameShowingTappableOverlaysFor)&&(identical(other.snippetBeingEdited, snippetBeingEdited) || other.snippetBeingEdited == snippetBeingEdited)&&(identical(other.ONLY_TESTING, ONLY_TESTING) || other.ONLY_TESTING == ONLY_TESTING));
}


@override
int get hashCode => Object.hash(runtimeType,newestTarget,selectedTarget,isSignedIn,signedInAsGuestEditor,showClipboardContent,force,onlyTargetsWrappers,routeName,showOnlySnippet,snippetNameShowingTappableOverlaysFor,snippetBeingEdited,ONLY_TESTING);

@override
String toString() {
  return 'CAPIState(newestTarget: $newestTarget, selectedTarget: $selectedTarget, isSignedIn: $isSignedIn, signedInAsGuestEditor: $signedInAsGuestEditor, showClipboardContent: $showClipboardContent, force: $force, onlyTargetsWrappers: $onlyTargetsWrappers, routeName: $routeName, showOnlySnippet: $showOnlySnippet, snippetNameShowingTappableOverlaysFor: $snippetNameShowingTappableOverlaysFor, snippetBeingEdited: $snippetBeingEdited, ONLY_TESTING: $ONLY_TESTING)';
}


}

/// @nodoc
abstract mixin class $CAPIStateCopyWith<$Res>  {
  factory $CAPIStateCopyWith(CAPIState value, $Res Function(CAPIState) _then) = _$CAPIStateCopyWithImpl;
@useResult
$Res call({
 TargetModel? newestTarget, TargetModel? selectedTarget, bool isSignedIn, bool signedInAsGuestEditor, bool showClipboardContent, int force, bool onlyTargetsWrappers, String? routeName, SnippetName? showOnlySnippet, SnippetName? snippetNameShowingTappableOverlaysFor, SnippetBeingEdited? snippetBeingEdited, bool ONLY_TESTING
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
@pragma('vm:prefer-inline') @override $Res call({Object? newestTarget = freezed,Object? selectedTarget = freezed,Object? isSignedIn = null,Object? signedInAsGuestEditor = null,Object? showClipboardContent = null,Object? force = null,Object? onlyTargetsWrappers = null,Object? routeName = freezed,Object? showOnlySnippet = freezed,Object? snippetNameShowingTappableOverlaysFor = freezed,Object? snippetBeingEdited = freezed,Object? ONLY_TESTING = null,}) {
  return _then(_self.copyWith(
newestTarget: freezed == newestTarget ? _self.newestTarget : newestTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,selectedTarget: freezed == selectedTarget ? _self.selectedTarget : selectedTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,isSignedIn: null == isSignedIn ? _self.isSignedIn : isSignedIn // ignore: cast_nullable_to_non_nullable
as bool,signedInAsGuestEditor: null == signedInAsGuestEditor ? _self.signedInAsGuestEditor : signedInAsGuestEditor // ignore: cast_nullable_to_non_nullable
as bool,showClipboardContent: null == showClipboardContent ? _self.showClipboardContent : showClipboardContent // ignore: cast_nullable_to_non_nullable
as bool,force: null == force ? _self.force : force // ignore: cast_nullable_to_non_nullable
as int,onlyTargetsWrappers: null == onlyTargetsWrappers ? _self.onlyTargetsWrappers : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
as bool,routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,showOnlySnippet: freezed == showOnlySnippet ? _self.showOnlySnippet : showOnlySnippet // ignore: cast_nullable_to_non_nullable
as SnippetName?,snippetNameShowingTappableOverlaysFor: freezed == snippetNameShowingTappableOverlaysFor ? _self.snippetNameShowingTappableOverlaysFor : snippetNameShowingTappableOverlaysFor // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TargetModel? newestTarget,  TargetModel? selectedTarget,  bool isSignedIn,  bool signedInAsGuestEditor,  bool showClipboardContent,  int force,  bool onlyTargetsWrappers,  String? routeName,  SnippetName? showOnlySnippet,  SnippetName? snippetNameShowingTappableOverlaysFor,  SnippetBeingEdited? snippetBeingEdited,  bool ONLY_TESTING)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CAPIState() when $default != null:
return $default(_that.newestTarget,_that.selectedTarget,_that.isSignedIn,_that.signedInAsGuestEditor,_that.showClipboardContent,_that.force,_that.onlyTargetsWrappers,_that.routeName,_that.showOnlySnippet,_that.snippetNameShowingTappableOverlaysFor,_that.snippetBeingEdited,_that.ONLY_TESTING);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TargetModel? newestTarget,  TargetModel? selectedTarget,  bool isSignedIn,  bool signedInAsGuestEditor,  bool showClipboardContent,  int force,  bool onlyTargetsWrappers,  String? routeName,  SnippetName? showOnlySnippet,  SnippetName? snippetNameShowingTappableOverlaysFor,  SnippetBeingEdited? snippetBeingEdited,  bool ONLY_TESTING)  $default,) {final _that = this;
switch (_that) {
case _CAPIState():
return $default(_that.newestTarget,_that.selectedTarget,_that.isSignedIn,_that.signedInAsGuestEditor,_that.showClipboardContent,_that.force,_that.onlyTargetsWrappers,_that.routeName,_that.showOnlySnippet,_that.snippetNameShowingTappableOverlaysFor,_that.snippetBeingEdited,_that.ONLY_TESTING);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TargetModel? newestTarget,  TargetModel? selectedTarget,  bool isSignedIn,  bool signedInAsGuestEditor,  bool showClipboardContent,  int force,  bool onlyTargetsWrappers,  String? routeName,  SnippetName? showOnlySnippet,  SnippetName? snippetNameShowingTappableOverlaysFor,  SnippetBeingEdited? snippetBeingEdited,  bool ONLY_TESTING)?  $default,) {final _that = this;
switch (_that) {
case _CAPIState() when $default != null:
return $default(_that.newestTarget,_that.selectedTarget,_that.isSignedIn,_that.signedInAsGuestEditor,_that.showClipboardContent,_that.force,_that.onlyTargetsWrappers,_that.routeName,_that.showOnlySnippet,_that.snippetNameShowingTappableOverlaysFor,_that.snippetBeingEdited,_that.ONLY_TESTING);case _:
  return null;

}
}

}

/// @nodoc


class _CAPIState implements CAPIState {
   _CAPIState({this.newestTarget, this.selectedTarget, this.isSignedIn = false, this.signedInAsGuestEditor = false, this.showClipboardContent = true, this.force = 0, this.onlyTargetsWrappers = false, this.routeName, this.showOnlySnippet, this.snippetNameShowingTappableOverlaysFor, this.snippetBeingEdited, this.ONLY_TESTING = true});
  

// required bool useFirebase,
// @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
// String?
// initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
// required ModelUR modelUR,
// @Default(false) bool hideIframes,
// @Default(false) bool hideSnippetPencilIcons,
// @Default(Offset.zero) Offset? directoryTreeCalloutInitialPos,
// @Default(400) double? directoryTreeCalloutW,
// @Default(600) double? directoryTreeCalloutH,
@override final  TargetModel? newestTarget;
@override final  TargetModel? selectedTarget;
//
// String? selectedPanel,
@override@JsonKey() final  bool isSignedIn;
@override@JsonKey() final  bool signedInAsGuestEditor;
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
// filters page s.t. only named snippet rendered
@override final  SnippetName? showOnlySnippet;
// when set invoke bloc listener to show tappables
@override final  SnippetName? snippetNameShowingTappableOverlaysFor;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CAPIState&&(identical(other.newestTarget, newestTarget) || other.newestTarget == newestTarget)&&(identical(other.selectedTarget, selectedTarget) || other.selectedTarget == selectedTarget)&&(identical(other.isSignedIn, isSignedIn) || other.isSignedIn == isSignedIn)&&(identical(other.signedInAsGuestEditor, signedInAsGuestEditor) || other.signedInAsGuestEditor == signedInAsGuestEditor)&&(identical(other.showClipboardContent, showClipboardContent) || other.showClipboardContent == showClipboardContent)&&(identical(other.force, force) || other.force == force)&&(identical(other.onlyTargetsWrappers, onlyTargetsWrappers) || other.onlyTargetsWrappers == onlyTargetsWrappers)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.showOnlySnippet, showOnlySnippet) || other.showOnlySnippet == showOnlySnippet)&&(identical(other.snippetNameShowingTappableOverlaysFor, snippetNameShowingTappableOverlaysFor) || other.snippetNameShowingTappableOverlaysFor == snippetNameShowingTappableOverlaysFor)&&(identical(other.snippetBeingEdited, snippetBeingEdited) || other.snippetBeingEdited == snippetBeingEdited)&&(identical(other.ONLY_TESTING, ONLY_TESTING) || other.ONLY_TESTING == ONLY_TESTING));
}


@override
int get hashCode => Object.hash(runtimeType,newestTarget,selectedTarget,isSignedIn,signedInAsGuestEditor,showClipboardContent,force,onlyTargetsWrappers,routeName,showOnlySnippet,snippetNameShowingTappableOverlaysFor,snippetBeingEdited,ONLY_TESTING);

@override
String toString() {
  return 'CAPIState(newestTarget: $newestTarget, selectedTarget: $selectedTarget, isSignedIn: $isSignedIn, signedInAsGuestEditor: $signedInAsGuestEditor, showClipboardContent: $showClipboardContent, force: $force, onlyTargetsWrappers: $onlyTargetsWrappers, routeName: $routeName, showOnlySnippet: $showOnlySnippet, snippetNameShowingTappableOverlaysFor: $snippetNameShowingTappableOverlaysFor, snippetBeingEdited: $snippetBeingEdited, ONLY_TESTING: $ONLY_TESTING)';
}


}

/// @nodoc
abstract mixin class _$CAPIStateCopyWith<$Res> implements $CAPIStateCopyWith<$Res> {
  factory _$CAPIStateCopyWith(_CAPIState value, $Res Function(_CAPIState) _then) = __$CAPIStateCopyWithImpl;
@override @useResult
$Res call({
 TargetModel? newestTarget, TargetModel? selectedTarget, bool isSignedIn, bool signedInAsGuestEditor, bool showClipboardContent, int force, bool onlyTargetsWrappers, String? routeName, SnippetName? showOnlySnippet, SnippetName? snippetNameShowingTappableOverlaysFor, SnippetBeingEdited? snippetBeingEdited, bool ONLY_TESTING
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
@override @pragma('vm:prefer-inline') $Res call({Object? newestTarget = freezed,Object? selectedTarget = freezed,Object? isSignedIn = null,Object? signedInAsGuestEditor = null,Object? showClipboardContent = null,Object? force = null,Object? onlyTargetsWrappers = null,Object? routeName = freezed,Object? showOnlySnippet = freezed,Object? snippetNameShowingTappableOverlaysFor = freezed,Object? snippetBeingEdited = freezed,Object? ONLY_TESTING = null,}) {
  return _then(_CAPIState(
newestTarget: freezed == newestTarget ? _self.newestTarget : newestTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,selectedTarget: freezed == selectedTarget ? _self.selectedTarget : selectedTarget // ignore: cast_nullable_to_non_nullable
as TargetModel?,isSignedIn: null == isSignedIn ? _self.isSignedIn : isSignedIn // ignore: cast_nullable_to_non_nullable
as bool,signedInAsGuestEditor: null == signedInAsGuestEditor ? _self.signedInAsGuestEditor : signedInAsGuestEditor // ignore: cast_nullable_to_non_nullable
as bool,showClipboardContent: null == showClipboardContent ? _self.showClipboardContent : showClipboardContent // ignore: cast_nullable_to_non_nullable
as bool,force: null == force ? _self.force : force // ignore: cast_nullable_to_non_nullable
as int,onlyTargetsWrappers: null == onlyTargetsWrappers ? _self.onlyTargetsWrappers : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
as bool,routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,showOnlySnippet: freezed == showOnlySnippet ? _self.showOnlySnippet : showOnlySnippet // ignore: cast_nullable_to_non_nullable
as SnippetName?,snippetNameShowingTappableOverlaysFor: freezed == snippetNameShowingTappableOverlaysFor ? _self.snippetNameShowingTappableOverlaysFor : snippetNameShowingTappableOverlaysFor // ignore: cast_nullable_to_non_nullable
as SnippetName?,snippetBeingEdited: freezed == snippetBeingEdited ? _self.snippetBeingEdited : snippetBeingEdited // ignore: cast_nullable_to_non_nullable
as SnippetBeingEdited?,ONLY_TESTING: null == ONLY_TESTING ? _self.ONLY_TESTING : ONLY_TESTING // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
