@GenerateNiceMocks([
  MockSpec<IModelRepository>(as: #MockModelRepository),
  MockSpec<CAPIBloC>(as: #MockCAPIBloC),
])
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'snippet_bloc_test.mocks.dart';

void main() {
  late MockModelRepository mockRepository;
  late CAPIModel model;
  late Map<String, dynamic> encodedModelJson;
  late SnippetBloC snippetBloc;
  late SnippetState snippetState;
  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';
  // sample data -----------
  SnippetRootNode emptySnippetRoot = SnippetPanel.getTemplate(SnippetTemplate.empty_snippet);
  late STreeNode firstTabViewNode;
  late STreeNode? columnNode;
  STreeNode? paddingNode = PaddingNode();
  STreeNode? firstTextNode = TextNode();
  STreeNode? secondTextNode = TextNode();
  STreeNode? firstSizedBoxNode = SizedBoxNode();
  STreeNode? secondSizedBoxNode = SizedBoxNode();
  final modelSnippetRoot = SnippetRootNode(
    name: snippetName,
    child: TransformableScaffoldNode(
      scaffold: ScaffoldNode(
        appBar: AppBarNode(
          bgColorValue: Colors.black.value,
          title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
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
              firstTabViewNode = PlaceholderNode(centredLabel: 'page 1', colorValue: Colors.yellow.value),
              PlaceholderNode(centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
            ],
          ),
        ),
      ),
    ),
  );
  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  // sample data -----------
  SnippetTreeController newTreeC(SnippetRootNode rootNode) => SnippetTreeController(
        roots: [rootNode],
        childrenProvider: Node.snippetTreeChildrenProvider,
      );
  setUp(() {
    mockRepository = MockModelRepository();
    when(mockRepository.getCAPIModel(appName: appName)).thenAnswer((_) async {
      final modelSnippetJson = modelSnippetRoot.toJson();
      CAPIModel model = CAPIModel(appName: appName, snippetEncodedJsons: {snippetName: modelSnippetJson});
      String encodedModelJsonS = model.toJson().toString();
      return model;
    });
    // snippetState = snippetBloc.state;
  });

  group("Test tree structure changes to snippet 'scaffold-with-tabs'", () {
    // --- repo test
    test('read the model from the repo, and find 1st TextNode', () async {
      final model = await mockRepository.getCAPIModel(appName: appName);

      expect(model?.appName, appName);

      Map<String, SnippetRootNode> snippetMap = MaterialSPAState.parseSnippetJsons(model!);

      SnippetRootNode rootNode = snippetMap.values.first;
      expect(rootNode.name, snippetName);

      SnippetTreeController treeC = newTreeC(rootNode);
      STreeNode? searchResult = treeC.findNodeTypeInTree(rootNode, TextNode);
      expect(searchResult, isNotNull);
      expect(searchResult is TextNode, isTrue);
      expect((searchResult as TextNode?)?.text, 'my title');

      //printPrettyJson(rootNode.toMap(), indent: 2);
    });
    // --- selection node test
    blocTest<SnippetBloC, SnippetState>(
      'select a node',
      build: () => snippetBloc = SnippetBloC(rootNode: modelSnippetRoot, treeC: newTreeC(modelSnippetRoot), treeUR: SnippetTreeUR()),
      act: (bloc) => bloc.add(SnippetEvent.selectNode(
        node: firstTabViewNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      )),
      //skip: 1,
      expect: () => <SnippetState>[
        snippetBloc.state.copyWith(
          selectedNode: firstTabViewNode,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        ),
      ],
    );
    // --- append TextNode to snippet root
    blocTest<SnippetBloC, SnippetState>(
      'append a child ColumnNode to a TabViewNode',
      build: () => SnippetBloC(rootNode: emptySnippetRoot, treeC: newTreeC(emptySnippetRoot), treeUR: SnippetTreeUR()),
      act: (bloc) {
        bloc.add(
          SnippetEvent.selectNode(
            node: emptySnippetRoot,
            selectedWidgetGK: selectedWidgetGK,
            selectedTreeNodeGK: selectedTreeNodeGK,
          ),
        );
        bloc.add(const SnippetEvent.appendChild(type: TextNode));
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<SnippetState>()
          ..having((state) => state.selectedNode, 'selectedNode type', isA<TextNode>())
          ..having((state) => state.selectedNode?.parent, 'parent', isNotNull)
          ..having((state) => state.selectedNode?.parent, 'parent', equals(firstTabViewNode))
      ],
    );
    // --- append node test to a ColumnNode
    blocTest<SnippetBloC, SnippetState>(
      'append a TextNode to columnNode',
      build: () => snippetBloc = snippetBloc,
      seed: () => snippetBloc.state.copyWith(
        selectedNode: firstTabViewNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      ),
      act: (bloc) {
        bloc.add(const SnippetEvent.appendChild(
          type: ColumnNode,
        ));
        if (bloc.aNodeIsSelected) {
          bloc.add(
            const SnippetEvent.appendChild(
              type: TextNode,
            ),
          );
        } else
          print("selection nul!");
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<SnippetState>()
          ..having((state) => state.selectedNode, 'selectedNode type', isA<TextNode>())
          ..having((state) => state.selectedNode?.parent, 'parent', isA<ColumnNode>())
      ],
    );
    group("replaceWith tests", () {
      blocTest<SnippetBloC, SnippetState>(
        'SingleChild replaceWith',
        build: () => snippetBloc,
        seed: () => snippetBloc.state.copyWith(
          selectedNode: firstTabViewNode,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        ),
        act: (bloc) {
          bloc.add(const SnippetEvent.replaceSelectionWith(
            type: SizedBoxNode,
          ));
        },
        expect: () => [
          const TypeMatcher<SnippetState>()
            ..having((state) => state.selectedNode, 'selectedNode type', isA<SizedBoxNode>())
            ..having((state) => state.selectedNode?.parent, 'parent', isA<TabBarViewNode>())
        ],
      );
      blocTest<SnippetBloC, SnippetState>(
        'MultiChild replaceWith',
        build: () => snippetBloc,
        seed: () => snippetBloc.state.copyWith(
          selectedNode: firstTabViewNode,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        ),
        act: (bloc) {
          bloc.add(const SnippetEvent.replaceSelectionWith(
            type: ColumnNode,
          ));
          bloc.add(const SnippetEvent.replaceSelectionWith(
            type: SizedBoxNode,
          ));
        },
        skip: 1,
        expect: () => [
          const TypeMatcher<SnippetState>()
            ..having((state) => state.selectedNode, 'selectedNode type', isA<SizedBoxNode>())
            ..having((state) => state.selectedNode?.parent, 'parent', isA<TabBarViewNode>())
        ],
      );
    });
  });
}
