// ignore_for_file: non_constant_identifier_names
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_test/flutter_test.dart';

import '../unit_test.dart';
import '../unit_test.mocks.dart';

void main() {
  late MockModelRepository mockRepository;
  late CAPIBloC capiBloc;
  late SnippetRootNode snippet;
  late SnippetTreeController treeC;
  late CAPIState selectedState;
  late Map<String, dynamic> encodedSnippetMapJson;
  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';
  late ScaffoldNode scaffoldAnd2TabsAndStepper;
  late TabBarNode selTabBar;
  late TabBarViewNode selTabBarView;
  late TextNode selText;
  late StepperNode stepper1;
  late StepNode step1, step2, step3;

  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  // final ur = SnippetTreeUR();

  // sample data -----------
  SnippetRootNode emptySnippetRoot = SnippetPanel.createSnippetFromTemplateNodes(
    SnippetTemplateEnum.empty,
    'some-name',
  );
  late STreeNode firstTabViewNode;
  late STreeNode? columnNode;
  STreeNode? paddingNode = PaddingNode();
  STreeNode? firstTextNode = TextNode();
  STreeNode? secondTextNode = TextNode();
  STreeNode? firstSizedBoxNode = SizedBoxNode();
  STreeNode? secondSizedBoxNode = SizedBoxNode();

  final modelSnippetRoot = SnippetRootNode(
    name: snippetName,
    child: ScaffoldNode(
      appBar: AppBarNode(
        bgColorValue: Colors.black.value,
        title: GenericSingleChildNode(
            propertyName: 'title', child: TextNode(text: 'my title')),
        bottom: GenericSingleChildNode(
          propertyName: 'bottom',
          child: TabBarNode(
            children: [
              TextNode(text: 'tab 1'),
              TextNode(text: 'Tab 2'),
            ],
          ),
        ),
      ),
      body: GenericSingleChildNode(
        propertyName: 'body',
        child: TabBarViewNode(
          children: [
            firstTabViewNode = PlaceholderNode(
                centredLabel: 'page 1', colorValue: Colors.yellow.value),
            PlaceholderNode(
                centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
          ],
        ),
      ),
    ),
  );

  // sample data -----------
  SnippetTreeController newTreeC(SnippetRootNode rootNode) =>
      SnippetTreeController(
        roots: [rootNode],
        childrenProvider: Node.snippetTreeChildrenProvider,
      );

  void test_snippet_setup(STreeNode child, {STreeNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)
      ..validateTree();
    treeC = SnippetTreeController(
        roots: [snippet], childrenProvider: Node.snippetTreeChildrenProvider);
    CAPIBloC = CAPIBloC(
      rootNode: snippet, treeC: treeC,
      // treeUR: ur
    );
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

  setUp(() {
    return Future(() async {
      scaffoldAnd2TabsAndStepper = ScaffoldNode(
        appBar: AppBarNode(
          title: GenericSingleChildNode(
              propertyName: 'title', child: TextNode(text: 'my title')),
          bottom: GenericSingleChildNode(
            propertyName: 'bottom',
            child: selTabBar = TabBarNode(
              children: [
                selText = TextNode(text: 'Stepper Tab'),
                TextNode(text: 'Tab 2'),
              ],
            ),
          ),
        ),
        body: GenericSingleChildNode(
          propertyName: 'body',
          child: selTabBarView = TabBarViewNode(
            children: [
              stepper1 = StepperNode(children: [
                step1 = StepNode(
                    title: GenericSingleChildNode(
                      propertyName: 'title1',
                      child: ContainerNode(),
                    ),
                    content: GenericSingleChildNode(
                      propertyName: 'content',
                      child: ContainerNode(),
                    )),
                step2 = StepNode(
                    title: GenericSingleChildNode(
                      propertyName: 'title2',
                      child: ContainerNode(),
                    ),
                    content: GenericSingleChildNode(
                      propertyName: 'content',
                      child: ContainerNode(),
                    )),
                step3 = StepNode(
                    title: GenericSingleChildNode(
                      propertyName: 'title3',
                      child: ContainerNode(),
                    ),
                    content: GenericSingleChildNode(
                      propertyName: 'content',
                      child: ContainerNode(),
                    )),
              ]),
              PlaceholderNode(
                  centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
            ],
          ),
        ),
      );
    });
  });

  group("Test tree structure changes to snippet 'scaffold-with-tabs'", () {
    // --- repo test
    test('read the model from the repo, and find 1st TextNode', () async {

      SnippetRootNode rootNode = modelSnippetRoot;
      expect(rootNode.name, snippetName);

      SnippetTreeController treeC = newTreeC(rootNode);
      STreeNode? searchResult = treeC.findNodeTypeInTree(rootNode, TextNode);
      expect(searchResult, isNotNull);
      expect(searchResult is TextNode, isTrue);
      expect((searchResult as TextNode?)?.text, 'my title');

      //printPrettyJson(rootNode.toMap(), indent: 2);
    });
    // --- selection node test
    blocTest<CAPIBloC, CAPIState>(
      'select a node',
      build: () => CAPIBloC = CAPIBloC(
        rootNode: modelSnippetRoot,
        treeC: newTreeC(modelSnippetRoot),
        // treeUR: SnippetTreeUR()
      ),
      act: (bloc) => bloc.add(CAPIEvent.selectNode(
        node: firstTabViewNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      )),
      //skip: 1,
      expect: () => <CAPIState>[
        CAPIBloC.state.copyWith(
          selectedNode: firstTabViewNode,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        ),
      ],
    );
    // --- append TextNode to snippet root
    blocTest<CAPIBloC, CAPIState>(
      'append a child ColumnNode to a TabViewNode',
      build: () => CAPIBloC(
        rootNode: emptySnippetRoot,
        treeC: newTreeC(emptySnippetRoot),
        // treeUR: SnippetTreeUR()
      ),
      act: (bloc) {
        bloc.add(
          CAPIEvent.selectNode(
            node: emptySnippetRoot,
            selectedWidgetGK: selectedWidgetGK,
            selectedTreeNodeGK: selectedTreeNodeGK,
          ),
        );
        bloc.add(const CAPIEvent.appendChild(type: TextNode));
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<CAPIState>()
          ..having((state) => state.selectedNode, 'selectedNode type',
              isA<TextNode>())
          ..having((state) => state.selectedNode?.parent, 'parent', isNotNull)
          ..having((state) => state.selectedNode?.parent, 'parent',
              equals(firstTabViewNode))
      ],
    );
    // --- append node test to a ColumnNode
    blocTest<CAPIBloC, CAPIState>(
      'append a TextNode to columnNode',
      build: () => CAPIBloC(
        rootNode: emptySnippetRoot,
        treeC: newTreeC(emptySnippetRoot),
        // treeUR: SnippetTreeUR()
      ),
      seed: () => CAPIBloC.state.copyWith(
        selectedNode: firstTabViewNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      ),
      act: (bloc) {
        bloc.add(const CAPIEvent.appendChild(
          type: ColumnNode,
        ));
        if (bloc.aNodeIsSelected) {
          bloc.add(
            const CAPIEvent.appendChild(
              type: TextNode,
            ),
          );
        } else {
          print("selection nul!");
        }
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<CAPIState>()
          ..having((state) => state.selectedNode, 'selectedNode type',
              isA<TextNode>())
          ..having((state) => state.selectedNode?.parent, 'parent',
              isA<ColumnNode>())
      ],
    );
  });

  group("Test snippet Cut, Copy and Paste'", () {
    // --- append node test to a ColumnNode
    blocTest<CAPIBloC, CAPIState>(
      'append a TextNode to columnNode',
      build: () => CAPIBloC(
        rootNode: emptySnippetRoot,
        treeC: newTreeC(emptySnippetRoot),
        // treeUR: SnippetTreeUR()
      ),
      seed: () => CAPIBloC.state.copyWith(
        selectedNode: firstTabViewNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      ),
      act: (bloc) {
        bloc.add(const CAPIEvent.appendChild(
          type: ColumnNode,
        ));
        if (bloc.aNodeIsSelected) {
          bloc.add(
            const CAPIEvent.appendChild(
              type: TextNode,
            ),
          );
        } else {
          print("selection nul!");
        }
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<CAPIState>()
          ..having((state) => state.selectedNode, 'selectedNode type',
              isA<TextNode>())
          ..having((state) => state.selectedNode?.parent, 'parent',
              isA<ColumnNode>())
      ],
    );

    blocTest<CAPIBloC, CAPIState>(
      'cut 3rd step and insert as first step',
      setUp: () => test_snippet_setup(scaffoldAnd2TabsAndStepper),
      build: () => CAPIBloC,
      act: (bloc) {
        bloc.add(CAPIEvent.cutNode(
          node: step3,
          CAPIBloC: getMockCAPIBloC(repo),
          skipSave: true,
        ));
        bloc.add(CAPIEvent.selectNode(
            node: step1,
            selectedWidgetGK: selectedWidgetGK,
            selectedTreeNodeGK: selectedTreeNodeGK));
        bloc.add(const CAPIEvent.pasteSiblingBefore());
      },
      skip: 3,
      verify: (bloc) {
        expect((stepper1.children[0] as StepNode).title.propertyName, "title3");
        expect((stepper1.children[0] as StepNode).parent, isNotNull);
        expect((stepper1.children[1] as StepNode).title.propertyName, "title1");
        expect((stepper1.children[1] as StepNode).parent, isNotNull);
        expect((stepper1.children[2] as StepNode).title.propertyName, "title2");
        expect((stepper1.children[2] as StepNode).parent, isNotNull);
        expect(stepper1.children.length, 3);
        expect(snippet.anyMissingParents(), false);
      },
    );
  });
}
