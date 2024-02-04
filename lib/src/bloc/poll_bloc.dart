import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'poll_event.dart';
import 'poll_state.dart';

class PollBloC extends Bloc<PollEvent, PollState> {
  final IModelRepository modelRepo;
  PollBloC({
    required this.modelRepo,
    required VoterId? voterId,
    required String pollName,
    int? starts, int? ends,
    required OptionCountsAndVoterRecord result,
  }) : super(PollState(
          voterId: voterId,
          pollName: pollName,
          startDate: starts, endDate: ends,
          optionVoteCounts: result.optionVoteCountMap ?? {},
          idUserVotedFor: result.userVotedForOptionId,
        )) {
    on<UserVoted>((event, emit) => _userVoted(event, emit));
    on<VoterIdCreated>((event, emit) => _voterIdCreated(event, emit));
  }

   _userVoted(UserVoted event, emit) async {
    Map<PollOptionId, int> newMap = Map<PollOptionId, int>.of(state.optionVoteCounts);
    newMap[event.optionId] = (newMap[event.optionId] ?? 0) + 1;

    // save to firestore
    modelRepo.saveVote(pollName: state.pollName, voterId: state.voterId??'anon', optionId: event.optionId, newOptionVoteCountMap: newMap);

    emit(state.copyWith(
      optionVoteCounts: newMap,
      idUserVotedFor: event.optionId,
    ));
    // }
  }

  void _voterIdCreated(VoterIdCreated event, emit) {
    if (event.newVoterId.isNotEmpty) {
      HydratedBloc.storage.write("voter-id", event.newVoterId);
    }
    emit(state.copyWith(
      voterId: event.newVoterId,
    ));
    // }
  }
}
