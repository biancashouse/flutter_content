import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:multi_split_view/multi_split_view.dart';

void main() => runApp(const MainApp());

const k_sampleDeltaJsonString = '''
    [
      {"insert":"A showcase app that uses Flutter to create a highly expressive user interface. Wonderous focuses on delivering an accessible and high-quality user experience while including engaging interactions and novel animations. To run Wonderous as a desktop app, clone the project and follow the instructions provided in the README."},
      {"insert":"!\\n"}
    ]
    ''';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: HomePage(),
      localizationsDelegates: [FlutterQuillLocalizations.delegate],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuillController _controller = () {
    return QuillController.basic(config: QuillControllerConfig());
  }();
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.document = Document.fromJson(
      jsonDecode(k_sampleDeltaJsonString),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quill Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.output),
            tooltip: 'Print Delta JSON to log',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'The JSON Delta has been printed to the console.',
                  ),
                ),
              );
              debugPrint(jsonEncode(_controller.document.toDelta().toJson()));
            },
          ),
        ],
      ),
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerPainter: DividerPainters.grooved1(
            color: Colors.indigo[100]!,
            highlightedColor: Colors.indigo[900]!,
          ),
        ),
        child: MultiSplitView(
          initialAreas: [
            Area(
              builder: (context, area) => Row(
                children: [
                  Expanded(
                    child: QuillEditor(
                      focusNode: _editorFocusNode,
                      scrollController: _editorScrollController,
                      controller: _controller..readOnly = true,
                      config: QuillEditorConfig(
                        placeholder: 'Start writing your notes...',
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  Container(color: Colors.red, width: 100, height: 100),
                ],
              ),
            ),
          ],
        ),
      ),

      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       QuillSimpleToolbar(
      //         controller: _controller,
      //         config: QuillSimpleToolbarConfig(
      //           showClipboardPaste: true,
      //           customButtons: [
      //             QuillToolbarCustomButtonOptions(
      //               icon: const Icon(Icons.add_alarm_rounded),
      //               onPressed: () {
      //                 _controller.document.insert(
      //                   _controller.selection.extentOffset,
      //                   TimeStampEmbed(
      //                     DateTime.now().toString(),
      //                   ),
      //                 );
      //
      //                 _controller.updateSelection(
      //                   TextSelection.collapsed(
      //                     offset: _controller.selection.extentOffset + 1,
      //                   ),
      //                   ChangeSource.local,
      //                 );
      //               },
      //             ),
      //           ],
      //           buttonOptions: QuillSimpleToolbarButtonOptions(
      //             base: QuillToolbarBaseButtonOptions(
      //               afterButtonPressed: () {
      //                 final isDesktop = {
      //                   TargetPlatform.linux,
      //                   TargetPlatform.windows,
      //                   TargetPlatform.macOS
      //                 }.contains(defaultTargetPlatform);
      //                 if (isDesktop) {
      //                   _editorFocusNode.requestFocus();
      //                 }
      //               },
      //             ),
      //             linkStyle: QuillToolbarLinkStyleButtonOptions(
      //               validateLink: (link) {
      //                 // Treats all links as valid. When launching the URL,
      //                 // `https://` is prefixed if the link is incomplete (e.g., `google.com` → `https://google.com`)
      //                 // however this happens only within the editor.
      //                 return true;
      //               },
      //             ),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: QuillEditor(
      //           focusNode: _editorFocusNode,
      //           scrollController: _editorScrollController,
      //           controller: _controller,
      //           config: QuillEditorConfig(
      //             placeholder: 'Start writing your notes...',
      //             padding: const EdgeInsets.all(16),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorScrollController.dispose();
    _editorFocusNode.dispose();
    super.dispose();
  }
}

class TimeStampEmbed extends Embeddable {
  const TimeStampEmbed(String value) : super(timeStampType, value);

  static const String timeStampType = 'timeStamp';

  static TimeStampEmbed fromDocument(Document document) =>
      TimeStampEmbed(jsonEncode(document.toDelta().toJson()));

  Document get document => Document.fromJson(jsonDecode(data));
}

class TimeStampEmbedBuilder extends EmbedBuilder {
  @override
  String get key => 'timeStamp';

  @override
  String toPlainText(Embed node) {
    return node.value.data;
  }

  @override
  Widget build(BuildContext context, EmbedContext embedContext) {
    return Row(
      children: [
        const Icon(Icons.access_time_rounded),
        Text(embedContext.node.value.data as String),
      ],
    );
  }
}
