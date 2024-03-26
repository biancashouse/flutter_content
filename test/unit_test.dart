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
    when(mockRepository.getAppInfo(appName: appName)).thenAnswer((_) async {
      return AppModel();
    });
    when(mockRepository.getCAPIModel(
      appName: appName,
      branchName: 'testing',
      modelVersion: TEST_VERSION_ID,
    )).thenAnswer((_) async {
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
      final snippetJson = scaffoldWithTabs.toJson();
      return CAPIModel(
          appName: appName, snippetEncodedJsons: {snippetName: snippetJson});
    });
    SnippetPanel(panelName: "test-panel", snippetName: snippetName);
  });

  test('read the model from the repo', () async {
    final model = await mockRepository.getCAPIModel(
      appName: appName,
      branchName: 'testing',
      modelVersion: TEST_VERSION_ID,
    );

    expect(model!.appName, appName);

    Map<String, SnippetRootNode> snippetMap =
        MaterialSPAState.parseSnippetJsons(model);

    expect(snippetMap.values.first.name, snippetName);

    // expect(snippetPanel != null, isTrue);
  });

  test('STreeNode.findNearestAncestor<ScaffoldNode>', () async {
    var foundNode = firstTabNode.findNearestAncestor<ScaffoldNode>();

    expect(foundNode != null, isTrue);
    expect(foundNode, isA<ScaffoldNode>());
    expect(firstTabNode.isAScaffoldTabWidget(), isTrue);
    expect(firstTabNode.canBeDeleted(), isTrue);
  });
}
