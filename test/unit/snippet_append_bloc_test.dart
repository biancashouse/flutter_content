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
  late STreeNode sel;
  late TabBarNode tb1;
  late TabBarViewNode tbv1;
  late SnippetRootNode snippetWithScaffoldAnd2Tabs;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  final ur = SnippetTreeUR();

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  setUp(() {
    snippetWithScaffoldAnd2Tabs = SnippetRootNode(
      name: 'test-snippet',
      child: TransformableScaffoldNode(
        scaffold: ScaffoldNode(
          appBar: AppBarNode(
            title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
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
                PlaceholderNode(centredLabel: 'page 1', colorValue: Colors.yellow.value),
                sel = PlaceholderNode(centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
              ],
            ),
          ),
        ),
      ),
    );
  });

  void test_snippet_setup() {
    snippet = snippetWithScaffoldAnd2Tabs..setParents(null);
    treeC = SnippetTreeController(roots: [snippet], childrenProvider: Node.snippetTreeChildrenProvider);
    snippetBloc = SnippetBloC(rootNode: snippet, treeC: treeC, treeUR: ur);
  }

  blocTest<SnippetBloC, SnippetState>(
    'replace 2nd TabBarView child with a Center',
    setUp: () => test_snippet_setup(),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(node: sel, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.replaceSelectionWith(type: CenterNode));
      bloc.add(const SnippetEvent.appendChild(type: ContainerNode));
    },
    skip: 3,
    verify: (bloc) {
      expect(sel, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<CenterNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'append 3rd tab view to the TabBarView',
    setUp: () => test_snippet_setup(),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(node: tbv1, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.appendChild(type: SizedBoxNode));
      bloc.add(const SnippetEvent.appendChild(type: ContainerNode));
    },
    skip: 3,
    verify: (bloc) {
      expect(sel, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<PlaceholderNode>());
      expect(tbv1.children[2], isA<SizedBoxNode>());
      expect(bloc.state.selectedNode, isA<ContainerNode>());
      expect(tb1.children.length, 3);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<SnippetBloC, SnippetState>(
    'append 3rd tab to the TabBar',
    setUp: () => test_snippet_setup(),
    build: () => snippetBloc,
    act: (bloc) {
      bloc.add(SnippetEvent.selectNode(node: tb1, selectedWidgetGK: selectedWidgetGK, selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const SnippetEvent.appendChild(type: TextNode));
    },
    skip: 2,
    verify: (bloc) {
      expect(sel, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<PlaceholderNode>());
      expect(tbv1.children[2], isA<PlaceholderNode>());
      expect(bloc.state.selectedNode, isA<TextNode>());
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
