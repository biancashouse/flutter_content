// ignore_for_file: non_constant_identifier_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:flutter_test/flutter_test.dart';

import '../unit_test.dart';

void main() {
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late CAPIBloC capiBloc;
  late STreeNode sel;
  late TabBarNode tb1;
  late TabBarViewNode tbv1;
  late SnippetRootNode snippetWithScaffoldAnd2Tabs;

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  setUp(() {
    snippetWithScaffoldAnd2Tabs = SnippetRootNode(
      name: 'test-snippet',
      child: ScaffoldNode(
        appBar: AppBarNode(
          title: GenericSingleChildNode(
              propertyName: 'title', child: TextNode(text: 'my title')),
          bottom: GenericSingleChildNode(
            propertyName: 'bottom',
            child: tb1 = TabBarNode(
              children: [
                TextNode(text: 'tab 1'),
                TextNode(text: 'Tab 2'),
              ],
            ),
          ),
        ),
        body: GenericSingleChildNode(
          propertyName: 'body',
          child: tbv1 = TabBarViewNode(
            children: [
              PlaceholderNode(),
              sel = PlaceholderNode(),
            ],
          ),
        ),
      ),
    );
  });

  void test_snippet_setup() {
    snippet = snippetWithScaffoldAnd2Tabs..validateTree();
    treeC = SnippetTreeController(
      roots: [snippet],
      childrenProvider: Node.snippetTreeChildrenProvider,
      parentProvider: Node.snippetTreeParentProvider,
    );
    capiBloc = CAPIBloC(
      modelRepo: setupMockRepo(),
      mockSnippetBeingEdited: SnippetBeingEdited(
        selectedNode: null,
        showProperties: false,
        nodeBeingDeleted: null,
        rootNode: snippet,
        treeC: treeC,
        jsonBeforeAnyChange: '',
      ),
    );
  }

  blocTest<CAPIBloC, CAPIState>(
    'replace 2nd TabBarView child with a Center',
    setUp: () => test_snippet_setup(),
    build: () => capiBloc,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(node: sel));
      bloc.add(const CAPIEvent.replaceSelectionWith(type: CenterNode));
      bloc.add(const CAPIEvent.appendChild(type: ContainerNode));
    },
    skip: 3,
    verify: (bloc) {
      expect(sel, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<CenterNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'append 3rd tab view to the TabBarView',
    setUp: () => test_snippet_setup(),
    build: () => capiBloc,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(node: tbv1));
      bloc.add(const CAPIEvent.appendChild(type: SizedBoxNode));
      bloc.add(const CAPIEvent.appendChild(type: ContainerNode));
    },
    skip: 3,
    verify: (bloc) {
      expect(sel, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<PlaceholderNode>());
      expect(tbv1.children[2], isA<SizedBoxNode>());
      expect(bloc.state.snippetBeingEdited?.selectedNode, isA<ContainerNode>());
      expect(tb1.children.length, 3);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'append 3rd tab to the TabBar',
    setUp: () => test_snippet_setup(),
    build: () => capiBloc,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(node: tb1));
      bloc.add(const CAPIEvent.appendChild(type: TextNode));
    },
    skip: 2,
    verify: (bloc) {
      expect(sel, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<PlaceholderNode>());
      expect(tbv1.children[2], isA<PlaceholderNode>());
      expect(bloc.state.snippetBeingEdited?.selectedNode, isA<TextNode>());
      expect(tbv1.children.length, 3);
      expect(snippet.anyMissingParents(), false);
    },
  );

  // tearDown() runs after each test in the suite
  tearDown(() {
    // print('\nTearing down resources after a test...');
  });

  // tearDownAll() runs once after all tests in the suite
  tearDownAll(() {
    // print('\nTearing down common resources...');
  });
}
