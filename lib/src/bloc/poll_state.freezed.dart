// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PollState {

 String get pollName; int? get startDate; int? get endDate; OptionVoteCountMap get optionVoteCounts; UserVoterRecord? get userVote; dynamic get locked;
/// Create a copy of PollState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollStateCopyWith<PollState> get copyWith => _$PollStateCopyWithImpl<PollState>(this as PollState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollState&&(identical(other.pollName, pollName) || other.pollName == pollName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.optionVoteCounts, optionVoteCounts)&&(identical(other.userVote, userVote) || other.userVote == userVote)&&const DeepCollectionEquality().equals(other.locked, locked));
}


@override
int get hashCode => Object.hash(runtimeType,pollName,startDate,endDate,const DeepCollectionEquality().hash(optionVoteCounts),userVote,const DeepCollectionEquality().hash(locked));

@override
String toString() {
  return 'PollState(pollName: $pollName, startDate: $startDate, endDate: $endDate, optionVoteCounts: $optionVoteCounts, userVote: $userVote, locked: $locked)';
}


}

/// @nodoc
abstract mixin class $PollStateCopyWith<$Res>  {
  factory $PollStateCopyWith(PollState value, $Res Function(PollState) _then) = _$PollStateCopyWithImpl;
@useResult
$Res call({
 String pollName, int? startDate, int? endDate, OptionVoteCountMap optionVoteCounts, UserVoterRecord? userVote, dynamic locked
});




}
/// @nodoc
class _$PollStateCopyWithImpl<$Res>
    implements $PollStateCopyWith<$Res> {
  _$PollStateCopyWithImpl(this._self, this._then);

  final PollState _self;
  final $Res Function(PollState) _then;

/// Create a copy of PollState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pollName = null,Object? startDate = freezed,Object? endDate = freezed,Object? optionVoteCounts = null,Object? userVote = freezed,Object? locked = freezed,}) {
  return _then(_self.copyWith(
pollName: null == pollName ? _self.pollName : pollName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int?,optionVoteCounts: null == optionVoteCounts ? _self.optionVoteCounts : optionVoteCounts // ignore: cast_nullable_to_non_nullable
as OptionVoteCountMap,userVote: freezed == userVote ? _self.userVote : userVote // ignore: cast_nullable_to_non_nullable
as UserVoterRecord?,locked: freezed == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [PollState].
extension PollStatePatterns on PollState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PollState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PollState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PollState value)  $default,){
final _that = this;
switch (_that) {
case _PollState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PollState value)?  $default,){
final _that = this;
switch (_that) {
case _PollState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pollName,  int? startDate,  int? endDate,  OptionVoteCountMap optionVoteCounts,  UserVoterRecord? userVote,  dynamic locked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PollState() when $default != null:
return $default(_that.pollName,_that.startDate,_that.endDate,_that.optionVoteCounts,_that.userVote,_that.locked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pollName,  int? startDate,  int? endDate,  OptionVoteCountMap optionVoteCounts,  UserVoterRecord? userVote,  dynamic locked)  $default,) {final _that = this;
switch (_that) {
case _PollState():
return $default(_that.pollName,_that.startDate,_that.endDate,_that.optionVoteCounts,_that.userVote,_that.locked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pollName,  int? startDate,  int? endDate,  OptionVoteCountMap optionVoteCounts,  UserVoterRecord? userVote,  dynamic locked)?  $default,) {final _that = this;
switch (_that) {
case _PollState() when $default != null:
return $default(_that.pollName,_that.startDate,_that.endDate,_that.optionVoteCounts,_that.userVote,_that.locked);case _:
  return null;

}
}

}

/// @nodoc


class _PollState extends PollState {
   _PollState({required this.pollName, this.startDate, this.endDate, required final  OptionVoteCountMap optionVoteCounts, this.userVote, this.locked = false}): _optionVoteCounts = optionVoteCounts,super._();
  

@override final  String pollName;
@override final  int? startDate;
@override final  int? endDate;
 final  OptionVoteCountMap _optionVoteCounts;
@override OptionVoteCountMap get optionVoteCounts {
  if (_optionVoteCounts is EqualUnmodifiableMapView) return _optionVoteCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_optionVoteCounts);
}

@override final  UserVoterRecord? userVote;
@override@JsonKey() final  dynamic locked;

/// Create a copy of PollState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PollStateCopyWith<_PollState> get copyWith => __$PollStateCopyWithImpl<_PollState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PollState&&(identical(other.pollName, pollName) || other.pollName == pollName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._optionVoteCounts, _optionVoteCounts)&&(identical(other.userVote, userVote) || other.userVote == userVote)&&const DeepCollectionEquality().equals(other.locked, locked));
}


@override
int get hashCode => Object.hash(runtimeType,pollName,startDate,endDate,const DeepCollectionEquality().hash(_optionVoteCounts),userVote,const DeepCollectionEquality().hash(locked));

@override
String toString() {
  return 'PollState(pollName: $pollName, startDate: $startDate, endDate: $endDate, optionVoteCounts: $optionVoteCounts, userVote: $userVote, locked: $locked)';
}


}

/// @nodoc
abstract mixin class _$PollStateCopyWith<$Res> implements $PollStateCopyWith<$Res> {
  factory _$PollStateCopyWith(_PollState value, $Res Function(_PollState) _then) = __$PollStateCopyWithImpl;
@override @useResult
$Res call({
 String pollName, int? startDate, int? endDate, OptionVoteCountMap optionVoteCounts, UserVoterRecord? userVote, dynamic locked
});




}
/// @nodoc
class __$PollStateCopyWithImpl<$Res>
    implements _$PollStateCopyWith<$Res> {
  __$PollStateCopyWithImpl(this._self, this._then);

  final _PollState _self;
  final $Res Function(_PollState) _then;

/// Create a copy of PollState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pollName = null,Object? startDate = freezed,Object? endDate = freezed,Object? optionVoteCounts = null,Object? userVote = freezed,Object? locked = freezed,}) {
  return _then(_PollState(
pollName: null == pollName ? _self.pollName : pollName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int?,optionVoteCounts: null == optionVoteCounts ? _self._optionVoteCounts : optionVoteCounts // ignore: cast_nullable_to_non_nullable
as OptionVoteCountMap,userVote: freezed == userVote ? _self.userVote : userVote // ignore: cast_nullable_to_non_nullable
as UserVoterRecord?,locked: freezed == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
