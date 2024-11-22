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
  late CAPIState selectedState;
  late STreeNode sel;
  late RichTextNode rt2;

  late TextNode cl1;
  late CenterNode sc1;

  /// reusable expected states
  expectedState_SelectedNode(CAPIBloC bloc, STreeNode node) =>
      bloc.state.copyWith(
        snippetBeingEdited: SnippetBeingEdited(
          selectedNode: node,
          nodeBeingDeleted: null,
          rootNode: bloc.state.snippetBeingEdited!.rootNode,
          treeC: bloc.state.snippetBeingEdited!.treeC,
          jsonBeforeAnyChange: bloc.state.snippetBeingEdited!.jsonBeforeAnyChange,
        ),
      );

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  setUp(() {
    cl1 = TextNode(text: 'cl1');
    sc1 = CenterNode();
    rt2 = RichTextNode(text: WidgetSpanNode());
  });

  void test_snippet_setup(STreeNode child, {STreeNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)
      ..validateTree();
    treeC = SnippetTreeController(
      roots: [snippet],
      childrenProvider: Node.snippetTreeChildrenProvider,
      parentProvider: Node.snippetTreeParentProvider,
    );
    capiBloc = CAPIBloC(
        modelRepo: setupMockRepo(),
        mockSnippetBeingEdited: SnippetBeingEdited(
          rootNode: snippet,
          treeC: treeC,
          jsonBeforeAnyChange: '',
        ));
    if (select != null) {
      selectedState = capiBloc.state.copyWith(
        snippetBeingEdited: SnippetBeingEdited(
          selectedNode: select,
          nodeBeingDeleted: null,
          rootNode: capiBloc.state.snippetBeingEdited!.rootNode,
          treeC: capiBloc.state.snippetBeingEdited!.treeC,
          jsonBeforeAnyChange: capiBloc.state.snippetBeingEdited!.jsonBeforeAnyChange,
        ),
      );
    }
  }

  blocTest<CAPIBloC, CAPIState>(
    'try to replace type with same type',
    setUp: () => test_snippet_setup(sc1..child = cl1, select: cl1),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: TextNode));
    },
    skip: 1,
    verify: (bloc) {
      expect(sc1.child, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'replace CL with a SC',
    setUp: () => test_snippet_setup(sc1..child = cl1, select: cl1),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: ContainerNode));
    },
    skip: 1,
    verify: (bloc) {
      expect(sc1.child, isA<ContainerNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "try to replace RichText's InlineSpan child with with a non-InlineSpan",
    setUp: () => test_snippet_setup(sc1..child = rt2, select: rt2.text),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: ContainerNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sc1.child, isA<RichTextNode>());
      expect(rt2.text, isA<WidgetSpanNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "try to replace a non-InlineSpan with an InlineSpan",
    setUp: () => test_snippet_setup(sc1..child = cl1, select: cl1),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: TextSpanNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sc1.child, isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "try to replace a PollOption with a non-PollOption",
    setUp: () => test_snippet_setup(
        sc1..child = (PollNode(children: [sel = PollOptionNode(text: 'text')])),
        select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: TextNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sc1.child, isA<PollNode>());
      expect((sc1.child as PollNode).children.first, isA<PollOptionNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "try to replace a Step with a non-Step",
    setUp: () => test_snippet_setup(
        sc1
          ..child = (StepperNode(children: [
            sel = StepNode(
              title: GenericSingleChildNode(
                  propertyName: 'title', child: TextNode()),
              subtitle: GenericSingleChildNode(
                  propertyName: 'subtitle', child: TextNode()),
              content: GenericSingleChildNode(
                  propertyName: 'content', child: TextNode()),
            )
          ])),
        select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: TextNode));
    },
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(sc1.child, isA<StepperNode>());
      expect((sc1.child as StepperNode).children.first, isA<StepNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "replace a TextNode with a Container",
    setUp: () => test_snippet_setup(cl1),
    build: () => capiBloc,
    // seed: () => selectedState,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(node: cl1));
      bloc.add(const CAPIEvent.replaceSelectionWith(type: ContainerNode));
    },
    expect: () => [
      const TypeMatcher<CAPIState>()
        ..having((state) => state.snippetBeingEdited?.selectedNode,
            'selectedNode type', cl1),
      const TypeMatcher<CAPIState>()
        ..having((state) => state.snippetBeingEdited?.selectedNode,
            'selectedNode type', isA<ContainerNode>())
        ..having((state) => state.snippetBeingEdited?.selectedNode?.getParent(),
            'parent', cl1.getParent())
    ],
    verify: (bloc) {
      // expect(sc1.child, isA<StepperNode>());
      // expect((sc1.child as StepperNode).children.first, isA<StepNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    "replace a SizedBox containing a Poll with a Container",
    setUp: () => test_snippet_setup(
        sc1
          ..child = (sel = SizedBoxNode(
              child: PollNode(children: [PollOptionNode(text: 'text')]))),
        select: sel),
    build: () => capiBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.replaceSelectionWith(type: ContainerNode));
    },
    expect: () => [
      const TypeMatcher<CAPIState>()
        ..having((state) => state.snippetBeingEdited?.selectedNode,
            'selectedNode type', isA<ContainerNode>())
        ..having((state) => state.snippetBeingEdited?.selectedNode?.getParent(),
            'parent', sc1)
    ],
    verify: (bloc) {
      expect(sc1.child, isA<ContainerNode>());
      expect((sc1.child as ContainerNode).child, isNotNull);
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
