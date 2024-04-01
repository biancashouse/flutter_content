import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';

enum FSAction { undo, redo }

abstract class IModelRepository {
  Future<AppModel?> getAppModel();

  Future<SnippetMapModel?> getVersionedSnippetMap({
    required BranchName branchName,
    required VersionId modelVersion,
  });

  Future<void> switchBranch({required String newBranchName});

  Future<void> save({required AppModel appModel, required SnippetMap snippets});

  Future<void> revert({required FSAction action});

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
