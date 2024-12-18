// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/widgets/flowchart_widget.dart';
import 'package:http/http.dart' as http;

part 'algc_node.mapper.dart';

@MappableClass()
class AlgCNode extends CL with AlgCNodeMappable {
  String? ea;
  String? fId;
  String? flowchartJsonString;

  AlgCNode({
    this.ea,
    this.fId,
    this.flowchartJsonString,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        PropertyGroup(
          snode: this,
          name: 'by email + id',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'email address',
              stringValue: ea,
              skipHelperText: true,
              onStringChange: (newValue) =>
                  refreshWithUpdate(() => ea = newValue),
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 400,
              numLines: 1,
            ),
            StringPropertyValueNode(
              snode: this,
              name: 'flowchart id',
              stringValue: fId,
              skipHelperText: true,
              onStringChange: (newValue) =>
                  refreshWithUpdate(() => fId = newValue),
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 400,
              numLines: 1,
            ),
          ],
        ),
        PropertyGroup(
          snode: this,
          name: 'direct json entry',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'json',
              stringValue: flowchartJsonString,
              skipHelperText: true,
              onStringChange: (newValue) =>
                  refreshWithUpdate(() => flowchartJsonString = newValue),
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 400,
              numLines: 6,
            ),
          ],
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

    if (flowchartJsonString?.isNotEmpty ?? false) {
      // use stored json
      try {
        return FlowchartWidget(
          key: createNodeGK(),
          flowchartJsonString ?? '',
        );
      } catch (e) {
        return Error(
            key: createNodeGK(),
            FLUTTER_TYPE,
            color: Colors.green,
            size: 32,
            errorMsg: e.toString());
      }
    } else {
      // try to fetch from algc firestore using ea and fid
      String? vea = fco.hiveBox?.get('vea');
      vea = 'DRmm8EQr9QS3NEBtQTuy95IVYw23';
      if (vea.isEmpty) {
        return Error(
            key: createNodeGK(),
            FLUTTER_TYPE,
            color: Colors.green,
            size: 32,
            errorMsg: "vea.isEmpty!");
      }
      if ((vea.isNotEmpty) && (fId?.isNotEmpty ?? false)) {
        try {
          return FutureBuilder<String?>(
              future: _cloudRunFetchFlowchartJsonString(vea, fId!),
              builder: (futureContext, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                // cache fetched json in the node
                flowchartJsonString = snapshot.data;
                try {
                  return FlowchartWidget(
                    key: createNodeGK(),
                    flowchartJsonString ?? '',
                  );
                } catch (e) {
                  return Error(
                      key: createNodeGK(),
                      FLUTTER_TYPE,
                      color: Colors.red,
                      size: 32,
                      errorMsg: e.toString());
                }
              });
        } catch (e) {
          return Error(
              key: createNodeGK(),
              FLUTTER_TYPE,
              color: Colors.red,
              size: 32,
              errorMsg: e.toString());
        }
      } else {
        return Error(
            key: createNodeGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 32,
            errorMsg:
                "$FLUTTER_TYPE - Either specify your email address and flowchart id, or the json !");
      }
    }
  }

  Future<String?> _cloudRunFetchFlowchartJsonString(
    String vea,
    String fid,
  ) async {
    final bodyMap = {"user-id": vea, "fid": fid};
    final body = json.encode(bodyMap);
    final response = await http.Client().post(
      Uri.parse('${fco.gcrServerUrl}/algc/bytes'),
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

  @override
  List<Type> wrapWithRecommendations() => [CarouselNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Algorithm";
}
