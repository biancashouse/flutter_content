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
  late CAPIBloC CAPIBloC;
  late CAPIState selectedState;
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
    CAPIBloC = CAPIBloC(rootNode: snippet, treeC: treeC, treeUR: ur);
    if (select != null) {
      selectedState = CAPIBloC.state.copyWith(
        selectedNode: select,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
      );
    }
  }

  /// reusable expected states
  expectedState_SelectedNode(CAPIBloC bloc, STreeNode node) => bloc.state.copyWith(
        selectedNode: node,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
      );

  blocTest<CAPIBloC, CAPIState>(
    'wrap Expanded with a FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = ExpandedNode(), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: RowNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(CAPIBloC, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<RowNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Expanded with a non FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = ExpandedNode(), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sel, isA<ExpandedNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'wrap Flexible with a FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = FlexibleNode(), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ColumnNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(CAPIBloC, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<ColumnNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Flexible with a non FlexNode',
    setUp: () => test_snippet_setup(sc1.child = sel = FlexibleNode(), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sel, isA<FlexibleNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'wrap Positioned with a Stack',
    setUp: () => test_snippet_setup(sc1.child = sel = PositionedNode(), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: StackNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(CAPIBloC, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<StackNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Positioned with a non Stack',
    setUp: () => test_snippet_setup(sc1.child = sel = PositionedNode(), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sel, isA<PositionedNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'wrap PollOption with a Poll',
    setUp: () => test_snippet_setup(sc1.child = sel = PollOptionNode(optionId: '1', text: 'option 1'), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: PollNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(CAPIBloC, sel.parent?.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<PollNode>());
      expect(sel.parent?.parent, isA<ContainerNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap PollOption with a non Poll',
    setUp: () => test_snippet_setup(sc1.child = sel = PollOptionNode(optionId: '1', text: 'option 1'), select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sel, isA<PollOptionNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'wrap Step with a Stepper',
    setUp: () => test_snippet_setup(
        sc1.child = sel = StepNode(
          title: GenericSingleChildNode(propertyName: 'title', child: TextNode()),
          subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode()),
          content: GenericSingleChildNode(propertyName: 'content', child: TextNode()),
        ),
        select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: StepperNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(CAPIBloC, sel.parent as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.parent, isA<StepperNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Step with a non Stack',
    setUp: () => test_snippet_setup(
        sc1.child = sel = StepNode(
          title: GenericSingleChildNode(propertyName: 'title', child: TextNode()),
          subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode()),
          content: GenericSingleChildNode(propertyName: 'content', child: TextNode()),
        ),
        select: sel),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ContainerNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sel, isA<StepNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "wrap RichText's TextSpan with a TextSpan",
    setUp: () => test_snippet_setup(sc1.child = (rtNode)),
    build: () => CAPIBloC,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(node: rtNode.text, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const CAPIEvent.wrapSelectionWith(type: TextSpanNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(CAPIBloC, rtNode.text),
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
