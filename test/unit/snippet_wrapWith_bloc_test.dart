// ignore_for_file: non_constant_identifier_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late SnippetBloC snippetBloc;
  late SnippetState selectedState;
  late STreeNode sel;
  late RichTextNode rtNode;

  late CenterNode sc1;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  final ur = SnippetTreeUR();

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  setUp(() {
    sc1 = CenterNode();
    rtNode = RichTextNode(text: TextSpanNode(text: 'rich text'));
  });

  void test_snippet_setup(STreeNode child, {STreeNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)..validateTree();
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
      expectedState_SelectedNode(snippetBloc, sel.parent?.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<PollNode>());
      expect(sel.parent?.parent, isA<ContainerNode>());
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
        sc1.child = sel = StepNode(
          title: GenericSingleChildNode(propertyName: 'title', child: TextNode()),
          subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode()),
          content: GenericSingleChildNode(propertyName: 'content', child: TextNode()),
        ),
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
        sc1.child = sel = StepNode(
          title: GenericSingleChildNode(propertyName: 'title', child: TextNode()),
          subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode()),
          content: GenericSingleChildNode(propertyName: 'content', child: TextNode()),
        ),
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
