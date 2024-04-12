import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';

// enum FSAction { undo, redo }

abstract class IModelRepository {
  Future<void> getSnippetFromCacheOrFB(
      {required SnippetName snippetName, required VersionId versionId});

  Future<AppInfoModel?> getAppInfo();

  Future<void> saveAppInfo();

  Future<void> publishSnippet(
      {required SnippetName snippetName, required VersionId versionId});

  Future<VersionId?> saveSnippet({
    required SnippetName snippetName,
    required VersionId newVersionId,
  });

  Future<void> revertSnippet(
      {required SnippetName snippetName, required VersionId toVersionId});

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
