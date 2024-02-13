// ignore_for_file: non_constant_identifier_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SnippetRootNode emptySnippet;
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late SnippetBloC snippetBloc;
  late SnippetState selectedState;
  late STreeNode sel;
  late RichTextNode rtNode;

  late TextNode cl1;
  late TextNode cl2;
  late TextNode cl3;
  late GapNode clR;
  late CenterNode sc1;
  late CenterNode sc2;
  late CenterNode sc3;
  late ContainerNode scR;
  late RowNode mc1;
  late RowNode mc2;
  late RowNode mc3;
  late ColumnNode mcR;
  late PlaceholderNode placeholder;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  final ur = SnippetTreeUR();

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  setUp(() {
    cl1 = TextNode(text: 'cl1');
    cl2 = TextNode(text: 'cl2');
    cl3 = TextNode(text: 'cl3');
    clR = GapNode(gap: 10);
    sc1 = CenterNode();
    sc2 = CenterNode();
    sc3 = CenterNode();
    scR = ContainerNode();
    mc1 = RowNode(children: []);
    mc2 = RowNode(children: []);
    mc3 = RowNode(children: []);
    mcR = ColumnNode(children: []);
    rtNode = RichTextNode(text: TextSpanNode(text: 'rich text'));
    placeholder = PlaceholderNode();
  });

  void test_snippet_setup(STreeNode child, {STreeNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)..setParents(null);
    treeC = SnippetTreeController(roots: [snippet], childrenProvider: Node.snippetTreeChildrenProvider);
    snippetBloc = SnippetBloC(rootNode: snippet, treeC: treeC, treeUR: ur);
    if (select != null) {
      selectedState = snippetBloc.state.copyWith(
        selectedNode: select,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
      );
    }
  }

  /// reusable expected states
  expectedState_SelectedNode(SnippetBloC bloc, STreeNode node) => bloc.state.copyWith(
        selectedNode: node,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
      );

  blocTest<SnippetBloC, SnippetState>(
    'wrap Expanded with a FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = ExpandedNode(), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: RowNode));
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<RowNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'try to wrap Expanded with a non FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = ExpandedNode(), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sel, isA<ExpandedNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'wrap Flexible with a FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = FlexibleNode(), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: ColumnNode));
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<ColumnNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'try to wrap Flexible with a non FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = FlexibleNode(), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sel, isA<FlexibleNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'wrap Positioned with a Stack',
    setUp: () => test_snippet_setup(sc1.child = sel = PositionedNode(), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: StackNode));
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<StackNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'try to wrap Positioned with a non Stack',
    setUp: () => test_snippet_setup(sc1.child = sel = PositionedNode(), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sel, isA<PositionedNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'wrap PollOption with a Poll',
    setUp: () => test_snippet_setup(sc1.child = sel = PollOptionNode(optionId: '1', text: 'option 1'), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: PollNode));
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<PollNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'try to wrap PollOption with a non Poll',
    setUp: () => test_snippet_setup(sc1.child = sel = PollOptionNode(optionId: '1', text: 'option 1'), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sel, isA<PollOptionNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'wrap Step with a Stepper',
    setUp: () => test_snippet_setup(
        sc1.child = sel = StepNode(contentSnippetName: 'content-snippet-name', subtitleSnippetName: '', titleSnippetName: 'title'),
        select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: StepperNode));
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<StepperNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'try to wrap Step with a non Stack',
    setUp: () => test_snippet_setup(
        sc1.child = sel = StepNode(contentSnippetName: 'content-snippet-name', subtitleSnippetName: '', titleSnippetName: 'title'),
        select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sel, isA<StepNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "wrap RichText's TextSpan with a TextSpan",
    setUp: () => test_snippet_setup(sc1.child = (rtNode)),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(node: rtNode.text, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.wrapSelectionWith(type: TextSpanNode));
    },
    expect: () => <SnippetState>[
      expectedState_SelectedNode(snippetBloc, rtNode.text),
    ],
    skip: 1,
    // can't obtain selection node, because was created by the bloc (type->STreeNode)
    verify: (bloc) {
      expect(rtNode.text, isA<TextSpanNode>());
      expect((rtNode.text as TextSpanNode).text, isNull);
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
