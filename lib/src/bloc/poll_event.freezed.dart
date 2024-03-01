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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PollEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String optionId) userVoted,
    required TResult Function(String newVoterId) voterIdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String optionId)? userVoted,
    TResult? Function(String newVoterId)? voterIdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String optionId)? userVoted,
    TResult Function(String newVoterId)? voterIdCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserVoted value) userVoted,
    required TResult Function(VoterIdCreated value) voterIdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserVoted value)? userVoted,
    TResult? Function(VoterIdCreated value)? voterIdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserVoted value)? userVoted,
    TResult Function(VoterIdCreated value)? voterIdCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollEventCopyWith<$Res> {
  factory $PollEventCopyWith(PollEvent value, $Res Function(PollEvent) then) =
      _$PollEventCopyWithImpl<$Res, PollEvent>;
}

/// @nodoc
class _$PollEventCopyWithImpl<$Res, $Val extends PollEvent>
    implements $PollEventCopyWith<$Res> {
  _$PollEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserVotedImplCopyWith<$Res> {
  factory _$$UserVotedImplCopyWith(
          _$UserVotedImpl value, $Res Function(_$UserVotedImpl) then) =
      __$$UserVotedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String optionId});
}

/// @nodoc
class __$$UserVotedImplCopyWithImpl<$Res>
    extends _$PollEventCopyWithImpl<$Res, _$UserVotedImpl>
    implements _$$UserVotedImplCopyWith<$Res> {
  __$$UserVotedImplCopyWithImpl(
      _$UserVotedImpl _value, $Res Function(_$UserVotedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
  }) {
    return _then(_$UserVotedImpl(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserVotedImpl with DiagnosticableTreeMixin implements UserVoted {
  const _$UserVotedImpl({required this.optionId});

  @override
  final String optionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PollEvent.userVoted(optionId: $optionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PollEvent.userVoted'))
      ..add(DiagnosticsProperty('optionId', optionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVotedImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, optionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserVotedImplCopyWith<_$UserVotedImpl> get copyWith =>
      __$$UserVotedImplCopyWithImpl<_$UserVotedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String optionId) userVoted,
    required TResult Function(String newVoterId) voterIdCreated,
  }) {
    return userVoted(optionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String optionId)? userVoted,
    TResult? Function(String newVoterId)? voterIdCreated,
  }) {
    return userVoted?.call(optionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String optionId)? userVoted,
    TResult Function(String newVoterId)? voterIdCreated,
    required TResult orElse(),
  }) {
    if (userVoted != null) {
      return userVoted(optionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserVoted value) userVoted,
    required TResult Function(VoterIdCreated value) voterIdCreated,
  }) {
    return userVoted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserVoted value)? userVoted,
    TResult? Function(VoterIdCreated value)? voterIdCreated,
  }) {
    return userVoted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserVoted value)? userVoted,
    TResult Function(VoterIdCreated value)? voterIdCreated,
    required TResult orElse(),
  }) {
    if (userVoted != null) {
      return userVoted(this);
    }
    return orElse();
  }
}

abstract class UserVoted implements PollEvent {
  const factory UserVoted({required final String optionId}) = _$UserVotedImpl;

  String get optionId;
  @JsonKey(ignore: true)
  _$$UserVotedImplCopyWith<_$UserVotedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VoterIdCreatedImplCopyWith<$Res> {
  factory _$$VoterIdCreatedImplCopyWith(_$VoterIdCreatedImpl value,
          $Res Function(_$VoterIdCreatedImpl) then) =
      __$$VoterIdCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newVoterId});
}

/// @nodoc
class __$$VoterIdCreatedImplCopyWithImpl<$Res>
    extends _$PollEventCopyWithImpl<$Res, _$VoterIdCreatedImpl>
    implements _$$VoterIdCreatedImplCopyWith<$Res> {
  __$$VoterIdCreatedImplCopyWithImpl(
      _$VoterIdCreatedImpl _value, $Res Function(_$VoterIdCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newVoterId = null,
  }) {
    return _then(_$VoterIdCreatedImpl(
      newVoterId: null == newVoterId
          ? _value.newVoterId
          : newVoterId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VoterIdCreatedImpl
    with DiagnosticableTreeMixin
    implements VoterIdCreated {
  const _$VoterIdCreatedImpl({required this.newVoterId});

  @override
  final String newVoterId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PollEvent.voterIdCreated(newVoterId: $newVoterId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PollEvent.voterIdCreated'))
      ..add(DiagnosticsProperty('newVoterId', newVoterId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoterIdCreatedImpl &&
            (identical(other.newVoterId, newVoterId) ||
                other.newVoterId == newVoterId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newVoterId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoterIdCreatedImplCopyWith<_$VoterIdCreatedImpl> get copyWith =>
      __$$VoterIdCreatedImplCopyWithImpl<_$VoterIdCreatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String optionId) userVoted,
    required TResult Function(String newVoterId) voterIdCreated,
  }) {
    return voterIdCreated(newVoterId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String optionId)? userVoted,
    TResult? Function(String newVoterId)? voterIdCreated,
  }) {
    return voterIdCreated?.call(newVoterId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String optionId)? userVoted,
    TResult Function(String newVoterId)? voterIdCreated,
    required TResult orElse(),
  }) {
    if (voterIdCreated != null) {
      return voterIdCreated(newVoterId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserVoted value) userVoted,
    required TResult Function(VoterIdCreated value) voterIdCreated,
  }) {
    return voterIdCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserVoted value)? userVoted,
    TResult? Function(VoterIdCreated value)? voterIdCreated,
  }) {
    return voterIdCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserVoted value)? userVoted,
    TResult Function(VoterIdCreated value)? voterIdCreated,
    required TResult orElse(),
  }) {
    if (voterIdCreated != null) {
      return voterIdCreated(this);
    }
    return orElse();
  }
}

abstract class VoterIdCreated implements PollEvent {
  const factory VoterIdCreated({required final String newVoterId}) =
      _$VoterIdCreatedImpl;

  String get newVoterId;
  @JsonKey(ignore: true)
  _$$VoterIdCreatedImplCopyWith<_$VoterIdCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
