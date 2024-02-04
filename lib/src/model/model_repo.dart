import 'package:flutter_content/flutter_content.dart';

abstract class IModelRepository {
  Future<(CAPIModel?, String?)> getCAPIModel({required String appName});

  Future<void> createOrUpdateModel({required CAPIModel model});

  Future<void> saveVote({
    required String pollName,
    required VoterId voterId,
    required PollOptionId optionId,
    required Map<PollOptionId, int> newOptionVoteCountMap,
  });

  Future<OptionCountsAndVoterRecord> getPollResultsForUser({
    required VoterId voterId,
    required String appName,
    required String pollName,
  });

  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({
    required String appName,
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  });
}
