import 'package:flutter/foundation.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_event.freezed.dart';

@freezed
class PollEvent with _$PollEvent {

  const factory PollEvent.userVoted({
    required VoterId voterId,
    required PollNode poll,
    required PollOptionId optionId,
  }) = UserVoted;

  // const factory PollEvent.voterIdCreated({
  //   required VoterId newVoterId,
  // }) = VoterIdCreated;

}
