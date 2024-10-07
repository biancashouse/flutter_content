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

  Future<void> possiblyLoadSnippetIntoCache(
      {required SnippetName snippetName, required VersionId versionId});

  Future<AppInfoModel?> getAppInfo();

  Future<void> saveAppInfo();

  Future<void> updateSnippetProps({
    required SnippetName snippetName,
    VersionId? editingVersionId,
    VersionId? publishingVersionId,
    bool? autoPublish,
  });

  Future<bool> saveLatestSnippetVersion({
    required SnippetName snippetName,
  });

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
  }
  );

  Future<Map<PollOptionId, List<EmailAddress>>> getVotersByOption({
    required String pollName,
    required List<PollOptionId> pollOptionIds,
  });

  // Future<void> createAndPopulateRootFSStorageNode();

  Future<FSFolderNode> createAndPopulateFolderNode(
      {required Reference ref, FSFolderNode? parentNode});

  Future<bool> tokenConfirmed(String token);

}
