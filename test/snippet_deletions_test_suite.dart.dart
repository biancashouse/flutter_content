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
  late STreeNode placeholderNode;
  late STreeNode nodeTBD;

  final cl1 = TextNode(text: 'cl1');
  final cl2 = TextNode(text: 'cl2');
  final cl3 = TextNode(text: 'cl3');
  final clR = GapNode(gap: 10);
  final sc1 = CenterNode();
  final sc2 = CenterNode();
  final sc3 = CenterNode();
  final scR = ContainerNode();
  final mc1 = RowNode(children: []);
  final mc2 = RowNode(children: []);
  final mc3 = RowNode(children: []);
  final mcR = ColumnNode(children: []);
  final placeholder = PlaceholderNode();

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  final ur = SnippetTreeUR();
  final textNode = TextNode(text: 'abc');

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  void test_snippet_setup(STreeNode child) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)..setParents(null);
    treeC = SnippetTreeController(roots: [snippet], childrenProvider: Node.snippetTreeChildrenProvider);
    snippetBloc = SnippetBloC(rootNode: snippet, treeC: treeC, treeUR: ur);
  }

  /// reusable expected states
  expectedState_SelectedNode(SnippetBloC bloc, STreeNode node) => bloc.state.copyWith(
        selectedNode: node,
        showProperties: true,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
        nodeBeingDeleted: null,
      );

  expectedState_NodeBeingDeleted(SnippetBloC bloc, STreeNode node) => bloc.state.copyWith(
        nodeBeingDeleted: node,
        selectedNode: node,
        showProperties: true,
      );

  expectedState_CompletedDeletion(SnippetBloC bloc) => bloc.state.copyWith(
        selectedNode: null,
        nodeBeingDeleted: null,
      );

  blocTest<SnippetBloC, SnippetState>('delete only child in snippet',
      setUp: () => test_snippet_setup(cl1),
      build: () => snippetBloc,
      act: (bloc) {
        bloc.add(SnippetEvent.selectNode(node: cl1, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
        // don't delete yet - just set nodeBeingDeleted
        bloc.add(const SnippetEvent.deleteNodeTapped());
        // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
        bloc.add(const SnippetEvent.completeDeletion());
      },
      expect: () => <SnippetState>[
            expectedState_SelectedNode(snippetBloc, cl1),
            expectedState_NodeBeingDeleted(snippetBloc, cl1),
            expectedState_CompletedDeletion(snippetBloc),
          ],
      tearDown: () {
        expect(snippet.child, isA<PlaceholderNode>());
        expect(snippet.anyMissingParents(), false);
      });

  blocTest<SnippetBloC, SnippetState>('delete middle child from MultiChildNode',
      setUp: () => test_snippet_setup(sc1..child = cl1),
      build: () => snippetBloc,
      act: (bloc) {
        bloc.add(SnippetEvent.selectNode(node: sc1, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
        // don't delete yet - just set nodeBeingDeleted
        bloc.add(const SnippetEvent.deleteNodeTapped());
        // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
        bloc.add(const SnippetEvent.completeDeletion());
      },
      expect: () => <SnippetState>[
            expectedState_SelectedNode(snippetBloc, sc1),
            expectedState_NodeBeingDeleted(snippetBloc, sc1),
            expectedState_CompletedDeletion(snippetBloc),
          ],
      tearDown: () {
        expect(snippet.child, cl1);
        expect(snippet.anyMissingParents(), false);
      });

  blocTest<SnippetBloC, SnippetState>('delete first of 3 children from MultiChildNode',
      setUp: () => test_snippet_setup(CenterNode(
              child: RowNode(children: [
            nodeTBD = TextNode(),
            TextNode(),
            TextNode(),
          ]))),
      build: () => snippetBloc,
      act: (bloc) {
        bloc.add(SnippetEvent.selectNode(node: nodeTBD, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
        // don't delete yet - just set nodeBeingDeleted
        bloc.add(const SnippetEvent.deleteNodeTapped());
        // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
        bloc.add(const SnippetEvent.completeDeletion());
      },
      expect: () => <SnippetState>[
            expectedState_SelectedNode(snippetBloc, nodeTBD),
            expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
            expectedState_CompletedDeletion(snippetBloc),
          ],
      tearDown: () {
        expect(snippet.child, isA<CenterNode>());
        expect(snippet.anyMissingParents(), false);
      });

  blocTest<SnippetBloC, SnippetState>('delete last of 3 children from MultiChildNode',
      setUp: () => test_snippet_setup(CenterNode(
              child: RowNode(children: [
            TextNode(),
            TextNode(),
            nodeTBD = TextNode(),
          ]))),
      build: () => snippetBloc,
      act: (bloc) {
        bloc.add(SnippetEvent.selectNode(node: nodeTBD, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
        // don't delete yet - just set nodeBeingDeleted
        bloc.add(const SnippetEvent.deleteNodeTapped());
        // // delete the textNode, which will cause a Placeholder to be appended to the root (root must always have a child)
        bloc.add(const SnippetEvent.completeDeletion());
      },
      expect: () => <SnippetState>[
            expectedState_SelectedNode(snippetBloc, nodeTBD),
            expectedState_NodeBeingDeleted(snippetBloc, nodeTBD),
            expectedState_CompletedDeletion(snippetBloc),
          ],
      tearDown: () {
        expect(snippet.child, isA<CenterNode>());
        expect(snippet.anyMissingParents(), false);
      });
  // blocTest<SnippetBloC, SnippetState>(
  //   'empty snippet: append a ChildlessNode, then delete it',
  //   build: () => SnippetBloC(rootNode: emptySnippet, treeC: emptyTreeC, treeUR: ur),
  //   act: (bloc) {
  //     // select the root node
  //     bloc.add(SnippetEvent.selectNode(
  //       node: emptySnippet,
  //       showProperties: false,
  //       selectedWidgetGK: selectedWidgetGK,
  //       selectedTreeNodeGK: selectedTreeNodeGK,
  //     ));
  //     // append a text node
  //     bloc.add(const SnippetEvent.appendChild(type: TextNode));
  //     // delete it
  //     bloc.add(const SnippetEvent.deleteNodeTapped());
  //   },
  //   skip: 2,
  //   expect: () => [
  //     const TypeMatcher<SnippetState>()
  //       ..having((state) => state.selectedNode, 'selectedNode after delete should be null', isNull)
  //       ..having((state) => emptySnippet.child, 'parent', isNull)
  //   ],
  // );
  //
  // blocTest<SnippetBloC, SnippetState>(
  //   'empty snippet: append a SingleChildNode, append a TextNode',
  //   build: () => SnippetBloC(rootNode: emptySnippet, treeC: emptyTreeC, treeUR: ur),
  //   act: (bloc) {
  //     // select the root node
  //     bloc.add(SnippetEvent.selectNode(
  //       node: emptySnippet,
  //       showProperties: false,
  //       selectedWidgetGK: selectedWidgetGK,
  //       selectedTreeNodeGK: selectedTreeNodeGK,
  //     ));
  //     // append a Center node
  //     bloc.add(const SnippetEvent.appendChild(type: CenterNode));
  //     // append a text node to the Center node
  //     bloc.add(const SnippetEvent.appendChild(type: TextNode));
  //     // delete it
  //     bloc.add(const SnippetEvent.deleteNodeTapped());
  //   },
  //   skip: 2,
  //   expect: () => [
  //     const TypeMatcher<SnippetState>()
  //       ..having((state) => state.selectedNode, 'selectedNode after delete should be null', isNull)
  //       ..having((state) => emptySnippet.child, 'parent', isNull)
  //   ],
  // );

  // tearDown() runs after each test in the suite
  tearDown(() {
    // print('\nTearing down resources after a test...');
  });

  // tearDownAll() runs once after all tests in the suite
  tearDownAll(() {
    // print('\nTearing down common resources...');
  });
}
