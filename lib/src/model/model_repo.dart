import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';

// enum FSAction { undo, redo }

abstract class IModelRepository {
  Future<AppInfoModel?> getAppInfo();

  Future<SnippetMapModel?> getVersionedSnippetMap({required VersionId versionId});

  // Future<void> switchBranch({required BranchName newBranchName});

  Future<void> publish({required VersionId versionId});

  Future<void> save({required AppInfoModel appInfo, required SnippetMap snippets});

  Future<void> revert({required VersionId versionId});

  Future<void> saveVote({
    required String pollName,
    required VoterId voterId,
    required PollOptionId optionId,
    required Map<PollOptionId, int> newOptionVoteCountMap,
  });

  Future<OptionCountsAndVoterRecord> getPollResultsForUser({
    required VoterId voterId,
    required String pollName,
  });

  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({
    required String modelName,
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  });

  // Future<void> createAndPopulateRootFSStorageNode();

  Future<FSFolderNode> createAndPopulateFolderNode(
      {required Reference ref, FSFolderNode? parentNode});
}
