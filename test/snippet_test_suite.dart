import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'snippet_bloc_test.mocks.dart';

void main() {
  const appName = 'flutter-content-test-app';
  final SCAFFOLD_WITH_TABS = SnippetTemplate.scaffold_with_tabs.name;

  late MockModelRepository mockRepo;
  late CAPIModel? model;
  late SnippetBloC snippetBloc;
  late TextNode textNode;
  late SnippetTreeController treeC;

  final SnippetRootNode emptySnippet = SnippetPanel.getTemplate(SnippetTemplate.empty_snippet);
  final SnippetRootNode scaffoldWithTabsSnippet = SnippetPanel.getTemplate(SnippetTemplate.scaffold_with_tabs);

  SnippetTreeController newTreeC(SnippetRootNode rootNode) => SnippetTreeController(
    roots: [rootNode],
    childrenProvider: Node.snippetTreeChildrenProvider,
  );

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    print('Setting up common resources...');
    mockRepo = MockModelRepository();
  });

  createScaffoldWithTabsModelAndFindTitle() {
    Map<String, SnippetRootNode> snippetsMap = MaterialSPAState.parseSnippetJsons(model!);
    treeC = newTreeC(scaffoldWithTabsSnippet);
    textNode = treeC.findNodeTypeInTree(MaterialSPAState.parseSnippetJsons(model!).values.first, TextNode) as TextNode;
  }

  // setup() runs before each test in the suite
  setUp(() async {
    print('Setting up resources for a test...\n\n');
    when(mockRepo.getCAPIModel(appName: appName)).thenAnswer(
      (_) async => CAPIModel(
        appName: appName,
        snippetEncodedJsons: {
          SCAFFOLD_WITH_TABS: scaffoldWithTabsSnippet.toJson(),
        },
      ),
    );
    model = await mockRepo.getCAPIModel(appName: appName);
    createScaffoldWithTabsModelAndFindTitle();
   });

  GlobalKey selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  GlobalKey selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');

  // Test cases
  test('read the model from the repo, and find 1st TextNode', () async {
    model = await mockRepo.getCAPIModel(appName: appName);
    expect(model?.appName, appName);
    Map<String, SnippetRootNode> snippetsMap = MaterialSPAState.parseSnippetJsons(model!);
    SnippetRootNode rootNode = snippetsMap.values.first;
    expect(rootNode.name, SCAFFOLD_WITH_TABS);
    SnippetTreeController treeC = newTreeC(rootNode);
    STreeNode? searchResult = treeC.findNodeTypeInTree(rootNode, TextNode);
    expect(searchResult, isNotNull);
    expect(searchResult is TextNode, isTrue);
    expect((searchResult as TextNode?)?.text, 'my title');
    // printPrettyJson(rootNode.toMap(), indent: 2);
  });

  blocTest<SnippetBloC, SnippetState>(
    'select a node',
    build: () => snippetBloc = SnippetBloC(rootNode: scaffoldWithTabsSnippet, treeC: newTreeC(scaffoldWithTabsSnippet), treeUR: SnippetTreeUR()),
    act: (bloc) => bloc.add(SnippetEvent.selectNode(
      node: textNode,
      showProperties: false,
      selectedWidgetGK: selectedWidgetGK,
      selectedTreeNodeGK: selectedTreeNodeGK,
    )),
    //skip: 1,
    expect: () => <SnippetState>[
      snippetBloc.state.copyWith(
        selectedNode: textNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      ),
    ],
  );

  // tearDown() runs after each test in the suite
  tearDown(() {
    print('\nTearing down resources after a test...');
  });

  // tearDownAll() runs once after all tests in the suite
  tearDownAll(() {
    print('\nTearing down common resources...');
  });

  // late Map<String, dynamic> encodedModelJson;
  // late SnippetBloC snippetBloc;
  // late SnippetState snippetState;
  // // sample data -----------
  // late STreeNode firstTabViewNode;
  // late STreeNode? columnNode;
  // STreeNode? paddingNode = PaddingNode();
  // STreeNode? firstTextNode = TextNode();
  // STreeNode? secondTextNode = TextNode();
  // STreeNode? firstSizedBoxNode = SizedBoxNode();
  // STreeNode? secondSizedBoxNode = SizedBoxNode();
  // sample data -----------
}
