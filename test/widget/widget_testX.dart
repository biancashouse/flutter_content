import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_test/flutter_test.dart';

import '../unit_test.mocks.dart';

// class MockCAPIBloC extends MockBloc<CAPIEvent, CAPIState> implements CAPIBloC {}

void main() {
  late MockModelRepository mockRepository;
  // sample data -----------
  SnippetRootNode emptySnippetRoot = SnippetPanel.createSnippetFromTemplateNodes(
      SnippetTemplate.empty, 'empty_snippet');
  late STreeNode firstTabViewNode;
  late STreeNode? columnNode;
  const appName = 'flutter-content-widget-test';
  const snippetName = 'scaffold-with-tabs';
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
  final selectedWidgetGK = GlobalKey(debugLabel: 'selectedWidgetGK');
  final selectedTreeNodeGK = GlobalKey(debugLabel: 'selectedTreeNodeGK');
  // final mockCapiBloc = MockCAPIBloC()..add(const CAPIEvent.appStarted());
  // sample data -----------
  setUpAll(() {
    mockRepository = MockModelRepository();
    // when(mockRepository.getCAPIModel(
    //   branchName: 'testing',
    //   modelVersion: TEST_VERSION_ID,
    // )).thenAnswer((_) async {
    //   final modelSnippetJson = modelSnippetRoot.toJson();
    //   return CAPIModel(
    //       snippetEncodedJsons: {snippetName: modelSnippetJson});
    // });
    // snippetState = snippetBloc.state;
    // FC().init(capiBloc: mockCapiBloc, snippetsMap: {snippetName: modelSnippetRoot}, namedStyles: {});
    // GetIt.I.registerSingleton<CAPIBloC>(mockCapiBloc);
  });

  testWidgets('Flutter Content widget test', (WidgetTester tester) async {
    // Create a mock instance https://pub.dev/packages/bloc_test

    // whenListen(
    //   mockCapiBloc,
    //   Stream.fromIterable(
    //     const [
    //      ],
    //   ),
    //   // initialState: const LatestRaceWinnersInitial(),
    // );

    // // Assert that the initial state is correct.
    // expect(mockCapiBloc.state, equals(0));
    //
    // // Assert that the stubbed stream is emitted.
    // await expectLater(mockCapiBloc.stream, emitsInOrder(<int>[0, 1, 2, 3]));
    //
    // // Assert that the current state is in sync with the stubbed stream.
    // expect(mockCapiBloc.state, equals(3));

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialSPA(
        appName: 'flutter-content-widget-test',
        testModelRepo: mockRepository,
        testWidget: FlutterContentPage(
            pageName: "my-panel",
            snippetName: SnippetTemplate.scaffold_with_tabs.name),
        materialAppThemeF: () => ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: FUCHSIA_X,
          primarySwatch: Colors.purple,
        ),
      ),
    );

    expect(find.byType(MaterialSPA), findsOneWidget);
    expect(find.byType(FlutterContentPage), findsOneWidget);

    BuildContext context = tester.element(find.byType(FlutterContentPage));

    // await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // expect(find.byType(Center), findsOneWidget);

    // Verify that our counter starts at 0.
    // expect(find.text('my title'), findsOneWidget);

    // // Tap the '+' icon and trigger a frame.
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
