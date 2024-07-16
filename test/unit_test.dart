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

late STreeNode firstTabNode;

MockModelRepository setupMockRepo() {
  MockModelRepository mockRepository = MockModelRepository();
  // AppInfo
  when(mockRepository.getAppInfo()).thenAnswer((_) async {
    AppInfoModel appInfo = AppInfoModel(
      editingVersionIds: {'scaffoldWithTabs': TEST_VERSION_ID},
      publishedVersionIds: {'scaffoldWithTabs': TEST_VERSION_ID},
      versionIds: {
        'scaffoldWithTabs': [TEST_VERSION_ID]
      },
    );
    return appInfo;
  });
  when(
    mockRepository.possiblyLoadSnippetIntoCache(
        snippetName: 'scaffoldWithTabs', versionId: TEST_VERSION_ID),
  ).thenAnswer((_) async {
    SnippetRootNode rootNode = SnippetRootNode(
      name: 'scaffoldWithTabs',
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
                  centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
            ],
          ),
        ),
      ),
    )..validateTree();
    fco.snippetInfoCache['scaffoldWithTabs'] = {'TEST_VERSION_ID': rootNode};
  });
  return mockRepository;
}

CAPIBloC getMockCAPIBloC(MockModelRepository repo) => CAPIBloC(modelRepo: repo);

void main() {
  late MockModelRepository mockRepository;
  // AppInfo
  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';

  setUp(() {
    mockRepository = setupMockRepo();

    fco.init(
      modelName: 'test-app',
    );
  });

  test('read the appInfo from the repo', () async {
    final appInfo = await mockRepository.getAppInfo();
    expect(appInfo, isNotNull);

    await mockRepository.possiblyLoadSnippetIntoCache(
      snippetName: 'scaffoldWithTabs',
      versionId: TEST_VERSION_ID,
    );

    var snippet = fco.snippetInfoCache['scaffoldWithTabs']?[TEST_VERSION_ID];

    expect(snippet, isNotNull);
  });

  test('STreeNode.findNearestAncestor<ScaffoldNode>', () async {
    var foundNode = firstTabNode.findNearestAncestor<ScaffoldNode>();

    expect(foundNode != null, isTrue);
    expect(foundNode, isA<ScaffoldNode>());
    expect(firstTabNode.isAScaffoldTabWidget(), isTrue);
    expect(firstTabNode.canBeDeleted(), isTrue);
  });
}
