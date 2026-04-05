import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/flutter_uml/lib/flutter_uml.dart';
import 'package:flutter_content/src/svg/web_svg_view.dart' show WebSvgView;
import 'package:multi_split_view/multi_split_view.dart';

class UmlMSV extends StatefulWidget {
  final TextEditingController teC;
  final ValueChanged<String> onChangeF;

  const UmlMSV({required this.teC, required this.onChangeF, super.key});

  @override
  State<UmlMSV> createState() => UmlMSVState();
}

class UmlMSVState extends State<UmlMSV> {
  late FocusNode focusNode;
  late GlobalKey gkForSizing;
  late Future<void> fConfigureStorageUIForFolder;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    gkForSizing = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    List<Area> areas = [
      Area(builder: (ctx, area) => _textArea()),
      Area(
        builder: (ctx, area) {
          // String diagramUrl = UMLImageNode.buildDiagramUrl(widget.teC.text);
          // return WebSvgView(url: diagramUrl);
          return widget.teC.text.startsWith('@startuml')
              ? UmlDiagram.plantuml(source: widget.teC.text)
              : UmlDiagram.mermaid(source: widget.teC.text);
        },
      ),
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

  Widget _textArea() => Container(
    color: Colors.yellowAccent,
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            fco.coloredText('refresh', color: Colors.purple),
            IconButton(
              onPressed: () async {
                setState(() {
                  widget.onChangeF(widget.teC.text);
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.purple),
            ),
          ],
        ),
        _umlTextField(),
        Row(
          children: [
            fco.coloredText('refresh', color: Colors.purple),
            IconButton(
              onPressed: () async {
                setState(() {
                  widget.onChangeF(widget.teC.text);
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.purple),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _umlTextField() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: widget.teC,
              decoration: const InputDecoration(hintText: "PlantUML text"),
              focusNode: focusNode,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'monospace',
                letterSpacing: 2,
                color: Colors.blue[900],
              ),
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.top,
              onTap: () {
                focusNode.requestFocus();
              },
              onChanged: (s) {},
              onTapOutside: (_) {
                focusNode.unfocus();
              },
              autocorrect: false,
              enableInteractiveSelection: true,
              scrollPadding: const EdgeInsets.all(10),
              keyboardType: TextInputType.multiline,
              maxLines: 999,
              autofocus: true,
            ),
          ],
        ),
      ),
    );
  }
}
