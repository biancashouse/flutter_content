import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';

// enum FSAction { undo, redo }

abstract class IModelRepository {
  Future<SnippetInfoModel?> getSnippetInfoFromCacheOrFB(
      {required SnippetName snippetName});

  // Future<void> migrateCollection();
  // Future<void> copyUsersBetweenProjects();
  // Future<void> copyCollectionBetweenProjects();
  // Future<void> copyFlowchartDocBetweenUsersInSameProject(String fromUserId, String toUserId);
  // Future<void> copyUsersProjects();

  Future<SnippetRootNode?> loadVersionFromFBIntoCache(
      {required SnippetInfoModel snippetInfo, required VersionId versionId});

  Future<String?> getGcrServerUrl();

  Future<AppInfoModel?> getAppInfo();

  Future<void> saveAppInfo();

  Future<void> updateSnippetInfo({
    required SnippetName snippetName,
    VersionId? editingVersionId,
    VersionId? publishingVersionId,
    bool? autoPublish,
  });

  Future<bool> saveSnippetVersion({
    required SnippetName snippetName,
    required VersionId newVersionId,
    required SnippetRootNode newVersion,
  });

  Future<void> deleteSnippet(final String snippetName);

  Future<void> deleteSnippetVersions(
    final String snippetName,
    final List<VersionId> tbd,
  );

  Future<void> purgePreviousSnippetVersions(
      final String snippetName,
      );

  Future<void> saveVote({
    required String pollName,
    required VoterId voterId,
    required PollOptionId optionId,
    required Map<PollOptionId, int> newOptionVoteCountMap,
  });

  Future<OptionVoteCountMap> getPollOptionVoteCounts({
    required String pollName,
  });

  Future<UserVoterRecord?> getUsersVote({
    required String pollName,
    required VoterId voterId,
  });

  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  });

  // Future<void> createAndPopulateRootFSStorageNode();

  Future<FSFolderNode> createAndPopulateFolderTree(
      {required Reference ref, FSFolderNode? parentNode});

  Future<bool> tokenConfirmed(String token);
}
