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

  late TextNode cl1;
  late TextNode cl2;
  late TextNode cl3;
  late RowNode mc1;

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
    mc1 = RowNode(children: []);
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

  blocTest<SnippetBloC, SnippetState>(
    'insert TextNode before first sibling',
    setUp: () => test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl1),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.addSiblingBefore(type: TextNode));
    },
    skip: 1,
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(mc1.children.first, isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'insert TextNode after first sibling',
    setUp: () => test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl1),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.addSiblingAfter(type: TextNode));
    },
    skip: 1,
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(mc1.children[1], isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'insert TextNode after last sibling',
    setUp: () => test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl3),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.addSiblingAfter(type: TextNode));
    },
    skip: 1,
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(mc1.children.last, isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'insert TextNode after last sibling',
    setUp: () => test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl3),
    build: () => snippetBloc,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const SnippetEvent.addSiblingBefore(type: TextNode));
    },
    skip: 1,
    expect: () => <SnippetState>[],
    verify: (bloc) {
      expect(mc1.children[2], isA<TextNode>());
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
