import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_test/flutter_test.dart';

import 'unit_test.mocks.dart';

const VersionId TEST_VERSION_ID = '1700000000000';

void main() {
  // const appName = 'flutter-content-example';

  late MockModelRepository mockRepo;
  late CAPIBloC capiBloc;
  late STreeNode titleTextNode;
  late SnippetTreeController scaffoldWithTabsTreeC;
  late SnippetTreeController emptyTreeC;
  // late SnippetTreeUR ur;

  final SnippetRootNode emptySnippet =
      SnippetTemplateEnum.empty.templateSnippet();

  final SnippetRootNode scaffoldWithTabsSnippet =
      SnippetTemplateEnum.scaffold_with_tabs.templateSnippet();

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
    mockRepo = MockModelRepository();
  });

  // setup() runs before each test in the suite
  setUp(() async {
    // print('Setting up resources for a test...\n\n');
    mockRepo = MockModelRepository();

    emptyTreeC = SnippetTreeController(
        roots: [emptySnippet],
        childrenProvider: Node.snippetTreeChildrenProvider,
        parentProvider:Node.snippetTreeParentProvider);

    scaffoldWithTabsTreeC = SnippetTreeController(
        roots: [scaffoldWithTabsSnippet],
        childrenProvider: Node.snippetTreeChildrenProvider,
        parentProvider:Node.snippetTreeParentProvider);

  });

  GlobalKey selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  GlobalKey selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');


  // blocTest<CAPIBloC, CAPIState>(
  //     'scaffoldWithTabs: select the Title TextNode',
  //     build: () => CAPIBloC = CAPIBloC(
  //         rootNode: scaffoldWithTabsSnippet,
  //         treeC: scaffoldWithTabsTreeC,
  //         // treeUR: ur
  //     ),
  //     act: (bloc) => bloc.add(CAPIEvent.selectNode(
  //           node: titleTextNode,
  //           selectedWidgetGK: selectedWidgetGK,
  //           selectedTreeNodeGK: selectedTreeNodeGK,
  //         )),
  //     expect: () => <CAPIState>[
  //           CAPIBloC.state.copyWith(
  //             selectedNode: titleTextNode,
  //             selectedWidgetGK: selectedWidgetGK,
  //             selectedTreeNodeGK: selectedTreeNodeGK,
  //           ),
  //         ]);

  // tearDown() runs after each test in the suite
  tearDown(() {
    // print('\nTearing down resources after a test...');
  });

  // tearDownAll() runs once after all tests in the suite
  tearDownAll(() {
    // print('\nTearing down common resources...');
  });
}
