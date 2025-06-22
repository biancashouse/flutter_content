import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/iframe/iframe.dart';

part 'google_drive_iframe_node.mapper.dart';

@MappableClass()
class GoogleDriveIFrameNode extends CL with GoogleDriveIFrameNodeMappable {
  // Open the Drive file, Menu Option: File | Share | Publish to web, Embed Tab
  // <iframe src="https://docs.google.com/spreadsheets/d/e/2PACX-1vQlAAiNow9CthD2TMk0qxiEoXveNDZh0etVOlwlqbzkBgPijvY4YDygnzjZkCbBGQ/pubhtml?widget=true&amp;headers=false"></iframe>
  //
  // <iframe src="https://docs.google.com/document/d/e/2PACX-1vTkJLCy0EmKeg2OzAekWbNWQrG5GKCdZMFiSAeg-U_2IM_cJINlNWrv5-HuxGRyCg/pub?embedded=true"></iframe>
  String name;
  String folderId;
  String resourceKey;
  double? iframeWidth;
  double? iframeHeight;

  GoogleDriveIFrameNode({
    this.name = '',
    this.folderId = '',
    this.resourceKey = '',
    this.iframeWidth, // not 595?
    this.iframeHeight, // not 842?
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        StringPNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(context,() => name = newValue ?? ''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
        StringPNode(
          snode: this,
          name: 'folderId',
          stringValue: folderId,
          onStringChange: (newValue) =>
              refreshWithUpdate(context,() => folderId = newValue ?? ''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
        StringPNode(
          snode: this,
          name: 'resourceKey',
          stringValue: resourceKey,
          onStringChange: (newValue) =>
              refreshWithUpdate(context,() => resourceKey = newValue ?? ''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
        DecimalPNode(
          snode: this,
          name: 'iframeWidth',
          decimalValue: iframeWidth,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => iframeWidth = newValue),
          calloutButtonSize: const Size(120, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'iframeHeight',
          decimalValue: iframeHeight,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => iframeHeight = newValue),
          calloutButtonSize: const Size(120, 20),
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
  //           label: "folderId",
  //           text: folderId,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             folderId = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "resourceKey",
  //           text: resourceKey,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             resourceKey = s;
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

  Widget? savedWidget;

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      String src =
              'https://docs.google.com/spreadsheets/d/e/2PACX-1vQlAAiNow9CthD2TMk0qxiEoXveNDZh0etVOlwlqbzkBgPijvY4YDygnzjZkCbBGQ/pubhtml?widget=true&amp;headers=false';
//        'https://drive.google.com/embeddedfolderview?id=$folderId&resourcekey=$resourceKey#list" style="width:100%; height:600px; border:0;"';

      return SizedBox(
            key: createNodeWidgetGK(),
            width: iframeWidth,
            height: iframeHeight,
            child: IFrame(
              // name: name,
              src: extractUrlFromIframe(src) ??
                  '<iframe src="https://docs.google.com/document/d/e/2PACX-1vQs8513mgRcxNUcf2TcIv5EY_nCCjUrdWt7_OooiVLdTslDSnQYY31IEWKROTCaki0MwdHDWFunu6ix/pub?embedded=true"></iframe>',
              iframeW: iframeWidth ?? double.infinity,
              iframeH: iframeHeight ?? double.infinity,
              forceRefresh: true,
            ),
          );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
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
    String src =
        'https://drive.google.com/embeddedfolderview?id=$folderId&resourcekey=$resourceKey#grid" style="width:100%; height:600px; border:0;"';
    return '''GoogleDrive($src)''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? widgetLogo() => Image.asset(
        fco.asset('lib/assets/images/google-icons/google-drive-icon.webp'),
        width: 24,
      );

  static const String FLUTTER_TYPE = "GoogleDrive";
}
