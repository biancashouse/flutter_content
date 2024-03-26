import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';

const TEST_VERSION_ID = -1;

void main() {
  const appName = 'flutter-content-test-app';
  final scaffoldWithTabs = SnippetTemplate.scaffold_with_tabs.name;

  late MockModelRepository mockRepo;
  late CAPIModel? model;
  late SnippetBloC snippetBloc;
  late STreeNode titleTextNode;
  late SnippetTreeController scaffoldWithTabsTreeC;
  late SnippetTreeController emptyTreeC;
  late SnippetTreeUR ur;

  final SnippetRootNode emptySnippet = SnippetPanel.createSnippetFromTemplate(
      SnippetTemplate.empty_snippet, 'empty_snippet');
  final SnippetRootNode scaffoldWithTabsSnippet =
      SnippetPanel.createSnippetFromTemplate(
          SnippetTemplate.scaffold_with_tabs, 'scaffold_with_tabs');

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
    mockRepo = MockModelRepository();
  });

  // setup() runs before each test in the suite
  setUp(() async {
    // print('Setting up resources for a test...\n\n');
    when(mockRepo.getCAPIModel(
      appName: appName,
      branchName: 'testing',
      modelVersion: TEST_VERSION_ID,
    )).thenAnswer(
      (_) async => CAPIModel(
        appName: appName,
        snippetEncodedJsons: {
          scaffoldWithTabs: scaffoldWithTabsSnippet.toJson(),
        },
      ),
    );
    model = await mockRepo.getCAPIModel(
      appName: appName,
      branchName: 'testing',
      modelVersion: TEST_VERSION_ID,
    );
    emptyTreeC = SnippetTreeController(
        roots: [emptySnippet],
        childrenProvider: Node.snippetTreeChildrenProvider);
    scaffoldWithTabsTreeC = SnippetTreeController(
        roots: [scaffoldWithTabsSnippet],
        childrenProvider: Node.snippetTreeChildrenProvider);
    titleTextNode = scaffoldWithTabsTreeC.findNodeTypeInTree(
            MaterialSPAState.parseSnippetJsons(model!).values.first, TextNode)
        as TextNode;
    ur = SnippetTreeUR();
  });

  GlobalKey selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  GlobalKey selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');

  // Test cases
  //...
  test('read the model from the repo, and find 1st TextNode (title)', () async {
    model = await mockRepo.getCAPIModel(
      appName: appName,
      branchName: 'testing',
      modelVersion: TEST_VERSION_ID,
    );
    expect(model?.appName, appName);
    Map<String, SnippetRootNode> snippetsMap =
        MaterialSPAState.parseSnippetJsons(model!);
    SnippetRootNode rootNode = snippetsMap.values.first;
    expect(rootNode.name, scaffoldWithTabs);
    SnippetTreeController treeC = SnippetTreeController(
        roots: [scaffoldWithTabsSnippet],
        childrenProvider: Node.snippetTreeChildrenProvider);
    STreeNode? searchResult = treeC.findNodeTypeInTree(rootNode, TextNode);
    expect(searchResult, isNotNull);
    expect(searchResult is TextNode, isTrue);
    expect((searchResult as TextNode?)?.text, 'my title');
    // printPrettyJson(rootNode.toMap(), indent: 2);
  });

  test('read the model from the repo, and set all parent pointers in tree',
      () async {
    model = await mockRepo.getCAPIModel(
      appName: appName,
      branchName: 'testing',
      modelVersion: TEST_VERSION_ID,
    );
    expect(model?.appName, appName);
    Map<String, SnippetRootNode> snippetsMap =
        MaterialSPAState.parseSnippetJsons(model!);
    SnippetRootNode rootNode = snippetsMap.values.first;
    expect(rootNode.name, scaffoldWithTabs);
    expect(rootNode.child, isA<ScaffoldNode>());
    expect(rootNode.child!.parent, rootNode);
    expect(rootNode.anyMissingParents(), false);

    // printPrettyJson(rootNode.toMap(), indent: 2);
  });

  test('compare states', () async {
    expect(
      SnippetBloC(rootNode: emptySnippet, treeC: emptyTreeC, treeUR: ur)
          .state
          .copyWith(
            selectedNode: emptySnippet,
            selectedWidgetGK: selectedWidgetGK,
            selectedTreeNodeGK: selectedTreeNodeGK,
          ),
      SnippetBloC(rootNode: emptySnippet, treeC: emptyTreeC, treeUR: ur)
          .state
          .copyWith(
            selectedNode: emptySnippet,
            selectedWidgetGK: selectedWidgetGK,
            selectedTreeNodeGK: selectedTreeNodeGK,
          ),
    );
  });

  blocTest<SnippetBloC, SnippetState>(
      'scaffoldWithTabs: select the Title TextNode',
      build: () => snippetBloc = SnippetBloC(
          rootNode: scaffoldWithTabsSnippet,
          treeC: scaffoldWithTabsTreeC,
          treeUR: ur),
      act: (bloc) => bloc.add(SnippetEvent.selectNode(
            node: titleTextNode,
            selectedWidgetGK: selectedWidgetGK,
            selectedTreeNodeGK: selectedTreeNodeGK,
          )),
      expect: () => <SnippetState>[
            snippetBloc.state.copyWith(
              selectedNode: titleTextNode,
              selectedWidgetGK: selectedWidgetGK,
              selectedTreeNodeGK: selectedTreeNodeGK,
            ),
          ]);

  // tearDown() runs after each test in the suite
  tearDown(() {
    // print('\nTearing down resources after a test...');
  });

  // tearDownAll() runs once after all tests in the suite
  tearDownAll(() {
    // print('\nTearing down common resources...');
  });
}
