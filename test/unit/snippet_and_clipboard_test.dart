// ignore_for_file: non_constant_identifier_names
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:flutter_test/flutter_test.dart';

import '../unit_test.dart';
import '../unit_test.mocks.dart';

void main() {
  late MockModelRepository mockRepo;
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

  // sample data -----------
  SnippetRootNode emptySnippetRoot =
      SnippetTemplateEnum.empty.templateSnippet();
  late SNode firstTabViewNode;
  late SNode? columnNode;
  SNode? paddingNode = PaddingNode();
  SNode? firstTextNode = TextNode();
  SNode? secondTextNode = TextNode();
  SNode? firstSizedBoxNode = SizedBoxNode();
  SNode? secondSizedBoxNode = SizedBoxNode();

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
            name: 'tabbar1',
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
          tabBarName: 'tabbar1',
          children: [
            firstTabViewNode = PlaceholderNode(),
            PlaceholderNode(),
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
        parentProvider: Node.snippetTreeParentProvider,
      );

  void test_snippet_setup(SNode child, {SNode? select}) {
    snippet = SnippetRootNode(name: 'test-snippet', child: child)
      ..validateTree();

    capiBloc = CAPIBloC(
      modelRepo: setupMockRepo(),
      mockSnippetBeingEdited: SnippetBeingEdited(
        // rootNode: snippet,
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

  setUp(() {
    return Future(() async {
      scaffoldAnd2TabsAndStepper = ScaffoldNode(
        appBar: AppBarNode(
          title: GenericSingleChildNode(
              propertyName: 'title', child: TextNode(text: 'my title')),
          bottom: GenericSingleChildNode(
            propertyName: 'bottom',
            child: selTabBar = TabBarNode(
              name: 'who cares',
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
            tabBarName: 'who cares',
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
              PlaceholderNode(),
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
      SNode? searchResult = treeC.findNodeTypeInTree(rootNode, TextNode);
      expect(searchResult, isNotNull);
      expect(searchResult is TextNode, isTrue);
      expect((searchResult as TextNode?)?.text, 'my title');

      //printPrettyJson(rootNode.toMap(), indent: 2);
    });
    // --- selection node test
    blocTest<CAPIBloC, CAPIState>(
      'select a node',
      build: () => capiBloc = CAPIBloC(
        modelRepo: setupMockRepo(),
        mockSnippetBeingEdited: SnippetBeingEdited(
          // rootNode: modelSnippetRoot,
          treeC: newTreeC(modelSnippetRoot),
          selectedNode: null,
          nodeBeingDeleted: null,
          jsonBeforeAnyChange: '{}',
        ),
      ),
      act: (bloc) => bloc.add(CAPIEvent.selectNode(
        node: firstTabViewNode,
      )),
      //skip: 1,
      expect: () => <CAPIState>[
        capiBloc.state.copyWith(
          snippetBeingEdited: SnippetBeingEdited(
            selectedNode: firstTabViewNode,
            showProperties: false,
            nodeBeingDeleted: null,
            // rootNode: capiBloc.state.snippetBeingEdited!.rootNode,
            treeC: capiBloc.state.snippetBeingEdited!.treeC,
            jsonBeforeAnyChange: '',
          ),
        ),
      ],
    );
    // --- append TextNode to snippet root
    blocTest<CAPIBloC, CAPIState>(
      'append a child ColumnNode to a TabViewNode',
      build: () => capiBloc = CAPIBloC(
        modelRepo: setupMockRepo(),
        mockSnippetBeingEdited: SnippetBeingEdited(
          // rootNode: emptySnippetRoot,
          treeC: newTreeC(emptySnippetRoot),
          selectedNode: null,
          nodeBeingDeleted: null,
          jsonBeforeAnyChange: '{}',
        ),
      ),
      act: (bloc) {
        bloc.add(
          CAPIEvent.selectNode(
            node: emptySnippetRoot,
          ),
        );
        bloc.add(const CAPIEvent.appendChild(type: TextNode));
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<CAPIState>()
          ..having((state) => state.snippetBeingEdited?.selectedNode,
              'selectedNode type', isA<TextNode>())
          ..having(
              (state) => state.snippetBeingEdited?.selectedNode?.getParent(),
              'parent',
              isNotNull)
          ..having(
              (state) => state.snippetBeingEdited?.selectedNode?.getParent(),
              'parent',
              equals(firstTabViewNode))
      ],
    );
    // --- append node test to a ColumnNode
    blocTest<CAPIBloC, CAPIState>(
      'append a TextNode to columnNode',
      build: () => capiBloc = CAPIBloC(
        modelRepo: setupMockRepo(),
        mockSnippetBeingEdited: SnippetBeingEdited(
          // rootNode: emptySnippetRoot,
          treeC: newTreeC(emptySnippetRoot),
          selectedNode: null,
          nodeBeingDeleted: null,
          jsonBeforeAnyChange: '{}',
        ),
      ),
      seed: () => capiBloc.state.copyWith(
        snippetBeingEdited: SnippetBeingEdited(
          selectedNode: firstTabViewNode,
          showProperties: false,
          nodeBeingDeleted: null,
          // rootNode: capiBloc.state.snippetBeingEdited!.rootNode,
          treeC: capiBloc.state.snippetBeingEdited!.treeC,
          jsonBeforeAnyChange: '',
        ),
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
          fco.logger.w("selection nul!");
        }
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<CAPIState>()
          ..having((state) => state.snippetBeingEdited?.selectedNode,
              'selectedNode type', isA<TextNode>())
          ..having(
              (state) => state.snippetBeingEdited?.selectedNode?.getParent(),
              'parent',
              isA<ColumnNode>())
      ],
    );
  });

  group("Test snippet Cut, Copy and Paste'", () {
    // --- append node test to a ColumnNode
    blocTest<CAPIBloC, CAPIState>(
      'append a TextNode to columnNode',
      build: () => capiBloc = CAPIBloC(
        modelRepo: setupMockRepo(),
        mockSnippetBeingEdited: SnippetBeingEdited(
          // rootNode: emptySnippetRoot,
          treeC: newTreeC(emptySnippetRoot),
          selectedNode: null,
          nodeBeingDeleted: null,
          jsonBeforeAnyChange: '{}',
        ),
      ),
      seed: () => capiBloc.state.copyWith(
        snippetBeingEdited: SnippetBeingEdited(
          selectedNode: firstTabViewNode,
          showProperties: false,
          nodeBeingDeleted: null,
          // rootNode: capiBloc.state.snippetBeingEdited!.rootNode,
          treeC: capiBloc.state.snippetBeingEdited!.treeC,
          jsonBeforeAnyChange: '',
        ),
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
          fco.logger.w("selection nul!");
        }
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<CAPIState>()
          ..having((state) => state.snippetBeingEdited?.selectedNode,
              'selectedNode type', isA<TextNode>())
          ..having(
              (state) => state.snippetBeingEdited?.selectedNode?.getParent(),
              'parent',
              isA<ColumnNode>())
      ],
    );

    blocTest<CAPIBloC, CAPIState>(
      'cut 3rd step and insert as first step',
      setUp: () => test_snippet_setup(scaffoldAnd2TabsAndStepper),
      build: () => capiBloc,
      act: (bloc) {
        bloc.add(CAPIEvent.cutNode(
          node: step3,
          scName: '',
          skipSave: true,
        ));
        bloc.add(CAPIEvent.selectNode(node: step1));
        bloc.add(const CAPIEvent.pasteSiblingBefore());
      },
      skip: 3,
      verify: (bloc) {
        expect((stepper1.children[0] as StepNode).title.propertyName, "title3");
        expect((stepper1.children[0] as StepNode).getParent(), isNotNull);
        expect((stepper1.children[1] as StepNode).title.propertyName, "title1");
        expect((stepper1.children[1] as StepNode).getParent(), isNotNull);
        expect((stepper1.children[2] as StepNode).title.propertyName, "title2");
        expect((stepper1.children[2] as StepNode).getParent(), isNotNull);
        expect(stepper1.children.length, 3);
        expect(snippet.anyMissingParents(), false);
      },
    );
  });
}
