// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PollEvent {
  String get voterId => throw _privateConstructorUsedError;
  PollNode get poll => throw _privateConstructorUsedError;
  String get optionId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String voterId, PollNode poll, String optionId)
    userVoted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String voterId, PollNode poll, String optionId)?
    userVoted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String voterId, PollNode poll, String optionId)? userVoted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserVoted value) userVoted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserVoted value)? userVoted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserVoted value)? userVoted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of PollEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollEventCopyWith<PollEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollEventCopyWith<$Res> {
  factory $PollEventCopyWith(PollEvent value, $Res Function(PollEvent) then) =
      _$PollEventCopyWithImpl<$Res, PollEvent>;
  @useResult
  $Res call({String voterId, PollNode poll, String optionId});
}

/// @nodoc
class _$PollEventCopyWithImpl<$Res, $Val extends PollEvent>
    implements $PollEventCopyWith<$Res> {
  _$PollEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voterId = null,
    Object? poll = null,
    Object? optionId = null,
  }) {
    return _then(
      _value.copyWith(
            voterId:
                null == voterId
                    ? _value.voterId
                    : voterId // ignore: cast_nullable_to_non_nullable
                        as String,
            poll:
                null == poll
                    ? _value.poll
                    : poll // ignore: cast_nullable_to_non_nullable
                        as PollNode,
            optionId:
                null == optionId
                    ? _value.optionId
                    : optionId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserVotedImplCopyWith<$Res>
    implements $PollEventCopyWith<$Res> {
  factory _$$UserVotedImplCopyWith(
    _$UserVotedImpl value,
    $Res Function(_$UserVotedImpl) then,
  ) = __$$UserVotedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String voterId, PollNode poll, String optionId});
}

/// @nodoc
class __$$UserVotedImplCopyWithImpl<$Res>
    extends _$PollEventCopyWithImpl<$Res, _$UserVotedImpl>
    implements _$$UserVotedImplCopyWith<$Res> {
  __$$UserVotedImplCopyWithImpl(
    _$UserVotedImpl _value,
    $Res Function(_$UserVotedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PollEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voterId = null,
    Object? poll = null,
    Object? optionId = null,
  }) {
    return _then(
      _$UserVotedImpl(
        voterId:
            null == voterId
                ? _value.voterId
                : voterId // ignore: cast_nullable_to_non_nullable
                    as String,
        poll:
            null == poll
                ? _value.poll
                : poll // ignore: cast_nullable_to_non_nullable
                    as PollNode,
        optionId:
            null == optionId
                ? _value.optionId
                : optionId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$UserVotedImpl with DiagnosticableTreeMixin implements UserVoted {
  const _$UserVotedImpl({
    required this.voterId,
    required this.poll,
    required this.optionId,
  });

  @override
  final String voterId;
  @override
  final PollNode poll;
  @override
  final String optionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PollEvent.userVoted(voterId: $voterId, poll: $poll, optionId: $optionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PollEvent.userVoted'))
      ..add(DiagnosticsProperty('voterId', voterId))
      ..add(DiagnosticsProperty('poll', poll))
      ..add(DiagnosticsProperty('optionId', optionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVotedImpl &&
            (identical(other.voterId, voterId) || other.voterId == voterId) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, voterId, poll, optionId);

  /// Create a copy of PollEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserVotedImplCopyWith<_$UserVotedImpl> get copyWith =>
      __$$UserVotedImplCopyWithImpl<_$UserVotedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String voterId, PollNode poll, String optionId)
    userVoted,
  }) {
    return userVoted(voterId, poll, optionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String voterId, PollNode poll, String optionId)?
    userVoted,
  }) {
    return userVoted?.call(voterId, poll, optionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String voterId, PollNode poll, String optionId)? userVoted,
    required TResult orElse(),
  }) {
    if (userVoted != null) {
      return userVoted(voterId, poll, optionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserVoted value) userVoted,
  }) {
    return userVoted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserVoted value)? userVoted,
  }) {
    return userVoted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserVoted value)? userVoted,
    required TResult orElse(),
  }) {
    if (userVoted != null) {
      return userVoted(this);
    }
    return orElse();
  }
}

abstract class UserVoted implements PollEvent {
  const factory UserVoted({
    required final String voterId,
    required final PollNode poll,
    required final String optionId,
  }) = _$UserVotedImpl;

  @override
  String get voterId;
  @override
  PollNode get poll;
  @override
  String get optionId;

  /// Create a copy of PollEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserVotedImplCopyWith<_$UserVotedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
