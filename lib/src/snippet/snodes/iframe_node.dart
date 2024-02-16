import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/iframe.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

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
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        // StringPropertyValueNode(
        //   snode: this,
        //   name: 'name',
        //   stringValue: name,
        //   onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
        //   calloutButtonSize: const Size(280, 70),
        //   calloutSize: const Size(280, 80),
        // ),
        StringPropertyValueNode(
          snode: this,
          name: 'src',
          stringValue: src,
          onStringChange: (newValue) => refreshWithUpdate(() => src = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(300, 160),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'iframeWidth',
          decimalValue: iframeWidth,
          onDoubleChange: (newValue) => refreshWithUpdate(() => iframeWidth = newValue ?? 800),
          calloutButtonSize: const Size(90, 30),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'iframeHeight',
          decimalValue: iframeHeight,
          onDoubleChange: (newValue) => refreshWithUpdate(() => iframeHeight = newValue ?? 800),
          calloutButtonSize: const Size(90, 30),
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
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);  // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    String FOLDER_ID = '1J8PIKBTq1cbF1_D124SleDtw2GKSg2B7';
    String RESOURCE_KEY = '';
    return true //src.isNotEmpty && iframeWidth > 0 && iframeHeight > 0 && FlutterContent().capiBloc.state.snippetsBeingEdited.isEmpty
        ? Center(
            key: createNodeGK(),
             child: IFrame(
              //name: name,
              src: src ??
                  'https://drive.google.com/embeddedfolderview?id=$FOLDER_ID&resourcekey=$RESOURCE_KEY#grid" style="width:100%; height:600px; border:0;"',
              iframeW: iframeWidth,
              iframeH: iframeHeight,
              forceRefresh: true,
            ),
          )
        : FC().areAnySnippetsBeingEdited
            ? Placeholder()
            : Column(
                children: [
                  Placeholder(),
                  Row(key: createNodeGK(), children: [
                    const Icon(Icons.code, size: 32, color: Colors.red),
                    Useful.coloredText('src missing!', color: Colors.red),
                  ]),
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
    return '''IFrame(src:$src)''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "IFrame";
}
