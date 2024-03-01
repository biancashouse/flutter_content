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
  String? get voterId => throw _privateConstructorUsedError;
  String get pollName => throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get endDate => throw _privateConstructorUsedError;
  Map<String, int> get optionVoteCounts => throw _privateConstructorUsedError;
  String? get idUserVotedFor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PollStateCopyWith<PollState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollStateCopyWith<$Res> {
  factory $PollStateCopyWith(PollState value, $Res Function(PollState) then) =
      _$PollStateCopyWithImpl<$Res, PollState>;
  @useResult
  $Res call(
      {String? voterId,
      String pollName,
      int? startDate,
      int? endDate,
      Map<String, int> optionVoteCounts,
      String? idUserVotedFor});
}

/// @nodoc
class _$PollStateCopyWithImpl<$Res, $Val extends PollState>
    implements $PollStateCopyWith<$Res> {
  _$PollStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voterId = freezed,
    Object? pollName = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? optionVoteCounts = null,
    Object? idUserVotedFor = freezed,
  }) {
    return _then(_value.copyWith(
      voterId: freezed == voterId
          ? _value.voterId
          : voterId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      idUserVotedFor: freezed == idUserVotedFor
          ? _value.idUserVotedFor
          : idUserVotedFor // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String? voterId,
      String pollName,
      int? startDate,
      int? endDate,
      Map<String, int> optionVoteCounts,
      String? idUserVotedFor});
}

/// @nodoc
class __$$PollStateImplCopyWithImpl<$Res>
    extends _$PollStateCopyWithImpl<$Res, _$PollStateImpl>
    implements _$$PollStateImplCopyWith<$Res> {
  __$$PollStateImplCopyWithImpl(
      _$PollStateImpl _value, $Res Function(_$PollStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voterId = freezed,
    Object? pollName = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? optionVoteCounts = null,
    Object? idUserVotedFor = freezed,
  }) {
    return _then(_$PollStateImpl(
      voterId: freezed == voterId
          ? _value.voterId
          : voterId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      idUserVotedFor: freezed == idUserVotedFor
          ? _value.idUserVotedFor
          : idUserVotedFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PollStateImpl extends _PollState {
  _$PollStateImpl(
      {required this.voterId,
      required this.pollName,
      this.startDate,
      this.endDate,
      final Map<String, int> optionVoteCounts = const {},
      this.idUserVotedFor})
      : _optionVoteCounts = optionVoteCounts,
        super._();

  @override
  final String? voterId;
  @override
  final String pollName;
  @override
  final int? startDate;
  @override
  final int? endDate;
  final Map<String, int> _optionVoteCounts;
  @override
  @JsonKey()
  Map<String, int> get optionVoteCounts {
    if (_optionVoteCounts is EqualUnmodifiableMapView) return _optionVoteCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_optionVoteCounts);
  }

  @override
  final String? idUserVotedFor;

  @override
  String toString() {
    return 'PollState(voterId: $voterId, pollName: $pollName, startDate: $startDate, endDate: $endDate, optionVoteCounts: $optionVoteCounts, idUserVotedFor: $idUserVotedFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollStateImpl &&
            (identical(other.voterId, voterId) || other.voterId == voterId) &&
            (identical(other.pollName, pollName) ||
                other.pollName == pollName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._optionVoteCounts, _optionVoteCounts) &&
            (identical(other.idUserVotedFor, idUserVotedFor) ||
                other.idUserVotedFor == idUserVotedFor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      voterId,
      pollName,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_optionVoteCounts),
      idUserVotedFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollStateImplCopyWith<_$PollStateImpl> get copyWith =>
      __$$PollStateImplCopyWithImpl<_$PollStateImpl>(this, _$identity);
}

abstract class _PollState extends PollState {
  factory _PollState(
      {required final String? voterId,
      required final String pollName,
      final int? startDate,
      final int? endDate,
      final Map<String, int> optionVoteCounts,
      final String? idUserVotedFor}) = _$PollStateImpl;
  _PollState._() : super._();

  @override
  String? get voterId;
  @override
  String get pollName;
  @override
  int? get startDate;
  @override
  int? get endDate;
  @override
  Map<String, int> get optionVoteCounts;
  @override
  String? get idUserVotedFor;
  @override
  @JsonKey(ignore: true)
  _$$PollStateImplCopyWith<_$PollStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
