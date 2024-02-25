// ignore_for_file: non_constant_identifier_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late SnippetBloC snippetBloc;
  late SnippetState selectedState;
  late STreeNode sel;
  late RichTextNode rt2;

  late TextNode cl1;
  late CenterNode sc1;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  final ur = SnippetTreeUR();

  /// reusable expected states
  expectedState_SelectedNode(SnippetBloC bloc, STreeNode node) => bloc.state.copyWith(
        selectedNode: node,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
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

  blocTest<SnippetBloC, SnippetState>(
    'try to replace type with same type',
    setUp: () => test_snippet_setup(sc1..child = cl1, select: cl1),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: TextNode));
    },
    skip: 1,
    verify: (bloc) {
      expect(sc1.child, cl1);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'replace CL with a SC',
    setUp: () => test_snippet_setup(sc1..child = cl1, select: cl1),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: ContainerNode));
    },
    skip: 1,
    verify: (bloc) {
      expect(sc1.child, isA<ContainerNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "try to replace RichText's InlineSpan child with with a non-InlineSpan",
    setUp: () => test_snippet_setup(sc1..child = rt2, select: rt2.text),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: ContainerNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sc1.child, isA<RichTextNode>());
      expect(rt2.text, isA<WidgetSpanNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "try to replace a non-InlineSpan with an InlineSpan",
    setUp: () => test_snippet_setup(sc1..child = cl1, select: cl1),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: TextSpanNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sc1.child, isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "try to replace a PollOption with a non-PollOption",
    setUp: () => test_snippet_setup(sc1..child = (PollNode(children: [sel = PollOptionNode(optionId: 'optionId', text: 'text')])), select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: TextNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sc1.child, isA<PollNode>());
      expect((sc1.child as PollNode).children.first, isA<PollOptionNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "try to replace a Step with a non-Step",
    setUp: () => test_snippet_setup(
        sc1
          ..child = (StepperNode(children: [
            sel = StepNode(
              title: GenericSingleChildNode(propertyName: 'title', child: TextNode()),
              subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode()),
              content: GenericSingleChildNode(propertyName: 'content', child: TextNode()),
            )
          ])),
        select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: TextNode));
    },
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(sc1.child, isA<StepperNode>());
      expect((sc1.child as StepperNode).children.first, isA<StepNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "replace a TextNode with a Container",
    setUp: () => test_snippet_setup(cl1),
    build: () => snippetBloc,
    // seed: () => selectedState,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(node: cl1, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.replaceSelectionWith(type: ContainerNode));
    },
    expect: () => [
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode type', cl1),
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode type', isA<ContainerNode>())
        ..having((state) => state.selectedNode?.parent, 'parent', cl1.parent)
    ],
    verify: (bloc) {
      // expect(sc1.child, isA<StepperNode>());
      // expect((sc1.child as StepperNode).children.first, isA<StepNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    "replace a SizedBox containing a Poll with a Container",
    setUp: () => test_snippet_setup(
        sc1..child = (sel = SizedBoxNode(child: PollNode(children: [PollOptionNode(optionId: 'optionId', text: 'text')]))),
        select: sel),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.replaceSelectionWith(type: ContainerNode));
    },
    expect: () => [
      const TypeMatcher<SnippetState>()
        ..having((state) => state.selectedNode, 'selectedNode type', isA<ContainerNode>())
        ..having((state) => state.selectedNode?.parent, 'parent', sc1)
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
