@GenerateNiceMocks([
  MockSpec<IModelRepository>(as: #MockModelRepository),
])
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pretty_json/pretty_json.dart';

import 'snippet_bloc_test.mocks.dart';

void main() {
  late MockModelRepository mockRepository;
  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';
  late STreeNode firstTabViewNode;

  setUp(() {
    mockRepository = MockModelRepository();
    when(mockRepository.getCAPIModel(appName: appName)).thenAnswer((_) async {
      final scaffoldWithTabs = SnippetRootNode(
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
      final snippetJson = scaffoldWithTabs.toJson();
      CAPIModel model = CAPIModel(appName: appName, snippetEncodedJsons: {snippetName: snippetJson});
      String encodedModelJsonS = model.toJson().toString();
      return (model, encodedModelJsonS);
    });
  });

  test('read the model from the repo', () async {
    final result = await mockRepository.getCAPIModel(appName: appName);
    final model = result.$1;
    final encodedModelJson = result.$2;

    expect(model?.appName, appName);

    Map<String, SnippetRootNode> snippetMap = MaterialSPAState.parseSnippetJsons(model!);

    expect(snippetMap.values.first.name, snippetName);

    printPrettyJson(model?.toJson(), indent: 2);
  });
}
