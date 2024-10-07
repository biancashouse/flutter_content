// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SnippetRootNode emptySnippet;
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late CAPIBloC capiBloc;
  late STreeNode placeholderNode;
  late STreeNode nodeTBD;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  // final ur = SnippetTreeUR();
  final textNode = TextNode(text: 'abc');

  // setupAll() runs once before any test in the suite
  setUpAll(() async {
    // print('Setting up common resources...');
  });

  test('snippet comprises just a placeholder node', () async {
    expect(SnippetTemplateEnum.empty.templateSnippet().child, isA<PlaceholderNode>());
    // printPrettyJson(rootNode.toMap(), indent: 2);
  });

  // tearDown() runs after each test in the suite
  tearDown(() {
    // print('\nTearing down resources after a test...');
  });

  // tearDownAll() runs once after all tests in the suite
  tearDownAll(() {
    // print('\nTearing down common resources...');
  });
}
