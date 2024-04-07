// ignore_for_file: non_constant_identifier_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repo_test_suite.dart';
import '../unit_test.dart';
import '../unit_test.mocks.dart';

void main() {
  late MockModelRepository mockRepo;
  late CAPIBloC capiBloc;
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late SnippetBloC snippetBloc;
  late SnippetRootNode snippetWithScaffoldAnd3Tabs;
  late STreeNode nodeTBD;
  late RichTextNode rtNode;

  late TextNode cl1;
  late TextNode cl2;
  late CenterNode sc1;
  late CenterNode sc2;
  late ContainerNode container1;
  late CenterNode tbView1;
  late RowNode mc1;
  late RowNode mc2;
  late TabBarNode tb1;
  late TabBarViewNode tbv1;
  late STreeNode sel;
  late STreeNode text1;
  late GenericSingleChildNode stepTitleProperty;
  late AppBarNode appBar;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  // final ur = SnippetTreeUR();

  const snippetName = 'scaffold-with-tabs';
  final modelSnippetRoot = SnippetRootNode(
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
              TextNode(text: 'tab 1'),
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
  );

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  setUp(() {
    return Future(() async {
      mockRepo = setupMockRepo();
      FC().init(
        modelName: 'flutter-content-test-app',
        testModelRepo: mockRepo,
      );
      cl1 = TextNode(text: 'cl1');
      cl2 = TextNode(text: 'cl2');
      sc1 = CenterNode();
      sc2 = CenterNode();
      mc1 = RowNode(children: []);
      mc2 = RowNode(children: []);
      snippetWithScaffoldAnd3Tabs = SnippetRootNode(
        name: 'test-snippet',
        child: ScaffoldNode(
          appBar: appBar = AppBarNode(
            title: GenericSingleChildNode(
                propertyName: 'title', child: TextNode(text: 'my title')),
            bottom: GenericSingleChildNode(
              propertyName: 'bottom',
              child: tb1 = TabBarNode(
                children: [
                  text1 = TextNode(text: 'tab 1'),
                  TextNode(text: 'Tab 2'),
                  TextNode(text: 'Stepper Tab'),
                ],
              ),
            ),
          ),
          body: GenericSingleChildNode(
            propertyName: 'body',
            child: tbv1 = TabBarViewNode(
              children: [
                tbView1 = CenterNode(child: container1 = ContainerNode()),
                sel = PlaceholderNode(
                    centredLabel: 'page 2',
                    colorValue: Colors.blueAccent.value),
                StepperNode(children: [
                  StepNode(
                    title: stepTitleProperty = GenericSingleChildNode(
                        propertyName: 'title',
                        child: TextNode(text: 'the title')),
                    subtitle: GenericSingleChildNode(propertyName: 'subtitle'),
                    content: GenericSingleChildNode(
                        propertyName: 'content',
                        child: TextNode(text: 'some content')),
                  )
                ]),
              ],
            ),
          ),
        ),
      );
    });
  });

  void test_snippet_setup(STreeNode child) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)
      ..validateTree();
    treeC = SnippetTreeController(
        roots: [snippet], childrenProvider: Node.snippetTreeChildrenProvider);
    snippetBloc = SnippetBloC(rootNode: snippet, treeC: treeC);
  }

  /// reusable expected states
  expectedState_NoSelection(SnippetBloC bloc) => bloc.state.copyWith(
        selectedNode: null,
        showProperties: false,
        nodeBeingDeleted: null,
      );

  expectedState_SelectedNode(SnippetBloC bloc, STreeNode node) =>
      bloc.state.copyWith(
        selectedNode: node,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
      );

  expectedState_NodeBeingDeleted(SnippetBloC bloc, STreeNode node) =>
      bloc.state.copyWith(
        nodeBeingDeleted: node,
        selectedNode: node,
        showProperties: true,
      );

  blocTest<SnippetBloC, SnippetState>(
    'delete only child (a CL) in snippet',
    setUp: () => test_snippet_setup(cl1),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: cl1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, cl1),
      expectedState_NodeBeingDeleted(snippetBloc, cl1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, isA<PlaceholderNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete only child (SC) in snippet',
    setUp: () => test_snippet_setup(sc1),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sc1),
      expectedState_NodeBeingDeleted(snippetBloc, sc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, isA<PlaceholderNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "delete step's title property",
    setUp: () => test_snippet_setup(snippetWithScaffoldAnd3Tabs),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: stepTitleProperty.child!,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    skip: 3,
    tearDown: () {
      expect(stepTitleProperty.child, isA<TextNode>());
      expect((stepTitleProperty.child as TextNode).text,
          'must have a title widget!');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an SC node having a child (*)',
    setUp: () => test_snippet_setup(sc1..child = cl1),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sc1),
      expectedState_NodeBeingDeleted(snippetBloc, sc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete only child (MC) in snippet',
    setUp: () => test_snippet_setup(mc1),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, isA<PlaceholderNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node having a single child (*)',
    setUp: () => test_snippet_setup(mc1..children = [cl1]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node having >1 child (*)',
    setUp: () => test_snippet_setup(mc1..children = [cl1, cl2]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, mc1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete only child (RichText) in snippet',
    setUp: () => test_snippet_setup(
        nodeTBD = RichTextNode(text: TextSpanNode(text: 'rich text span'))),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(snippet.child, isA<PlaceholderNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an empty SC node having an SC parent',
    setUp: () => test_snippet_setup(sc1..child = sc2),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sc2,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sc2),
      expectedState_NodeBeingDeleted(snippetBloc, sc2),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(sc1.child, isNull);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an SC node having an SC parent and a child (*)',
    setUp: () => test_snippet_setup(sc1..child = (sc2..child = cl1)),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sc2,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sc2),
      expectedState_NodeBeingDeleted(snippetBloc, sc2),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(sc1.child, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node having no children',
    setUp: () => test_snippet_setup(sc1..child = mc1),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(sc1.child, isNull);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node having a single child',
    setUp: () => test_snippet_setup(sc1..child = (mc1..children = [cl1])),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(sc1.child, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node a with >1 child',
    setUp: () => test_snippet_setup(sc1..child = (mc1..children = [cl1, cl2])),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(sc1.child, mc1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an SC node with MC parent',
    setUp: () => test_snippet_setup(mc1..children = [sc1]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sc1),
      expectedState_NodeBeingDeleted(snippetBloc, sc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.isEmpty, true);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an SC node having (*) child, and having MC parent',
    setUp: () => test_snippet_setup(mc1..children = [sc1..child = cl1]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sc1),
      expectedState_NodeBeingDeleted(snippetBloc, sc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.first, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an empty MC node with MC parent',
    setUp: () => test_snippet_setup(mc1..children = [mc2]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc2,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc2),
      expectedState_NodeBeingDeleted(snippetBloc, mc2),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.isEmpty, true);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node having a single (*) child, and having MC parent',
    setUp: () => test_snippet_setup(mc1
      ..children = [
        mc2..children = [cl1]
      ]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc2,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc2),
      expectedState_NodeBeingDeleted(snippetBloc, mc2),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.first, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete an MC node having >1 child, and having MC parent',
    setUp: () => test_snippet_setup(mc1
      ..children = [
        mc2..children = [cl1, cl2]
      ]),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: mc1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, mc1),
      expectedState_NodeBeingDeleted(snippetBloc, mc1),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.first, mc2);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "delete a RichText's childless TextSpan",
    setUp: () => test_snippet_setup(
        rtNode = RichTextNode(text: nodeTBD = TextSpanNode(text: 'monkey'))),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(rtNode.text, isA<TextSpanNode>());
      expect((rtNode.text as TextSpanNode).text, 'xxx');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "delete a RichText's TextSpan that itself has a WidgetSpan",
    setUp: () => test_snippet_setup(rtNode = RichTextNode(
        text: nodeTBD = TextSpanNode(children: [WidgetSpanNode()]))),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(rtNode.text, isA<WidgetSpanNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "delete a RichText's TextSpan that itself has a TextSpan with 1 (*) child",
    setUp: () => test_snippet_setup(rtNode = RichTextNode(
        text: nodeTBD = TextSpanNode(
            text: 'tbd', children: [TextSpanNode(text: 'monkey')]))),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(rtNode.text, isA<TextSpanNode>());
      expect((rtNode.text as TextSpanNode).text, 'monkey');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "delete a RichText's TextSpan that itself has >1 children",
    setUp: () => test_snippet_setup(rtNode = RichTextNode(
        text: nodeTBD = TextSpanNode(
            text: 'AAA',
            children: [TextSpanNode(text: 'TTT'), WidgetSpanNode()]))),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(rtNode.text, isA<TextSpanNode>());
      expect((nodeTBD as TextSpanNode).text, 'AAA');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete first of 3 children from MultiChildNode',
    setUp: () => test_snippet_setup(CenterNode(
        child: mc1
          ..children = [
            nodeTBD = TextNode(text: '111'),
            TextNode(text: '222'),
            TextNode(text: '333'),
          ])),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.length, 2);
      expect((mc1.children.first as TextNode).text, '222');
      expect((mc1.children.last as TextNode).text, '333');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete 2nd of 3 children from MultiChildNode',
    setUp: () => test_snippet_setup(CenterNode(
        child: mc1
          ..children = [
            TextNode(text: '111'),
            nodeTBD = TextNode(text: '222'),
            TextNode(text: '333'),
          ])),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.length, 2);
      expect((mc1.children.first as TextNode).text, '111');
      expect((mc1.children.last as TextNode).text, '333');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete last of 3 children from MultiChildNode',
    setUp: () => test_snippet_setup(CenterNode(
        child: mc1
          ..children = [
            TextNode(text: '111'),
            TextNode(text: '222'),
            nodeTBD = TextNode(text: '333'),
          ])),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: nodeTBD,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      // don't delete yet - just set nodeBeingDeleted
      bloc.add(const SnippetEvent.deleteNodeTapped());
      // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, nodeTBD),
      expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
      expectedState_NoSelection(snippetBloc),
    ],
    tearDown: () {
      expect(mc1.children.length, 2);
      expect((mc1.children.first as TextNode).text, '111');
      expect((mc1.children.last as TextNode).text, '222');
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete 1st of 3 tabs - leaving 2 tabs',
    setUp: () => test_snippet_setup(snippetWithScaffoldAnd3Tabs),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: container1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.deleteNodeTapped());
      bloc.add(const SnippetEvent.completeDeletion());
      bloc.add(SnippetEvent.selectNode(
          node: text1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.deleteNodeTapped());
      bloc.add(const SnippetEvent.completeDeletion());
    },
    skip: 3,
    expect: () => [
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode', isNull),
      const TypeMatcher<SnippetState>()
        ..having((state) => tb1.children.length, '#tabs', tbv1.children.length)
        ..having((state) => tb1.children.length, '#tabs', 3),
      const TypeMatcher<SnippetState>()
        ..having((state) => tb1.children.length, '#tabs', tbv1.children.length)
        ..having((state) => snippet.anyMissingParents(), 'parents', false)
        ..having((state) => tb1.children.length, '#tabs', 2)
        ..having((state) => appBar.bottom?.child, 'bottom', TabBar)
    ],
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete 1st of 3 tabs - deletes but retains 3 tabs',
    setUp: () => test_snippet_setup(snippetWithScaffoldAnd3Tabs),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: tbView1,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.deleteNodeTapped());
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => [
      const TypeMatcher<SnippetState>()
        ..having(
            (state) => state.selectedNode, 'selectedNode', isA<CenterNode>()),
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode', tbView1)
        ..having((state) => state.nodeBeingDeleted, 'selectedNode', tbView1),
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode', isNull)
        ..having((state) => state.nodeBeingDeleted, 'nodeBeingDeleted', isNull),
    ],
  );

  blocTest<SnippetBloC, SnippetState>(
    'delete 2nd tab view',
    setUp: () => test_snippet_setup(snippetWithScaffoldAnd3Tabs),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(
          node: sel,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.deleteNodeTapped());
      bloc.add(const SnippetEvent.completeDeletion());
    },
    expect: () => [
      expectedState_SelectedNode(snippetBloc, sel),
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode type',
            isA<PlaceholderNode>())
        ..having((state) => state.selectedNode?.parent, 'parent',
            isA<TabBarViewNode>()),
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode type', isNull)
    ],
    verify: (bloc) {
      expect(tbv1.parent, isA<GenericSingleChildNode>());
      expect(tb1.children.length, 2);
      expect(tbv1.children.length, tb1.children.length);
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
