import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/markdown_editor/markdown_editor.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MarkdownMSV extends StatelessWidget {
  final String originalMD;
  final ValueChanged<String> onChangeF;

  const MarkdownMSV({required this.originalMD, required this.onChangeF, super.key});

  @override
  Widget build(BuildContext context) {
    String currentMD = originalMD;
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      List<Area> areas = [
        Area(builder: (ctx, area) => _markdownEditorArea(currentMD, (s){
          setState(() {
            onChangeF.call(currentMD=s);
          });
        })),
        Area(builder: (ctx, area) => MarkdownWidget(data:currentMD)),
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
    });
  }

  Widget _markdownEditorArea(String rawMarkdownText, onChangeF) =>
      MarkdownEditor(originalMarkdown: rawMarkdownText, onChangeF: (s) {onChangeF.call(s);});
}
