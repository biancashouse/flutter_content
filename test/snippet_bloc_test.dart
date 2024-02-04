@GenerateNiceMocks([
  MockSpec<IModelRepository>(as: #MockModelRepository),
])
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pretty_json/pretty_json.dart';
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
  late STreeNode firstTabViewNode;
  late STreeNode? columnNode;
  STreeNode? paddingNode = PaddingNode();
  STreeNode? firstTextNode = TextNode();
  STreeNode? secondTextNode = TextNode();
  STreeNode? firstSizedBoxNode = SizedBoxNode();
  STreeNode? secondSizedBoxNode = SizedBoxNode();
  final testSnippet = SnippetRootNode(
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

  setUp(() {
    mockRepository = MockModelRepository();
    when(mockRepository.getCAPIModel(appName: appName)).thenAnswer((_) async {
      final testSnippetJson = testSnippet.toJson();
      CAPIModel model = CAPIModel(appName: appName, snippetEncodedJsons: {snippetName: testSnippetJson});
      String encodedModelJsonS = model.toJson().toString();
      return (model, encodedModelJsonS);
    });
    SnippetTreeController newTreeC() => SnippetTreeController(
          roots: [testSnippet],
          childrenProvider: Node.snippetTreeChildrenProvider,
        );
    snippetBloc = SnippetBloC(rootNode: testSnippet, treeC: newTreeC(), treeUR: SnippetTreeUR());
    snippetState = snippetBloc.state;
  });

  group("Test tree structure changes to snippet 'scaffold-with-tabs'", () {
    // --- repo test
    test('read the model from the repo', () async {
      final result = await mockRepository.getCAPIModel(appName: appName);
      final model = result.$1;
      final encodedModelJson = result.$2;

      expect(model?.appName, appName);

      Map<String, SnippetRootNode> snippetMap = MaterialSPAState.parseSnippetJsons(model!);

      SnippetRootNode rootNode = snippetMap.values.first;
      expect(rootNode.name, snippetName);

      //printPrettyJson(rootNode.toMap(), indent: 2);
    });
    // --- selection node test
    blocTest<SnippetBloC, SnippetState>(
      'select a node',
      build: () => snippetBloc,
      act: (bloc) => bloc.add(SnippetEvent.selectNode(
        node: firstTabViewNode,
        showProperties: false,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      )),
      //skip: 1,
      expect: () => <SnippetState>[
        snippetState.copyWith(
          selectedNode: firstTabViewNode,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        ),
      ],
    );
    // --- append ColumnNode test to TabViewNode
    blocTest<SnippetBloC, SnippetState>(
      'append a child ColumnNode to a TabViewNode',
      build: () => snippetBloc,
      act: (bloc) => bloc.add(SnippetEvent.appendChild(
        selectedNode: firstTabViewNode,
        type: ColumnNode,
      )),
      expect: () => [
        const TypeMatcher<SnippetState>()
          ..having((state) => state.selectedNode, 'selectedNode type', isA<ColumnNode>())
          // ..having((state) => state.selectedNode?.parent, 'parent', isNotNull)
          ..having((state) => state.selectedNode?.parent, 'parent', equals(firstTabViewNode))
      ],
    );
    // --- append node test to a ColumnNode
    blocTest<SnippetBloC, SnippetState>(
      'append a TextNode to columnNode',
      build: () => snippetBloc,
      seed: () => snippetState.copyWith(
        selectedNode: firstTabViewNode,
        selectedWidgetGK: selectedWidgetGK,
        selectedTreeNodeGK: selectedTreeNodeGK,
      ),
      act: (bloc) {
        bloc.add(SnippetEvent.appendChild(
          selectedNode: firstTabViewNode,
          type: ColumnNode,
        ));
        if (bloc.aNodeIsSelected) {
          bloc.add(
            SnippetEvent.appendChild(
              selectedNode: snippetBloc.state.selectedNode!,
              type: TextNode,
            ),
          );
        } else
          print("selection nul!");
      },
      skip: 1,
      expect: () => [
        const TypeMatcher<SnippetState>()..having((state) => state.selectedNode, 'selectedNode type', isA<TextNode>())
        // ..having((state) => state.selectedNode?.parent, 'parent', equals(columnNode))
      ],
    );
  });
}