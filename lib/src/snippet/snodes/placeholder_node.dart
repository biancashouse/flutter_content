// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

part 'placeholder_node.mapper.dart';

@MappableClass()
class PlaceholderNode extends CL with PlaceholderNodeMappable {
  String? name;

  // String? centredLabel;
  double? width;
  double? height;

  PlaceholderNode({
    this.name,
    // this.centredLabel,
    this.width,
    this.height,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'Placeholder',
            webLink:
                'https://api.flutter.dev/flutter/widgets/Placeholder-class.html',
            snode: this,
            name: 'fyi'),
        StringPNode(
          snode: this,
          name: 'name',
          expands: false,
          numLines: 1,
          // skipHelperText: true,
          // skipLabelText: true,
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => name = newValue),
          calloutButtonSize: const Size(150, 20),
          calloutWidth: 150,
        ),
        DecimalPNode(
          snode: this,
          name: 'width',
          decimalValue: width,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => width = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'height',
          decimalValue: height,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => height = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      ) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

    // removed snippet place naming functionality - use tab bar instead
    // if (name != null && !fco.placeNames.contains(name!)) {
    //   fco.placeNames.add(name!);
    // }

    // possibly populate with a spnippet
    // Widget? childWidget;
    // if (fco.snippetPlacementMap.containsKey(name)) {
    //   String snippetName = fco.snippetPlacementMap[name]!;
    //   return FutureBuilder<SnippetRootNode?>(
    //       future:
    //           SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
    //         snippetName: snippetName,
    //       ),
    //       builder: (futureContext, snapshot) {
    //         return snapshot.connectionState != ConnectionState.done
    //             ? const Center(child: CircularProgressIndicator())
    //             : BlocBuilder<CAPIBloC, CAPIState>(
    //                 buildWhen: (previous, current) =>
    //                     !current.onlyTargetsWrappers,
    //                 builder: (blocContext, state) {
    //                   // fco.logger.i("BlocBuilder<CAPIBloC, CAPIState>");
    //                   // fco.logger.i("BlocBuilder<CAPIBloC, CAPIState> SnippetPanel: ${widget.panelName}");
    //                   // fco.logger.i("BlocBuilder<CAPIBloC, CAPIState> SnippetName: ${snippetName()}\n");
    //                   // // var fc = FC();
    //                   // SnippetInfoModel? snippetInfo = FCO.snippetInfoCache[snippetName()];
    //                   // fco.logger.i("BlocBuilder<CAPIBloC, CAPIState> VersionId: ${snippetInfo!.currentVersionId}\n");
    //                   // // snippet panel renders a canned snippet or a supplied snippet tree
    //                   //return _renderSnippet(context);
    //                   Widget snippetWidget;
    //                   try {
    //                     // in case did a revert, ignore snapshot data and use the AppInfo instead
    //                     SnippetRootNode? snippet = snapshot.data;//fco.currentSnippetVersion(snippetName);
    //                     snippet?.validateTree();
    //                     // SnippetRootNode? snippetRoot = cache?[editingVersionId];
    //                     snippetWidget = snippet == null
    //                         ? Error(key: createNodeWidgetGK(), FLUTTER_TYPE,
    //                             color: Colors.red,
    //                             size: 16,
    //                             errorMsg: "null snippet!")
    //                         : snippet.child?.toWidget(futureContext, snippet) ??
    //                             const Placeholder();
    //                   } catch (e) {
    //                     fco.logger.i('snippetRootNode.toWidget() failed!');
    //                     snippetWidget = Error(key: createNodeWidgetGK(), FLUTTER_TYPE,
    //                         color: Colors.red,
    //                         size: 16,
    //                         errorMsg: e.toString());
    //                   }
    //                   var gk = createNodeWidgetGK();
    //                   return Placeholder(
    //                     key: gk,
    //                     fallbackWidth: width ?? 400,
    //                     fallbackHeight: height ?? 400,
    //                     child: snippetWidget,
    //                   );
    //                 },
    //               );
    //       });
    // } else {
    var gk = createNodeWidgetGK();
    // fco.logger.i('PlaceholderNode created with uid:$uid, gk: $gk');
    return Placeholder(
      key: gk,
      fallbackWidth: width ?? 400,
      fallbackHeight: height ?? 400,
      // child: childWidget,
    );
    // }
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''Placeholder(
  //       fallbackWidth: $width,
  //       fallbackHeight: $height,
  //       child: ${child?.toSource(context)},
  //     )''';
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "placeholder name",
  //           text: name,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             name = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "default snippet name",
  //           text: defaultSnippetName,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             defaultSnippetName = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       SizedBox(height: 10),
  //       Row(
  //         children: [
  //           SizedBox(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'width',
  //               originalS: width?.toString() ?? '',
  //               onChangedF: (newWidth) {
  //                 width = double.tryParse(newWidth);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           SizedBox(width: 10),
  //           SizedBox(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'height',
  //               originalS: height?.toString() ?? '',
  //               onChangedF: (newHeight) {
  //                 height = double.tryParse(newHeight);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Placeholder";
}
