@GenerateNiceMocks([
  MockSpec<IModelRepository>(as: #MockModelRepository),
])
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repo_test_suite.dart';
import 'unit_test.mocks.dart';

void main() {
  late MockModelRepository mockRepository;
  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';

  late STreeNode firstTabNode;

  setUp(() {
    mockRepository = MockModelRepository();
    when(mockRepository.getAppModel()).thenAnswer((_) async {
      BranchModel branch = BranchModel(
        name: 'staging',
        latestVersionId: TEST_VERSION_ID,
        undos: [INITIAL_VERSION],
      );
      AppModel appInfo = AppModel(branches: {'staging': branch});
      return appInfo;
    });
    when(mockRepository.getVersionedSnippetMap(
            branchName: 'staging', modelVersion: TEST_VERSION_ID))
        .thenAnswer((_) async {
      final scaffoldWithTabs = SnippetRootNode(
        name: snippetName,
        child: ScaffoldNode(
          appBar: AppBarNode(
            bgColorValue: Colors.black.value,
            title: GenericSingleChildNode(
                propertyName: 'title', child: TextNode(text: 'my title')),
            bottom: GenericSingleChildNode(
              propertyName: 'bottom',
              child: TabBarNode(
                children: [
                  firstTabNode = TextNode(text: 'tab 1'),
                  TextNode(text: 'Tab 2'),
                ],
              ),
            ),
          ),
          body: GenericSingleChildNode(
            propertyName: 'body',
            child: TabBarViewNode(
              children: [
                PlaceholderNode(
                    centredLabel: 'page 1', colorValue: Colors.yellow.value),
                PlaceholderNode(
                    centredLabel: 'page 2',
                    colorValue: Colors.blueAccent.value),
              ],
            ),
          ),
        ),
      )..validateTree();
      SnippetMapModel snippetsModel =
          SnippetMapModel({snippetName: scaffoldWithTabs});
      return snippetsModel;
    });
  });

  test('read the appInfo from the repo', () async {
    final model = await mockRepository.getAppModel();
    expect(model, isNotNull);
    expect(model!.branches, isNotEmpty);
    expect(model.branches['staging'], isNotNull);
    expect(model.branches['staging']!.latestVersionId, isNotNull);

    var snippetsModel = await mockRepository.getVersionedSnippetMap(
      branchName: model.currentBranchName,
      modelVersion: model.branches['staging']!.latestVersionId,
    );

    expect(snippetsModel, isNotNull);
    expect(snippetsModel!.snippets, isNotEmpty);
    expect(snippetsModel.snippets[TEST_VERSION_ID], isNotNull);
    expect(snippetsModel.snippets[TEST_VERSION_ID]!.name, snippetName);
  });

  test('STreeNode.findNearestAncestor<ScaffoldNode>', () async {
    var foundNode = firstTabNode.findNearestAncestor<ScaffoldNode>();

    expect(foundNode != null, isTrue);
    expect(foundNode, isA<ScaffoldNode>());
    expect(firstTabNode.isAScaffoldTabWidget(), isTrue);
    expect(firstTabNode.canBeDeleted(), isTrue);
  });
}
