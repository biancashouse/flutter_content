// import 'dart:convert';
// import 'package:archive/archive.dart';
import 'package:dart_mappable/dart_mappable.dart';

// import 'package:firebase_storage/firebase_storage.dart' show FirebaseStorage;
// import 'package:firebase_ui_storage/firebase_ui_storage.dart' show StorageImage;
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

// import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_msv.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart'
    show FlutterDocPNode;

// import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
// import 'package:flutter_content/src/snippet/pnodes/uml_string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../svg/web_svg_view.dart' show WebSvgView;
import '../../flutter_uml/lib/flutter_uml.dart';
import '../pnodes/decimal_pnode.dart' show DecimalPNode;
import '../pnodes/uml_string_pnode.dart' show DiagramStringPNode;

part 'uml_image_node.mapper.dart';

/// kroki
// const String _krokiBaseUrl = 'https://kroki-188627927914.us-central1.run.app';

const missingPng =
    'RSqn3i8m343HFQSmKoS6a3W0pGqG8ujfh10biQaT3zmU0IET_vE-rS9FLEmmocWqYoRIYpYdACgaS3W5spBNHraganaSjq6K9WfAwI_ZKhF-5XzoNXtt4HEDkJc5y4MWj3hPW5xC2kSRJzxR17T9Bq3Di0jl';

const plantumlRef =
    'https://pdf.plantuml.net/PlantUML_Language_Reference_Guide_en.pdf';

const mermaidRef = 'https://mermaid.ai/open-source/intro';

const samplePlantUml = '''@startuml
class User {
  -String id
  -String name
  +String name()
}
User <|-- SpecificUser
@enduml
''';

const sampleMermaid = '''pie title What Voldemort doesn't have?
         "FRIENDS" : 2
         "FAMILY" : 3
         "NOSE" : 45
''';

@MappableClass()
class UMLImageNode extends CL with UMLImageNodeMappable {
  String? name;
  String? diagramText;
  double? width;
  double? height;
  double scale;
  BoxFitEnum? fit;
  AlignmentEnum? alignment;

  UMLImageNode({
    this.name,
    this.diagramText,
    this.width,
    this.height,
    this.scale = 1.0,
    this.fit = BoxFitEnum.none,
    this.alignment = AlignmentEnum.center,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? _gk;

  // /// Returns the Kroki SVG URL for the given [diagram].
  // static String buildDiagramUrl(String diagram) {
  //   if (diagram.isEmpty) return '';
  //
  //   // Encode the diagram text using zlib deflate and base64url encoding
  //   final bytes = utf8.encode(diagram);
  //   final encoder = ZLibEncoder();
  //   final deflated = encoder.encode(bytes);
  //   final encoded = base64UrlEncode(deflated);
  //
  //   final diagramType = diagram.startsWith('@startuml')
  //       ? 'plantuml'
  //       : 'mermaid';
  //
  //   return '$_krokiBaseUrl/$diagramType/svg/$encoded';
  // }

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'PlantUML Reference',
      webLink: plantumlRef,
      snode: this,
      name: 'fyi',
    ),
    FlutterDocPNode(
      buttonLabel: 'Mermaid Reference',
      webLink: mermaidRef,
      snode: this,
      name: 'fyi',
    ),
    DecimalPNode(
      snode: this,
      name: 'scale',
      decimalValue: scale,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => scale = newValue ?? 1.0),
      calloutButtonSize: const Size(80, 20),
    ),
    EnumPNode<BoxFitEnum?>(
      snode: this,
      name: 'fit',
      valueIndex: fit?.index,
      onIndexChange: (newValue) =>
          refreshWithUpdate(context, () => fit = BoxFitEnum.of(newValue)),
    ),
    EnumPNode<AlignmentEnum?>(
      snode: this,
      name: 'alignment',
      valueIndex: alignment?.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => alignment = AlignmentEnum.of(newValue),
      ),
    ),
    DiagramStringPNode(
      snode: this,
      name: 'diagramText',
      onUmlChange: (String? newText) {
        refreshWithUpdate(context, () {
          diagramText = newText;
        });
      },
      calloutButtonSize: const Size(280, 2000),
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);

      _gk ??= createNodeWidgetGK();

      // if (diagramText?.isNotEmpty ?? false) {
      //   String diagramUrl = UMLImageNode.buildDiagramUrl(diagramText!);
      //   return WebSvgView(key: _gk, url: diagramUrl);
      // } else {
      //   return Placeholder(
      //     key: _gk,
      //     color: Colors.purpleAccent,
      //     strokeWidth: 2.0,
      //   );
      // }

      if (diagramText == null) {
        return Text('enter plantuml or mermaid text...');
      } else {
        return diagramText!.startsWith('@startuml')
            ? UmlDiagram.plantuml(source: diagramText!)
            : UmlDiagram.mermaid(source: diagramText!);
      }
    } catch (e) {
      return Error(
        key: _gk,
        toString(),
        color: Colors.red,
        size: 18,
        errorMsg: e.toString(),
      );
    }
  }

  // @override
  // /// use version in fs storage for non-editors
  // Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
  //   setParent(parentNode);
  //
  //   if (!fco.canEditContent() && name != null) {
  //     // can't edit, so just retrieve from firebase storage
  //     final ref = fco.folderPathRef("/plantuml-images").child("$name");
  //     try {
  //       return Center(child: _storageImage(ref));
  //     } catch (e) {
  //       return Error(
  //         key: _gk,
  //         FLUTTER_TYPE,
  //         color: Colors.red,
  //         size: 16,
  //         errorMsg: e.toString(),
  //       );
  //     }
  //   } else {
  //     return cachedPngBytes != null && cachedPngBytes!.isNotEmpty
  //         ? _memoryImage()
  //         : FutureBuilder<UMLRecord>(
  //             future: PlantUMLMSVState.encodeThenFetchPng(umlText ?? '', (
  //               UMLRecord newValue,
  //             ) {
  //               umlText = newValue.text;
  //               cachedPngBytes = newValue.bytes;
  //               width = newValue.width;
  //               height = newValue.height;
  //             }),
  //             builder: (futureContext, snapshot) {
  //               if (snapshot.connectionState != ConnectionState.done) {
  //                 return const Center(child: CircularProgressIndicator());
  //               }
  //
  //               if (_gk == null) {
  //                 _gk = createNodeWidgetGK();
  //                 fco.afterMsDelayDo(100, () => fco.forceRefresh());
  //               }
  //
  //               return _memoryImage();
  //             },
  //           );
  //   }
  // }

  // Widget _storageImage(ref) => StorageImage(
  //   key: createNodeWidgetGK(),
  //   fit: fit?.flutterValue,
  //   width: width,
  //   height: height,
  //   ref: ref,
  // );

  // Widget _memoryImage() => Image.memory(
  //   key: _gk,
  //   // scale: 3.0,
  //   cachedPngBytes ?? Uint8List.fromList(missingPng.codeUnits),
  //   fit: fit?.flutterValue,
  //   errorBuilder: (context, o, stackTrace) {
  //     return Error(
  //       key: GlobalKey(),
  //       "PlantUMLTextEditor Image.memory",
  //       color: Colors.red,
  //       size: 18,
  //       errorMsg: 'Bad pngBytes',
  //     );
  //   },
  // );

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
  String toString() => diagramText == null
      ? 'UML (plantuml or mermaid)'
      : diagramText!.startsWith('@startuml')
      ? 'plantuml'
      : 'mermaid';
}
