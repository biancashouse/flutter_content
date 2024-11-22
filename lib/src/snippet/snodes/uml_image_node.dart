import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_editor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uml_image_node.mapper.dart';

const missingPng =
    'RSqn3i8m343HFQSmKoS6a3W0pGqG8ujfh10biQaT3zmU0IET_vE-rS9FLEmmocWqYoRIYpYdACgaS3W5spBNHraganaSjq6K9WfAwI_ZKhF-5XzoNXtt4HEDkJc5y4MWj3hPW5xC2kSRJzxR17T9Bq3Di0jl';

@MappableClass()
class UMLImageNode extends CL with UMLImageNodeMappable {
  String? name;
  String? umlText;
  String? encodedText;
  double? width;
  double? height;

  UMLImageNode({
    this.name,
    this.umlText,
    this.encodedText,
    this.width,
    this.height,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List? cachedPngBytes;

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          skipHelperText: true,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 400,
          numLines: 1,
        ),
        UMLStringPropertyValueNode(
          snode: this,
          name: 'uml',
          umlRecord: (
            text: umlText,
            encodedText: encodedText,
            bytes: cachedPngBytes,
            width: width,
            height: height,
          ),
          onUmlChange: (newValue) {
            refreshWithUpdate(() {
              umlText = newValue.text;
              encodedText = newValue.encodedText;
              cachedPngBytes = newValue.bytes;
              width = newValue.width;
              height = newValue.height;
            });
          },
          onSized: (newSize) {
            width = newSize.width;
            height = newSize.height;
          },
          calloutButtonSize: const Size(280, 70),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {

    try {
      setParent(parentNode); // propagating parents down from root
      possiblyHighlightSelectedNode();

      return FutureBuilder<UMLRecord>(
          future: PlantUMLTextEditorState.encodeThenFetchPng(umlText ?? '',
              (UMLRecord newValue) {
            umlText = newValue.text;
            encodedText = newValue.encodedText;
            cachedPngBytes = newValue.bytes;
          }),
          builder: (futureContext, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            if (gk == null) {
              gk = createNodeGK();
              fco.afterMsDelayDo(100, () => fco.forceRefresh());
            }

            // UMLRecord? umlRecord = snapshot.data;
            return GestureDetector(
              child: Image.memory(
                key: gk,
                // scale: 3.0,
                cachedPngBytes ?? Uint8List.fromList(missingPng.codeUnits),
                fit: BoxFit.fill,
              ),
            );
          });
    } catch (e) {
      return Error(
          key: gk,
          FLUTTER_TYPE,
          color: Colors.red,
          size: 32,
          errorMsg: e.toString());
    }
  }

  // Future<Uint8List?> _fetchPng() async {
  //   encodedText ??= await _cloudRunEncodeTextForPlantUML();
  //   return await _fetchPngFromPlantUML(encodedText!);
  // }

  /// http POST - send uml text to my cloud run server to encode into a string.
  /// That string can then be sent to https://www.plantuml.com/plantuml/png/<encoded-text>
  // Future<String?> _cloudRunEncodeTextForPlantUML() async {
  //   final bodyMap = {"uml": "$umlText"};
  //   final body = json.encode(bodyMap);
  //   final response = await http.Client().post(
  //     Uri.parse(
  //         'https://gcr-plantuml-encoder-js-188627927914.australia-southeast1.run.app'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //     },
  //     body: body,
  //   );
  //   final responseBody = response.body;
  //   final String encodedText = responseBody;
  //   return response.statusCode == 200
  //       ? encodedText
  //       : null; // "cloudRunEncodeTextForPlantUML() received a bad response!";
  // }

  // Future<Uint8List?> _fetchPngFromPlantUML(String encodedUMLText) async {
  //   final url =
  //       Uri.parse('https://www.plantuml.com/plantuml/png/$encodedUMLText');
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       return response.bodyBytes;
  //     } else {
  //       print('Error fetching PNG: ${response.statusCode}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error fetching PNG: $e');
  //     return null;
  //   }
  // }

  @override
  List<Type> wrapWithRecommendations() => [CarouselNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "UML";
}
