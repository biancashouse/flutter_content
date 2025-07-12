import 'package:flutter/foundation.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_event.freezed.dart';

@freezed
class PollEvent with _$PollEvent {
  const PollEvent._();

  const factory PollEvent.userVoted({
    required VoterId voterId,
    required PollNode poll,
    required PollOptionId optionId,
  }) = UserVoted;

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  // TODO: implement optionId
  PollOptionId get optionId => throw UnimplementedError();

  @override
  // TODO: implement poll
  PollNode get poll => throw UnimplementedError();

  @override
  DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
    // TODO: implement toDiagnosticsNode
    throw UnimplementedError();
  }

  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug, int wrapWidth = 65}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }

  @override
  String toStringShort() {
    // TODO: implement toStringShort
    throw UnimplementedError();
  }

  @override
  // TODO: implement voterId
  VoterId get voterId => throw UnimplementedError();

  // const factory PollEvent.voterIdCreated({
  //   required VoterId newVoterId,
  // }) = VoterIdCreated;

}
