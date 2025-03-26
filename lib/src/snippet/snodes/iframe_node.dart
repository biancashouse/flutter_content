import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

import 'iframe/iframe.dart';

part 'iframe_node.mapper.dart';

const sampleDocSrc =
    'https://docs.google.com/document/d/e/2PACX-1vS3QgXGHNtrKoCpojpXILZfmZM9WLABVnWDnFIsD2FUhHnHo6cG_YKdKqYa3bWw7L5pgdU-4b2u5TIy/pub?embedded=true';

@MappableClass()
class IFrameNode extends CL with IFrameNodeMappable {
  // String name;
  String? src;
  double iframeWidth;
  double iframeHeight;

  IFrameNode({
    // this.name = '',
    this.src,
    this.iframeWidth = 800, // not 595?
    this.iframeHeight = 800, // not 842?
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        // StringPNode(
        //   snode: this,
        //   name: 'name',
        //   stringValue: name,
        //   onStringChange: (newValue) => refreshWithUpdate(context,() => name = newValue),
        //   calloutButtonSize: const Size(280, 70),
        //   calloutSize: const Size(280, 80),
        // ),
        FlutterDocPNode(
            buttonLabel: 'IFrame',
            webLink: 'https://pub.dev/packages/webview_flutter_web',
            snode: this,
            name: 'fyi'),
        StringPNode(
          snode: this,
          name: 'src',
          stringValue: src,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => src = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 300,
        ),
        DecimalPNode(
          snode: this,
          name: 'iframeWidth',
          decimalValue: iframeWidth,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => iframeWidth = newValue ?? 800),
          calloutButtonSize: const Size(160, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'iframeHeight',
          decimalValue: iframeHeight,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => iframeHeight = newValue ?? 800),
          calloutButtonSize: const Size(160, 20),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "name",
  //           text: name,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             name = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "src",
  //           text: src,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             src = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       Row(
  //         children: [
  //           SizedBox(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'width',
  //               originalS: iframeWidth.toString(),
  //               onChangedF: (newWidth) {
  //                 iframeWidth = double.tryParse(newWidth) ?? 595;
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           const SizedBox(width: 10),
  //           SizedBox(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'height',
  //               originalS: iframeHeight.toString(),
  //               onChangedF: (newHeight) {
  //                 iframeHeight = double.tryParse(newHeight) ?? 842;
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           if (iframeWidth == 595 && iframeHeight == 842) const SizedBox(width: 10),
  //           if (iframeWidth == 595 && iframeHeight == 842) const Text("(A4)"),
  //         ],
  //       )
  //     ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      {bool showTriangle = false}) {
    try {
      setParent(parentNode); // propagating parents down from root
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      // String folderId = '1J8PIKBTq1cbF1_D124SleDtw2GKSg2B7';
      // String resourceKey = '';
      String iframeSrc = src == null
          ? "https://docs.google.com/document/d/e/2PACX-1vQs8513mgRcxNUcf2TcIv5EY_nCCjUrdWt7_OooiVLdTslDSnQYY31IEWKROTCaki0MwdHDWFunu6ix/pub?embedded=true"
          : (src?.contains('<iframe') ?? false)
              ? extractUrlFromIframe(src!)!
              : src!;
      return Center(
        key: createNodeWidgetGK(),
        child: IFrame(
          //name: name,
          // src: src ??
          //     'https://drive.google.com/embeddedfolderview?id=$FOLDER_ID&resourcekey=$RESOURCE_KEY#grid" style="width:100%; height:600px; border:0;"',
          src: iframeSrc,
          iframeW: iframeWidth,
          iframeH: iframeHeight,
          forceRefresh: true,
        ),
      );
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  String? extractUrlFromIframe(String iframeTag) {
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(iframeTag);
    return matches.first.group(0);
  }

  // : Row(
  //     children: [
  //       Icon(Icons.code)
  //       Image.asset("${pkg_flutter_content}images/google-icons/docs.png", height: 64),
  //       Image.asset("${pkg_flutter_content}images/google-icons/sheets.png", height: 64),
  //       Image.asset("${pkg_flutter_content}images/google-icons/slides.png", height: 64),
  //       Image.asset("${pkg_flutter_content}images/google-icons/forms.png", height: 64),
  //     ],
  //   );

  @override
  String toSource(BuildContext context) {
    return '''IFrame(src:$src)''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "IFrame";
}
