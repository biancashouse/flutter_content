import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_event.freezed.dart';

@freezed
class PollEvent with _$PollEvent {

  const factory PollEvent.userVoted({
    required PollOptionId optionId,
  }) = UserVoted;

  const factory PollEvent.voterIdCreated({
    required VoterId newVoterId,
  }) = VoterIdCreated;

}
