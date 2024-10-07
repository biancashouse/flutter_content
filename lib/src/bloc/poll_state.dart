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

}
