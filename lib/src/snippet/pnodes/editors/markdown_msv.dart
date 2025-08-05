import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/markdown_editor/markdown_editor.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:multi_split_view/multi_split_view.dart';

class MarkdownMSV extends StatefulWidget {
  final TextEditingController teC;
  final ValueChanged<String> onChangeF;

  const MarkdownMSV({required this.teC, required this.onChangeF, super.key});

  @override
  State<MarkdownMSV> createState() => MarkdownMSVState();
}

class MarkdownMSVState extends State<MarkdownMSV> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Area> areas = [
      Area(builder: (ctx, area) => _markdownEditorArea(widget.teC.text, (s){
        setState(() {
          widget.onChangeF.call(s);
        });
      })),
      Area(builder: (ctx, area) => _markdownRenderedArea()),
    ];

    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
        dividerPainter: DividerPainters.grooved1(
          color: Colors.indigo[100]!,
          highlightedColor: Colors.indigo[900]!,
        ),
      ),
      child: MultiSplitView(axis: Axis.horizontal, initialAreas: areas),
    );
  }

  Widget _markdownRenderedArea() => Markdown(
    data: widget.teC.text,
    styleSheet: MarkdownStyleSheet(
      h1: const TextStyle(color: Colors.red),
      p: const TextStyle(color: Colors.black),
      a: const TextStyle(color: Colors.blue),
      codeblockDecoration: BoxDecoration(color: Colors.yellow[100]),
      code: const TextStyle(color: Colors.purple),
    ),
    onTapLink: (String text, String? href, String title) async {
      if (href != null) {
        try {
          Uri url = Uri.parse(href);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $href');
          }
        } catch (e) {
          fco.logger.d('Following exception ignored:');
          fco.logger.e('', error: e);
        }
      }
    },
  );

  // Widget _rawTextArea() => Container(
  //   color: Colors.yellowAccent,
  //   padding: const EdgeInsets.all(10),
  //   child: Column(
  //     children: [
  //       Row(
  //         children: [
  //           fco.coloredText('refresh', color: Colors.purple),
  //           IconButton(
  //             onPressed: () async {
  //               setState(() {});
  //             },
  //             icon: const Icon(Icons.refresh, color: Colors.purple),
  //           ),
  //         ],
  //       ),
  //       _rawTextField(),
  //       Row(
  //         children: [
  //           fco.coloredText('refresh', color: Colors.purple),
  //           IconButton(
  //             onPressed: () async {
  //               setState(() {});
  //             },
  //             icon: const Icon(Icons.refresh, color: Colors.purple),
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // );

  Widget _markdownEditorArea(String rawMarkdownText, onChangeF) =>
      MarkdownEditor(originalMarkdown: widget.teC.text, onChangeF: (s) {onChangeF.call(s);});

  // Widget _rawTextField() {
  //   return Expanded(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           TextField(
  //             controller: widget.teC,
  //             decoration: const InputDecoration(hintText: "raw markdown text"),
  //             focusNode: focusNode,
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontFamily: 'monospace',
  //               letterSpacing: 2,
  //               color: Colors.blue[900],
  //             ),
  //             textAlign: TextAlign.left,
  //             textAlignVertical: TextAlignVertical.top,
  //             onTap: () {
  //               focusNode.requestFocus();
  //             },
  //             onChanged: (s) {},
  //             onTapOutside: (_) {},
  //             autocorrect: false,
  //             enableInteractiveSelection: true,
  //             scrollPadding: const EdgeInsets.all(10),
  //             keyboardType: TextInputType.multiline,
  //             maxLines: 999,
  //             autofocus: true,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
