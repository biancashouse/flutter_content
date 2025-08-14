// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/widgets/flowchart_widget.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:http/http.dart' as http;

part 'algc_node.mapper.dart';

@MappableClass()
class AlgCNode extends CL with AlgCNodeMappable {
  String? fbUid;
  String? fId;
  String? flowchartJsonString;

  AlgCNode({
    this.fbUid,
    this.fId,
    this.flowchartJsonString,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
        PNode /*Group*/ (
          snode: this,
          name: 'by user id + flowchart id',
          children: [
            StringPNode(
              snode: this,
              name: 'firebase UID',
              stringValue: fbUid,
              skipHelperText: true,
              onStringChange: (newValue) =>
                  refreshWithUpdate(context, () => fbUid = newValue),
              calloutButtonSize: const Size(240, 70),
              calloutWidth: 400,
              numLines: 1,
            ),
            StringPNode(
              snode: this,
              name: 'flowchart id',
              stringValue: fId,
              skipHelperText: true,
              onStringChange: (newValue) =>
                  refreshWithUpdate(context, () => fId = newValue),
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 400,
              numLines: 1,
            ),
          ],
        ),
        PNode /*Group*/ (
          snode: this,
          name: 'direct json entry',
          children: [
            StringPNode(
              snode: this,
              name: 'json',
              stringValue: flowchartJsonString,
              skipHelperText: true,
              onStringChange: (newValue) => refreshWithUpdate(
                  context, () => flowchartJsonString = newValue),
              calloutButtonSize: const Size(240, 70),
              calloutWidth: 400,
              numLines: 6,
            ),
          ],
        ),
      ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode,
      ) {
    setParent(parentNode); // propagating parents down from root
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    //possiblyHighlightSelectedNode(scName);

    if (flowchartJsonString?.isNotEmpty ?? false) {
      // use stored json
      try {
        return FlowchartWidget(
          key: createNodeWidgetGK(),
          flowchartJsonString ?? '',
          fbUid!,
          scName??'',
        );
      } catch (e) {
        return Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.green,
            size: 16,
            errorMsg: e.toString());
      }
    } else {
      // try to fetch from algc firestore using ea and fid
      if (fbUid == null || fbUid!.isEmpty) {
        return Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.green,
            size: 16,
            errorMsg: "must specify the firebase UID!");
      }
      if ((fbUid!= null && fbUid!.isNotEmpty) && (fId?.isNotEmpty ?? false)) {
        try {
          return FutureBuilder<String?>(
              future: cloudRunFetchFlowchartJsonString(fbUid!, fId!),
              builder: (futureContext, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                // cache fetched json in the node
                flowchartJsonString = snapshot.data;
                try {
                  return FlowchartWidget(
                    key: createNodeWidgetGK(),
                    flowchartJsonString ?? '',
                    fbUid!,
                    scName??'',
                  );
                } catch (e) {
                  return Error(
                      key: createNodeWidgetGK(),
                      FLUTTER_TYPE,
                      color: Colors.red,
                      size: 16,
                      errorMsg: e.toString());
                }
              });
        } catch (e) {
          return Error(
              key: createNodeWidgetGK(),
              FLUTTER_TYPE,
              color: Colors.red,
              size: 16,
              errorMsg: e.toString());
        }
      } else {
        return Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg:
                "$FLUTTER_TYPE - Either specify your email address and flowchart id, or the json !");
      }
    }
  }

  static Future<String?> cloudRunFetchFlowchartJsonString(
    String fbUID,
    String fid,
  ) async {
    final bodyMap = {"user-id": fbUID, "fid": fid};
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
  Widget? widgetLogo() => Image.asset(
        fco.asset('lib/assets/images/pub.dev.png'),
        width: 16,
      );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Algorithm";
}
