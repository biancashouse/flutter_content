import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:http/http.dart' as http;
import 'package:multi_split_view/multi_split_view.dart';

class PlantUMLTextEditor extends StatefulWidget {
  final TextEditingController teC;
  final ValueChanged<UMLRecord> onChangeF;
  final ValueChanged<Size> onSizedF;

  const PlantUMLTextEditor({
    required this.teC,
    required this.onChangeF,
    required this.onSizedF,
    super.key,
  });

  @override
  State<PlantUMLTextEditor> createState() => PlantUMLTextEditorState();
}

class PlantUMLTextEditorState extends State<PlantUMLTextEditor> {
  late FocusNode focusNode;
  late GlobalKey gkForSizing;
  UMLRecord? umlRecord;

  @override
  void initState() {
    focusNode = FocusNode();
    gkForSizing = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UMLRecord>(
        future: encodeThenFetchPng(widget.teC.text, widget.onChangeF),
        builder: (futureContext, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          void _getSize() {
            final RenderBox? renderBox =
                gkForSizing?.currentContext?.findRenderObject() as RenderBox?;
            if (renderBox != null) {
              final size = renderBox.size;
              widget.onSizedF(size);
              print('Image size: $size');
            }
          }

          fco.afterNextBuildDo(()=>_getSize());

          UMLRecord? umlRecord = snapshot.data;

          List<Area> areas = [
            Area(builder: (ctx, area) => _textArea()),
            Area(
                builder: (ctx, area) => _plantUMLImageArea(
                      umlRecord?.bytes ??
                          Uint8List.fromList(missingPng.codeUnits),
                    )),
          ];

          return MultiSplitViewTheme(
            data: MultiSplitViewThemeData(
              dividerPainter: DividerPainters.grooved1(
                color: Colors.indigo[100]!,
                highlightedColor: Colors.indigo[900]!,
              ),
            ),
            child: MultiSplitView(
              axis: Axis.horizontal,
              initialAreas: areas,
            ),
          );
        });
  }

  Widget _textArea() => Container(
        color: Colors.yellowAccent,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                fco.coloredText('@startuml', color: Colors.purple),
                IconButton(
                  onPressed: () async {
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            _umlTextField(),
            Row(
              children: [
                fco.coloredText('@enduml', color: Colors.purple),
                IconButton(
                  onPressed: () async {
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  // void refreshImage( ) {
  //   setState(() {
  //     widget.onChangeF
  //         .call((text: teC.text, encodedText: umlEncodedText, bytes: pngBytes));
  //   });
  // }

  Widget _plantUMLImageArea(Uint8List pngBytes) => Center(
        child: SingleChildScrollView(
          child: Image.memory(key: gkForSizing, pngBytes),
        ),
      );

  static Future<UMLRecord> encodeThenFetchPng(
    String umlText,
    ValueChanged<UMLRecord> onchangeF,
  ) async {
    String? encodedText = await _cloudRunEncodeTextForPlantUML(umlText);
    encodedText ??= missingPng;
    Uint8List? pngBytes = await _fetchPngFromPlantUML(encodedText);
    UMLRecord umlRecord = (
      text: umlText,
      encodedText: encodedText,
      bytes: pngBytes,
      width: null,
      height: null,
    );
    onchangeF.call(umlRecord);
    return umlRecord;
  }

  /// http POST - send uml text to my cloud run server to encode into a string.
  /// That string can then be sent to https://www.plantuml.com/plantuml/png/<encoded-text>
  static Future<String?> _cloudRunEncodeTextForPlantUML(String umlText) async {
    final bodyMap = {"uml": "$umlText"};
    final body = json.encode(bodyMap);
    final response = await http.Client().post(
      Uri.parse(
          'https://gcr-plantuml-encoder-js-188627927914.australia-southeast1.run.app'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: body,
    );
    final responseBody = response.body;
    final String encodedText = responseBody;
    return response.statusCode == 200
        ? encodedText
        : null; // "cloudRunEncodeTextForPlantUML() received a bad response!";
  }

  static Future<Uint8List?> _fetchPngFromPlantUML(String encodedUMLText) async {
    final url =
        Uri.parse('https://www.plantuml.com/plantuml/png/$encodedUMLText');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        print('Error fetching PNG: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching PNG: $e');
      return null;
    }
  }

  Widget _umlTextField() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: widget.teC,
              decoration: const InputDecoration(
                hintText: "PlantUML text",
              ),
              focusNode: focusNode,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'monospace',
                  letterSpacing: 2,
                  color: Colors.blue[900]),
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.top,
              onTap: () {
                focusNode.requestFocus();
              },
              onChanged: (s) {},
              onTapOutside: (_) {},
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
