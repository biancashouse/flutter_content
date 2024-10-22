import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/model_repo.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'poll_event.dart';
import 'poll_state.dart';

class PollBloC extends Bloc<PollEvent, PollState> {
  final IModelRepository modelRepo;

  PollBloC({
    required this.modelRepo,
    required VoterId voterId,
    required String pollName,
    int? starts,
    int? ends,
    required OptionVoteCountMap optionCountsMap,
    UserVoterRecord? userVote,
  }) : super(PollState(
          pollName: pollName,
          startDate: starts,
          endDate: ends,
          optionVoteCounts: optionCountsMap,
          userVote: userVote,
        )) {
    on<UserVoted>((event, emit) => _userVoted(event, emit));
    // on<VoterIdCreated>((event, emit) => _voterIdCreated(event, emit));
  }

  _userVoted(UserVoted event, emit) async {
    event.poll.locked = true;
    Map<PollOptionId, int> newMap = Map<PollOptionId, int>.of(state.optionVoteCounts);
    newMap[event.optionId] = state.optionVoteCount(event.optionId) + 1;

    final voterId = fco.hiveBox.get('vea') ?? 'anon';
    // save to firestore
    modelRepo.saveVote(
      pollName: state.pollName,
      voterId: voterId,
      optionId: event.optionId,
      newOptionVoteCountMap: newMap,
    );

    UserVoterRecord voteRecord = (optionId: event.optionId, when: DateTime.now().millisecondsSinceEpoch);

    emit(state.copyWith(
      optionVoteCounts: newMap,
      userVote: voteRecord,
      locked: true,
    ));
    // }
  }

  // void _voterIdCreated(VoterIdCreated event, emit) {
  //   if (event.newVoterId.isNotEmpty) {
  //     fco.hiveBox.put("voter-id", event.newVoterId);
  //   }
  //   emit(state.copyWith(
  //     voterId: event.newVoterId,
  //   ));
  //   // }
  // }
}
