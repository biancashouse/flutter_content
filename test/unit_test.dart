@GenerateNiceMocks([
  MockSpec<IModelRepository>(as: #MockModelRepository),
])
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';


void main() {
  late MockModelRepository mockRepository;
  const appName = 'flutter-content-test-app';
  const snippetName = 'scaffold-with-tabs';
  late SnippetPanel snippetPanel;

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
                  PlaceholderNode(centredLabel: 'page 1', colorValue: Colors.yellow.value),
                  PlaceholderNode(centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
                ],
              ),
            ),
          ),
        ),
      );
      final snippetJson = scaffoldWithTabs.toJson();
      return CAPIModel(appName: appName, snippetEncodedJsons: {snippetName: snippetJson});
    });
    snippetPanel = SnippetPanel(panelName: "test-panel", snippetName: snippetName);
  });

  test('read the model from the repo', () async {
    final model = await mockRepository.getCAPIModel(appName: appName);

    expect(model!.appName, appName);

    Map<String, SnippetRootNode> snippetMap = MaterialSPAState.parseSnippetJsons(model);

    expect(snippetMap.values.first.name, snippetName);

    // expect(snippetPanel != null, isTrue);
  });
}
