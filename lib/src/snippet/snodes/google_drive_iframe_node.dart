import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/iframe.dart';

part 'google_drive_iframe_node.mapper.dart';

@MappableClass()
class GoogleDriveIFrameNode extends ChildlessNode with GoogleDriveIFrameNodeMappable {
  String name;
  String folderId;
  String resourceKey;
  double iframeWidth;
  double iframeHeight;

  GoogleDriveIFrameNode({
    this.name = '',
    this.folderId = '',
    this.resourceKey = '',
    this.iframeWidth = 800, // not 595?
    this.iframeHeight = 800, // not 842?
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 70),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'folderId',
          stringValue: folderId,
          onStringChange: (newValue) => refreshWithUpdate(() => folderId = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 70),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'resourceKey',
          stringValue: resourceKey,
          onStringChange: (newValue) => refreshWithUpdate(() => resourceKey = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 70),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'iframeWidth',
          decimalValue: iframeWidth,
          onDoubleChange: (newValue) => refreshWithUpdate(() => iframeWidth = newValue ?? 800),
          calloutButtonSize: const Size(120, 20),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'iframeHeight',
          decimalValue: iframeHeight,
          onDoubleChange: (newValue) => refreshWithUpdate(() => iframeHeight = newValue ?? 800),
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
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    parent = parentNode;  // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    String src =
        'https://drive.google.com/embeddedfolderview?id=$folderId&resourcekey=$resourceKey#list" style="width:100%; height:600px; border:0;"';

    return folderId.isNotEmpty && iframeWidth > 0 && iframeHeight > 0 && CAPIBloC.I.state.snippetsBeingEdited.isEmpty
        ? SizedBox(
            key: nodeWidgetGK,
            width: iframeWidth,
            height: iframeHeight,
            child: IFrame(
              // name: name,
              src: src,
              iframeW: iframeWidth,
              iframeH: iframeHeight,
              forceRefresh: true,
            ),
          )
        : CAPIBloC.I.state.snippetsBeingEdited.isNotEmpty
            ? Placeholder()
            : Row(
                key: nodeWidgetGK,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.code, size: 32, color: Colors.red),
                  Useful.coloredText('folder id missing!', color: Colors.red),
                ],
              );
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
  Widget? logoSrc() => Image.asset(
        Useful.asset('images/google-icons/google-drive-icon.webp'),
        width: 24,
      );

  static const String FLUTTER_TYPE = "GoogleDrive";
}
