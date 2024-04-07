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

MockModelRepository setupMockRepo() {
  MockModelRepository mockRepository = MockModelRepository();
  // AppInfo
  when(mockRepository.getAppInfo()).thenAnswer((_) async {
    AppInfoModel appInfo = AppInfoModel(
      publishedVersionId: TEST_VERSION_ID,
      versionIds: [TEST_VERSION_ID],
    );
    return appInfo;
  });
  return mockRepository;
}

CAPIBloC getMockCAPIBloC(MockModelRepository repo) => CAPIBloC(modelRepo: repo);

void main() {
  MockModelRepository mockRepository = MockModelRepository();
  // AppInfo
  when(mockRepository.getAppInfo()).thenAnswer((_) async {
    AppInfoModel appInfo = AppInfoModel(
      publishedVersionId: TEST_VERSION_ID,
      versionIds: [TEST_VERSION_ID],
    );
    return appInfo;
  });  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';

  late STreeNode firstTabNode;

  setUp(() {
    mockRepository = setupMockRepo();
    // snippets
    when(mockRepository.getVersionedSnippetMap(versionId: TEST_VERSION_ID))
        .thenAnswer((_) async {
      SnippetMapModel snippetMap = SnippetMapModel({
        'scaffoldWithTabs': SnippetRootNode(
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
        )..validateTree(),
      });
      return snippetMap;
    });
  });

  test('read the appInfo from the repo', () async {
    final model = await mockRepository.getAppInfo();
    expect(model, isNotNull);

    var snippetsModel = await mockRepository.getVersionedSnippetMap(
      versionId: TEST_VERSION_ID,
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
