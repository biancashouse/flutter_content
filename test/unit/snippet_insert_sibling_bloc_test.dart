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
  late SnippetRootNode snippetWithScaffoldAnd2Tabs;

  late TextNode cl1;
  late TextNode cl2;
  late TextNode cl3;
  late RowNode mc1;
  late TabBarNode tb1, tb2;
  late TabBarViewNode tbv1, tbv2;
  late STreeNode selPl;

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
    snippetWithScaffoldAnd2Tabs = SnippetRootNode(
      name: 'test-snippet-2',
      child: ScaffoldNode(
        appBar: AppBarNode(
          title: GenericSingleChildNode(
              propertyName: 'title', child: TextNode(text: 'my title')),
          bottom: GenericSingleChildNode(
            propertyName: 'bottom',
            child: tb2 = TabBarNode(
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
              PlaceholderNode(
                  centredLabel: 'page 1', colorValue: Colors.yellow.value),
              selPl = PlaceholderNode(
                  centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
            ],
          ),
        ),
      ),
    );
  });

  void test_snippet_setup(STreeNode child, {STreeNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)
      ..validateTree();
    treeC = SnippetTreeController(
        roots: [snippet], childrenProvider: Node.snippetTreeChildrenProvider);
    CAPIBloC = CAPIBloC(rootNode: snippet, treeC: treeC, treeUR: ur);
    selectedState = CAPIBloC.state;
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

  blocTest<CAPIBloC, CAPIState>(
    'insert TextNode before first sibling',
    setUp: () =>
        test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl1),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.addSiblingBefore(type: TextNode));
    },
    skip: 1,
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(mc1.children.first, isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'insert TextNode after first sibling',
    setUp: () =>
        test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl1),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.addSiblingAfter(type: TextNode));
    },
    skip: 1,
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(mc1.children[1], isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'insert TextNode after last sibling',
    setUp: () =>
        test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl3),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.addSiblingAfter(type: TextNode));
    },
    skip: 1,
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(mc1.children.last, isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'insert TextNode before last sibling',
    setUp: () =>
        test_snippet_setup(mc1..children = [cl1, cl2, cl3], select: cl3),
    build: () => CAPIBloC,
    seed: () => selectedState,
    act: (bloc) {
      bloc.add(const CAPIEvent.addSiblingBefore(type: TextNode));
    },
    skip: 1,
    expect: () => <CAPIState>[],
    verify: (bloc) {
      expect(mc1.children[2], isA<TextNode>());
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'insert a 3rd tab between the 2 existing ones',
    setUp: () => test_snippet_setup(snippetWithScaffoldAnd2Tabs),
    build: () => CAPIBloC,
    // seed: () => selectedState,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(
          node: selPl,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const CAPIEvent.addSiblingBefore(type: SizedBoxNode));
      bloc.add(const CAPIEvent.appendChild(type: ContainerNode));
    },
    verify: (bloc) {
      expect(selPl, isA<PlaceholderNode>());
      expect(selPl.parent, isNotNull);
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<SizedBoxNode>());
      expect(tbv1.children[2], isA<PlaceholderNode>());
      expect(tb2.children.length, tbv1.children.length);
      expect(snippet.anyMissingParents(), false);
    },
  );

  blocTest<CAPIBloC, CAPIState>(
    'insert 3rd tab view after existing ones',
    setUp: () => test_snippet_setup(snippetWithScaffoldAnd2Tabs),
    build: () => CAPIBloC,
    act: (bloc) {
      bloc.add(CAPIEvent.selectNode(
          node: selPl,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK));
      bloc.add(const CAPIEvent.addSiblingAfter(type: SizedBoxNode));
      bloc.add(const CAPIEvent.appendChild(type: ContainerNode));
    },
    verify: (bloc) {
      expect(selPl, isA<PlaceholderNode>());
      expect(tbv1.children[0], isA<PlaceholderNode>());
      expect(tbv1.children[1], isA<PlaceholderNode>());
      expect(tbv1.children[2], isA<SizedBoxNode>());
      expect(tb2.children.length, tbv1.children.length);
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
