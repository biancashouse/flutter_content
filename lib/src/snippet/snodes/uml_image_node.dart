import 'package:dart_mappable/dart_mappable.dart';

// import 'package:firebase_storage/firebase_storage.dart' show FirebaseStorage;
import 'package:firebase_ui_storage/firebase_ui_storage.dart' show StorageImage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_msv.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart'
    show FlutterDocPNode, FYIPNode;
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/uml_string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uml_image_node.mapper.dart';

const missingPng =
    'RSqn3i8m343HFQSmKoS6a3W0pGqG8ujfh10biQaT3zmU0IET_vE-rS9FLEmmocWqYoRIYpYdACgaS3W5spBNHraganaSjq6K9WfAwI_ZKhF-5XzoNXtt4HEDkJc5y4MWj3hPW5xC2kSRJzxR17T9Bq3Di0jl';

const plantUMLRef =
    'https://pdf.plantuml.net/PlantUML_Language_Reference_Guide_en.pdf';

@MappableClass()
class UMLImageNode extends CL with UMLImageNodeMappable {
  String? name;
  String? umlText;
  double? width;
  double? height;
  BoxFitEnum? fit;

  UMLImageNode({this.name, this.umlText, this.width, this.height, this.fit});

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? _gk;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List? cachedPngBytes;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'PlantUML Reference',
      webLink: plantUMLRef,
      snode: this,
      name: 'fyi',
    ),
    FYIPNode(
      label:
          "Generated UML image name",
      msg:
          "Specify a file name for the\n"
              "generated UML image file (png)\n"
              "in Firebase Storage",
      snode: this,
      name: 'file-name',
    ),
    StringPNode(
      snode: this,
      name: 'name (in firebase storage)',
      stringValue: name,
      skipHelperText: true,
      onStringChange: (newValue) =>
          refreshWithUpdate(context, () => name = newValue),
      calloutButtonSize: const Size(280, 70),
      calloutWidth: 400,
      numLines: 1,
    ),
    EnumPNode<BoxFitEnum?>(
      snode: this,
      name: 'fit',
      valueIndex: fit?.index,
      onIndexChange: (newValue) =>
          refreshWithUpdate(context, () => fit = BoxFitEnum.of(newValue)),
    ),
    UMLStringPNode(
      snode: this,
      name: 'uml',
      umlRecord: (
        text: umlText,
        bytes: cachedPngBytes,
        width: width,
        height: height,
      ),
      onUmlChange: (newValue) {
        refreshWithUpdate(context, () {
          umlText = newValue.text;
          cachedPngBytes = newValue.bytes;
          width = newValue.width;
          height = newValue.height;
        });
      },
      onSized: (newSize) {
        width = newSize.width;
        height = newSize.height;
      },
      calloutButtonSize: const Size(280, 2000),
    ),
  ];

  @override
  /// use version in fs storage for non-editors
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);

    if (!fco.canEditContent() && name != null) {
      // can't edit, so just retrieve from firebase storage
      final ref = fco.folderPathRef("/plantuml-images").child("$name");
      try {
        return Center(child: _storageImage(ref));
      } catch (e) {
        return Error(
          key: _gk,
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString(),
        );
      }
    } else {
      return cachedPngBytes != null && cachedPngBytes!.isNotEmpty
          ? _memoryImage()
          : FutureBuilder<UMLRecord>(
              future: PlantUMLMSVState.encodeThenFetchPng(umlText ?? '', (
                UMLRecord newValue,
              ) {
                umlText = newValue.text;
                cachedPngBytes = newValue.bytes;
                width = newValue.width;
                height = newValue.height;
              }),
              builder: (futureContext, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_gk == null) {
                  _gk = createNodeWidgetGK();
                  fco.afterMsDelayDo(100, () => fco.forceRefresh());
                }

                return _memoryImage();
              },
            );
    }
  }

  Widget _storageImage(ref) => StorageImage(
    key: createNodeWidgetGK(),
    fit: fit?.flutterValue,
    width: width,
    height: height,
    ref: ref,
  );

  Widget _memoryImage() => Image.memory(
    key: _gk,
    // scale: 3.0,
    cachedPngBytes ?? Uint8List.fromList(missingPng.codeUnits),
    fit: fit?.flutterValue,
    errorBuilder: (context, o, stackTrace) {
      return Error(
        key: GlobalKey(),
        "PlantUMLTextEditor Image.memory",
        color: Colors.red,
        size: 18,
        errorMsg: 'Bad pngBytes',
      );
    },
  );

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
  //       fco.logger.w('Error fetching PNG: ${response.statusCode}');
  //       return null;
  //     }
  //   } catch (e) {
  //     fco.logger.w('Error fetching PNG: $e');
  //     return null;
  //   }
  // }

  @override
  Widget? widgetLogo() =>
      Image.asset(fco.asset('lib/assets/images/pub.dev.png'), width: 16);

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "UML";
}
