// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:collection/collection.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/poll_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_state.freezed.dart';

@freezed
class PollState with _$PollState {
  const PollState._();

  // the pollName key links options to their parent poll using this map
  static Map<String, PollBloC> pollBlocs = {};

  factory PollState({
    required VoterId? voterId,
    required String pollName,
    int? startDate,
    int? endDate,
    @Default({}) Map<PollOptionId, int> optionVoteCounts,
    PollOptionId? idUserVotedFor,
  }) = _PollState;

  int totalPollVoteCount() => optionVoteCounts.values.sum;

  int optionVotes(PollOptionId optionId) => optionVoteCounts[optionId] ?? 0;

  bool userAlreadyVoted() => idUserVotedFor != null;

  bool tooEarly() => startDate != null && DateTime.now().millisecondsSinceEpoch < startDate!;
  bool pollHasEnded() => endDate != null && DateTime.now().millisecondsSinceEpoch > endDate!;

}
