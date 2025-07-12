// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PollEvent implements DiagnosticableTreeMixin {

 VoterId get voterId; PollNode get poll; PollOptionId get optionId;
/// Create a copy of PollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollEventCopyWith<PollEvent> get copyWith => _$PollEventCopyWithImpl<PollEvent>(this as PollEvent, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PollEvent'))
    ..add(DiagnosticsProperty('voterId', voterId))..add(DiagnosticsProperty('poll', poll))..add(DiagnosticsProperty('optionId', optionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollEvent&&(identical(other.voterId, voterId) || other.voterId == voterId)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.optionId, optionId) || other.optionId == optionId));
}


@override
int get hashCode => Object.hash(runtimeType,voterId,poll,optionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PollEvent(voterId: $voterId, poll: $poll, optionId: $optionId)';
}


}

/// @nodoc
abstract mixin class $PollEventCopyWith<$Res>  {
  factory $PollEventCopyWith(PollEvent value, $Res Function(PollEvent) _then) = _$PollEventCopyWithImpl;
@useResult
$Res call({
 VoterId voterId, PollNode poll, PollOptionId optionId
});




}
/// @nodoc
class _$PollEventCopyWithImpl<$Res>
    implements $PollEventCopyWith<$Res> {
  _$PollEventCopyWithImpl(this._self, this._then);

  final PollEvent _self;
  final $Res Function(PollEvent) _then;

/// Create a copy of PollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voterId = null,Object? poll = null,Object? optionId = null,}) {
  return _then(_self.copyWith(
voterId: null == voterId ? _self.voterId : voterId // ignore: cast_nullable_to_non_nullable
as VoterId,poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as PollNode,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as PollOptionId,
  ));
}

}


/// Adds pattern-matching-related methods to [PollEvent].
extension PollEventPatterns on PollEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserVoted value)?  userVoted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserVoted() when userVoted != null:
return userVoted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserVoted value)  userVoted,}){
final _that = this;
switch (_that) {
case UserVoted():
return userVoted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserVoted value)?  userVoted,}){
final _that = this;
switch (_that) {
case UserVoted() when userVoted != null:
return userVoted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VoterId voterId,  PollNode poll,  PollOptionId optionId)?  userVoted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserVoted() when userVoted != null:
return userVoted(_that.voterId,_that.poll,_that.optionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VoterId voterId,  PollNode poll,  PollOptionId optionId)  userVoted,}) {final _that = this;
switch (_that) {
case UserVoted():
return userVoted(_that.voterId,_that.poll,_that.optionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VoterId voterId,  PollNode poll,  PollOptionId optionId)?  userVoted,}) {final _that = this;
switch (_that) {
case UserVoted() when userVoted != null:
return userVoted(_that.voterId,_that.poll,_that.optionId);case _:
  return null;

}
}

}

/// @nodoc


class UserVoted extends PollEvent with DiagnosticableTreeMixin {
  const UserVoted({required this.voterId, required this.poll, required this.optionId}): super._();
  

@override final  VoterId voterId;
@override final  PollNode poll;
@override final  PollOptionId optionId;

/// Create a copy of PollEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserVotedCopyWith<UserVoted> get copyWith => _$UserVotedCopyWithImpl<UserVoted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PollEvent.userVoted'))
    ..add(DiagnosticsProperty('voterId', voterId))..add(DiagnosticsProperty('poll', poll))..add(DiagnosticsProperty('optionId', optionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserVoted&&(identical(other.voterId, voterId) || other.voterId == voterId)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.optionId, optionId) || other.optionId == optionId));
}


@override
int get hashCode => Object.hash(runtimeType,voterId,poll,optionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PollEvent.userVoted(voterId: $voterId, poll: $poll, optionId: $optionId)';
}


}

/// @nodoc
abstract mixin class $UserVotedCopyWith<$Res> implements $PollEventCopyWith<$Res> {
  factory $UserVotedCopyWith(UserVoted value, $Res Function(UserVoted) _then) = _$UserVotedCopyWithImpl;
@override @useResult
$Res call({
 VoterId voterId, PollNode poll, PollOptionId optionId
});




}
/// @nodoc
class _$UserVotedCopyWithImpl<$Res>
    implements $UserVotedCopyWith<$Res> {
  _$UserVotedCopyWithImpl(this._self, this._then);

  final UserVoted _self;
  final $Res Function(UserVoted) _then;

/// Create a copy of PollEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voterId = null,Object? poll = null,Object? optionId = null,}) {
  return _then(UserVoted(
voterId: null == voterId ? _self.voterId : voterId // ignore: cast_nullable_to_non_nullable
as VoterId,poll: null == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as PollNode,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as PollOptionId,
  ));
}


}

// dart format on
