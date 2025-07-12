// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:collection/collection.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_state.freezed.dart';

@freezed
class PollState with _$PollState {
  const PollState._();

  // the pollName key links options to their parent poll using this map
  // static Map<String, PollBloC> pollBlocs = {};

  factory PollState({
    required String pollName,
    int? startDate,
    int? endDate,
    required OptionVoteCountMap optionVoteCounts,
    UserVoterRecord? userVote,
    @Default(false) locked,
  }) = _PollState;

  int totalPollVoteCount() => optionVoteCounts.values.sum;

  int optionVoteCount(PollOptionId optionId) => optionVoteCounts[optionId] ?? 0;

  bool userAlreadyVoted() => userVote != null && userVote!.optionId != null;

  bool tooEarly() => startDate != null && DateTime.now().millisecondsSinceEpoch < startDate!;
  bool pollHasEnded() => endDate != null && DateTime.now().millisecondsSinceEpoch > endDate!;

  @override
  // TODO: implement endDate
  int? get endDate => throw UnimplementedError();

  @override
  // TODO: implement locked
  get locked => throw UnimplementedError();

  @override
  // TODO: implement optionVoteCounts
  OptionVoteCountMap get optionVoteCounts => throw UnimplementedError();

  @override
  // TODO: implement pollName
  String get pollName => throw UnimplementedError();

  @override
  // TODO: implement startDate
  int? get startDate => throw UnimplementedError();

  @override
  // TODO: implement userVote
  UserVoterRecord? get userVote => throw UnimplementedError();

}
