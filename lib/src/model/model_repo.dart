import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';

abstract class IModelRepository {
  Future<AppModel?> getAppInfo({required String appName});
  Future<CAPIModel?> getCAPIModel({
    required String appName,
    required BranchName branchName,
    required VersionId modelVersion,
  });

  Future<void> createOrUpdateAppInfoAndCAPIModel(
      {required AppModel appInfo, required CAPIModel model});

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

  Future<FSFolderNode> createAndPopulateFolderNode({
    required Reference ref, FSFolderNode? parentNode});
}
