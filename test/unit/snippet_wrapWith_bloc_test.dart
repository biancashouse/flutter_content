// ignore_for_file: non_constant_identifier_names
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:flutter_test/flutter_test.dart';

import '../unit_test.dart';
import '../unit_test.mocks.dart';

void main() {
  late MockModelRepository mockRepo;
  late SnippetRootNode snippet;
  late CAPIBloC capiBloc;
  late CAPIState selectedState;
  late STreeNode sel;
  late RichTextNode rtNode;

  late CenterNode sc1;

  // setupAll() runs once before any test in the suite
  setUpAll(() async {});

  setUp(() {
    mockRepo = setupMockRepo();

    sc1 = CenterNode();
    rtNode = RichTextNode(text: TextSpanNode(text: 'rich text'));
  });

  void test_snippet_setup(STreeNode child, {STreeNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)
      ..validateTree();

    capiBloc = CAPIBloC(
      modelRepo: mockRepo,
      mockSnippetBeingEdited: SnippetBeingEdited(
        rootNode: snippet,
        treeC: SnippetTreeController(
          roots: [snippet],
          childrenProvider: Node.snippetTreeChildrenProvider,
          parentProvider: Node.snippetTreeParentProvider,
        ),
        selectedNode: select,
        nodeBeingDeleted: null,
        jsonBeforeAnyChange: '{}',
      ),
    );
    selectedState = capiBloc.state;
  }

  /// reusable expected states
  expectedState_SelectedNode(CAPIBloC bloc, STreeNode node) =>
      bloc.state.copyWith(
        snippetBeingEdited: SnippetBeingEdited(
          rootNode: snippet,
          treeC: SnippetTreeController(
            roots: [snippet],
            childrenProvider: Node.snippetTreeChildrenProvider,
            parentProvider: Node.snippetTreeParentProvider,
          ),
          selectedNode: node,
          nodeBeingDeleted: null,
          jsonBeforeAnyChange: '{}',
        ),
      );

  blocTest<CAPIBloC, CAPIState>(
    'wrap Expanded with a FlexNode',
    setUp: () =>
        test_snippet_setup(sc1.child = sel = ExpandedNode(), select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: RowNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(capiBloc, sel.getParent() as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.getParent(), isA<RowNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Expanded with a non FlexNode',
    setUp: () =>
        test_snippet_setup(sc1.child = sel = ExpandedNode(), select: sel),
    build: () => capiBloc,
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
    setUp: () =>
        test_snippet_setup(sc1.child = sel = FlexibleNode(), select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: ColumnNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(capiBloc, sel.getParent() as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.getParent(), isA<ColumnNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Flexible with a non FlexNode',
    setUp: () =>
        test_snippet_setup(sc1.child = sel = FlexibleNode(), select: sel),
    build: () => capiBloc,
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
    setUp: () =>
        test_snippet_setup(sc1.child = sel = PositionedNode(), select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: StackNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(capiBloc, sel.getParent() as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.getParent(), isA<StackNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Positioned with a non Stack',
    setUp: () =>
        test_snippet_setup(sc1.child = sel = PositionedNode(), select: sel),
    build: () => capiBloc,
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
    setUp: () => test_snippet_setup(
        sc1.child = sel = PollOptionNode(text: 'option 1'),
        select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: PollNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(
          capiBloc, sel.getParent()?.getParent() as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.getParent(), isA<PollNode>());
      expect(sel.getParent()?.getParent(), isA<ContainerNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap PollOption with a non Poll',
    setUp: () => test_snippet_setup(
        sc1.child = sel = PollOptionNode(text: 'option 1'),
        select: sel),
    build: () => capiBloc,
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
          title:
              GenericSingleChildNode(propertyName: 'title', child: TextNode()),
          subtitle: GenericSingleChildNode(
              propertyName: 'subtitle', child: TextNode()),
          content: GenericSingleChildNode(
              propertyName: 'content', child: TextNode()),
        ),
        select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.wrapSelectionWith(type: StepperNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(capiBloc, sel.getParent() as STreeNode),
    ],
    verify: (bloc) {
      expect(sel.getParent(), isA<StepperNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'try to wrap Step with a non Stack',
    setUp: () => test_snippet_setup(
        sc1.child = sel = StepNode(
          title:
              GenericSingleChildNode(propertyName: 'title', child: TextNode()),
          subtitle: GenericSingleChildNode(
              propertyName: 'subtitle', child: TextNode()),
          content: GenericSingleChildNode(
              propertyName: 'content', child: TextNode()),
        ),
        select: sel),
    build: () => capiBloc,
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
    build: () => capiBloc,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(node: rtNode.text));
      bloc.add(const CAPIEvent.wrapSelectionWith(type: TextSpanNode));
    },
    expect: () => <CAPIState>[
      expectedState_SelectedNode(capiBloc, rtNode.text),
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
