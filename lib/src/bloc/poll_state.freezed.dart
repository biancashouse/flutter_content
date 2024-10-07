// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PollState {
  String get pollName => throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get endDate => throw _privateConstructorUsedError;
  Map<String, int> get optionVoteCounts => throw _privateConstructorUsedError;
  ({String? optionId, int? when})? get userVote =>
      throw _privateConstructorUsedError;
  dynamic get locked => throw _privateConstructorUsedError;

  /// Create a copy of PollState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollStateCopyWith<PollState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollStateCopyWith<$Res> {
  factory $PollStateCopyWith(PollState value, $Res Function(PollState) then) =
      _$PollStateCopyWithImpl<$Res, PollState>;
  @useResult
  $Res call(
      {String pollName,
      int? startDate,
      int? endDate,
      Map<String, int> optionVoteCounts,
      ({String? optionId, int? when})? userVote,
      dynamic locked});
}

/// @nodoc
class _$PollStateCopyWithImpl<$Res, $Val extends PollState>
    implements $PollStateCopyWith<$Res> {
  _$PollStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollName = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? optionVoteCounts = null,
    Object? userVote = freezed,
    Object? locked = freezed,
  }) {
    return _then(_value.copyWith(
      pollName: null == pollName
          ? _value.pollName
          : pollName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      optionVoteCounts: null == optionVoteCounts
          ? _value.optionVoteCounts
          : optionVoteCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      userVote: freezed == userVote
          ? _value.userVote
          : userVote // ignore: cast_nullable_to_non_nullable
              as ({String? optionId, int? when})?,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollStateImplCopyWith<$Res>
    implements $PollStateCopyWith<$Res> {
  factory _$$PollStateImplCopyWith(
          _$PollStateImpl value, $Res Function(_$PollStateImpl) then) =
      __$$PollStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pollName,
      int? startDate,
      int? endDate,
      Map<String, int> optionVoteCounts,
      ({String? optionId, int? when})? userVote,
      dynamic locked});
}

/// @nodoc
class __$$PollStateImplCopyWithImpl<$Res>
    extends _$PollStateCopyWithImpl<$Res, _$PollStateImpl>
    implements _$$PollStateImplCopyWith<$Res> {
  __$$PollStateImplCopyWithImpl(
      _$PollStateImpl _value, $Res Function(_$PollStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollName = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? optionVoteCounts = null,
    Object? userVote = freezed,
    Object? locked = freezed,
  }) {
    return _then(_$PollStateImpl(
      pollName: null == pollName
          ? _value.pollName
          : pollName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      optionVoteCounts: null == optionVoteCounts
          ? _value._optionVoteCounts
          : optionVoteCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      userVote: freezed == userVote
          ? _value.userVote
          : userVote // ignore: cast_nullable_to_non_nullable
              as ({String? optionId, int? when})?,
      locked: freezed == locked ? _value.locked! : locked,
    ));
  }
}

/// @nodoc

class _$PollStateImpl extends _PollState {
  _$PollStateImpl(
      {required this.pollName,
      this.startDate,
      this.endDate,
      required final Map<String, int> optionVoteCounts,
      this.userVote,
      this.locked = false})
      : _optionVoteCounts = optionVoteCounts,
        super._();

  @override
  final String pollName;
  @override
  final int? startDate;
  @override
  final int? endDate;
  final Map<String, int> _optionVoteCounts;
  @override
  Map<String, int> get optionVoteCounts {
    if (_optionVoteCounts is EqualUnmodifiableMapView) return _optionVoteCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_optionVoteCounts);
  }

  @override
  final ({String? optionId, int? when})? userVote;
  @override
  @JsonKey()
  final dynamic locked;

  @override
  String toString() {
    return 'PollState(pollName: $pollName, startDate: $startDate, endDate: $endDate, optionVoteCounts: $optionVoteCounts, userVote: $userVote, locked: $locked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollStateImpl &&
            (identical(other.pollName, pollName) ||
                other.pollName == pollName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._optionVoteCounts, _optionVoteCounts) &&
            (identical(other.userVote, userVote) ||
                other.userVote == userVote) &&
            const DeepCollectionEquality().equals(other.locked, locked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pollName,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_optionVoteCounts),
      userVote,
      const DeepCollectionEquality().hash(locked));

  /// Create a copy of PollState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollStateImplCopyWith<_$PollStateImpl> get copyWith =>
      __$$PollStateImplCopyWithImpl<_$PollStateImpl>(this, _$identity);
}

abstract class _PollState extends PollState {
  factory _PollState(
      {required final String pollName,
      final int? startDate,
      final int? endDate,
      required final Map<String, int> optionVoteCounts,
      final ({String? optionId, int? when})? userVote,
      final dynamic locked}) = _$PollStateImpl;
  _PollState._() : super._();

  @override
  String get pollName;
  @override
  int? get startDate;
  @override
  int? get endDate;
  @override
  Map<String, int> get optionVoteCounts;
  @override
  ({String? optionId, int? when})? get userVote;
  @override
  dynamic get locked;

  /// Create a copy of PollState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollStateImplCopyWith<_$PollStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
