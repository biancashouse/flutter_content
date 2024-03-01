import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'button_node.mapper.dart';

@MappableClass(discriminatorKey: 'button', includeSubClasses: buttonSubClasses)
abstract class ButtonNode extends SC with ButtonNodeMappable {
  ButtonStyleGroup? buttonStyleGroup;
  String? namedButtonStyle;
  String? onTapHandlerName;
  CalloutConfigGroup? calloutConfigGroup;

  ButtonNode({
    this.buttonStyleGroup,
    this.namedButtonStyle,
    this.onTapHandlerName,
    this.calloutConfigGroup,
    super.child,
  });

  String? getTapHandlerName() => onTapHandlerName;

  void setTapHandlerName(String newName) => onTapHandlerName = newName;

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
    PropertyGroup(snode: this,
      name: 'buttonStyle',
      
      children: [],
    ),
    StringPropertyValueNode(
      snode:this,
      name: 'namedButtonStyle',
      stringValue: namedButtonStyle,
      onStringChange: (newValue) => refreshWithUpdate(() => namedButtonStyle = newValue),
      calloutButtonSize: const Size(280, 70),
      calloutSize: const Size(280, 70),
    ),
    StringPropertyValueNode(
      snode:this,
      name: 'onTapHandlerName',
      stringValue: onTapHandlerName,
      onStringChange: (newValue) => refreshWithUpdate(() => onTapHandlerName = newValue),
      calloutButtonSize: const Size(280, 70),
      calloutSize: const Size(280, 70),
    ),
    PropertyGroup(snode: this,
      name: 'calloutConfig',
      
      children: [],
    )  ];

  // @override
  // List<PTreeNode> properties() => [ PropertyGroup(snode: this,
  //       toString: 'button properties',
  //       
  //       children: [
  //         PropertyGroup(snode: this,
  //           toString: 'buttonStyle',
  //           
  //           children: [],
  //         ),
  //         StringPropertyValueNode(
  //           toString: 'namedButtonStyle',
  //           stringValue: namedButtonStyle,
  //           onStringChange: (newValue) => namedButtonStyle = newValue,
  //         ),
  //         StringPropertyValueNode(
  //           toString: 'onTapHandlerName',
  //           stringValue: onTapHandlerName,
  //           onStringChange: (newValue) => onTapHandlerName = newValue,
  //         ),
  //         PropertyGroup(snode: this,
  //           toString: 'calloutConfig',
  //           
  //           children: [],
  //         )
  //       ],
  //     );

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) {
  //   // will refresh on scroll
  //   GlobalKey<CalloutConfigEditorState> calloutConfigEditorGK = GlobalKey<CalloutConfigEditorState>();
  //   CalloutConfigEditor calloutConfigEditor = CalloutConfigEditor(
  //     key: calloutConfigEditorGK,
  //     nodeTargetAlignment: calloutConfig?.targetAlignment,
  //     nodeCalloutAlignment: calloutConfig?.calloutAlignment,
  //     nodeArrowType: calloutConfig?.arrowType,
  //     onChangeF: (newTA, newCA, newAT) {
  //       calloutConfig ??= NodeCalloutConfig();
  //       calloutConfig!.targetAlignment = newTA;
  //       calloutConfig!.calloutAlignment = newCA;
  //       calloutConfig!.arrowType = newAT;
  //       bloc.add(const CAPIEvent.forceRefresh());
  //     },
  //   );
  //   // refresh calloutConfigEditor on scroll end
  //   ScrollController scrollController = ScrollController();
  //   //
  //   return [
  //     SizedBox(
  //       width: 600,
  //       height: 600,
  //       child: NotificationListener<ScrollNotification>(
  //         onNotification: (scrollNotification) {
  //           if (scrollNotification is ScrollStartNotification) {
  //           } else if (scrollNotification is ScrollUpdateNotification) {
  //           } else if (scrollNotification is ScrollEndNotification) {
  //             // print('ScrollEndNotification');
  //             Callout.removeOverlay(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.index);
  //             CalloutConfigEditorState? cceState = calloutConfigEditorGK.currentState;
  //             cceState?.reShow();
  //           }
  //           return true;
  //         },
  //         child: ListView(
  //           controller: scrollController,
  //           children: [
  //             const SizedBox(height: 16),
  //             NodePropertyButtonText(
  //                 label: "onTap",
  //                 text: getTapHandlerName(),
  //                 calloutSize: const Size(600, 200),
  //                 onChangeF: (s) {
  //                   setTapHandlerName(s);
  //                   bloc.add(const CAPIEvent.forceRefresh());
  //                 }),
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               width: 290,
  //               height: 300,
  //               child: InputDecorator(
  //                 decoration: InputDecoration(
  //                   labelText: 'button style',
  //                   labelStyle: Useful.enclosureLabelTextStyle,
  //                   border: const OutlineInputBorder(gapPadding: 0.0),
  //                 ), // isDense: false,
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       mainAxisSize: MainAxisSize.max,
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         NodePropertyButtonColor(
  //                           label: "foreground",
  //                           originalColor: buttonStyle?.fgColorValue != null ? Color(buttonStyle!.fgColorValue!) : null,
  //                           onChangeF: (newColor) {
  //                             buttonStyle ??= NodeButtonStyle();
  //                             buttonStyle!.fgColorValue = newColor?.value;
  //                             bloc.add(const CAPIEvent.forceRefresh());
  //                           },
  //                         ),
  //                         NodePropertyButtonColor(
  //                           label: "background",
  //                           originalColor: buttonStyle?.bgColorValue != null ? Color(buttonStyle!.bgColorValue!) : null,
  //                           onChangeF: (newColor) {
  //                             buttonStyle ??= NodeButtonStyle();
  //                             buttonStyle!.bgColorValue = newColor?.value;
  //                             bloc.add(const CAPIEvent.forceRefresh());
  //                           },
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(height: 16),
  //                     Row(
  //                       mainAxisSize: MainAxisSize.max,
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         SizedBox(
  //                           width: 130,
  //                           height: 40,
  //                           child: DecimalEditor(
  //                             label: 'button padding',
  //                             originalS: buttonStyle?.padding?.toString() ?? '',
  //                             onChangedF: (newValue) {
  //                               buttonStyle ??= NodeButtonStyle();
  //                               buttonStyle!.padding = double.tryParse(newValue);
  //                               bloc.add(const CAPIEvent.forceRefresh());
  //                             },
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 140,
  //                           height: 40,
  //                           child: DecimalEditor(
  //                             label: 'button elevation',
  //                             originalS: buttonStyle?.elevation?.toString() ?? '',
  //                             onChangedF: (newValue) {
  //                               buttonStyle ??= NodeButtonStyle();
  //                               buttonStyle!.elevation = double.tryParse(newValue);
  //                               bloc.add(const CAPIEvent.forceRefresh());
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(height: 16),
  //                     SizedBox(
  //                       height: 140,
  //                       child: InputDecorator(
  //                         decoration: InputDecoration(
  //                           labelText: 'border',
  //                           labelStyle: Useful.enclosureLabelTextStyle,
  //                           border: const OutlineInputBorder(gapPadding: 0.0),
  //                         ), // isDense: false,
  //                         child: Column(
  //                           children: [
  //                             NodePropertyButtonOutlinedBorder(
  //                               label: 'shape (OutlinedBorder)',
  //                               ob: buttonStyle?.shape,
  //                               onChangeF: (newValue) {
  //                                 buttonStyle ??= NodeButtonStyle();
  //                                 buttonStyle!.shape = newValue;
  //                                 bloc.add(const CAPIEvent.forceRefresh());
  //                               },
  //                             ),
  //                             const SizedBox(height: 16),
  //                             Row(
  //                               mainAxisSize: MainAxisSize.max,
  //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                               children: [
  //                                 NodePropertyButtonColor(
  //                                   label: "color",
  //                                   originalColor: buttonStyle?.side?.colorValue != null ? Color(buttonStyle!.side!.colorValue!) : null,
  //                                   onChangeF: (newColor) {
  //                                     buttonStyle ??= NodeButtonStyle();
  //                                     buttonStyle!.side ??= NodeBorderSide();
  //                                     buttonStyle!.side!.colorValue = newColor?.value;
  //                                     bloc.add(const CAPIEvent.forceRefresh());
  //                                   },
  //                                 ),
  //                                 SizedBox(
  //                                   width: 140,
  //                                   height: 40,
  //                                   child: DecimalEditor(
  //                                     label: 'thickness',
  //                                     originalS: buttonStyle?.side?.width?.toString() ?? '',
  //                                     onChangedF: (newValue) {
  //                                       buttonStyle ??= NodeButtonStyle();
  //                                       buttonStyle!.side ??= NodeBorderSide();
  //                                       buttonStyle!.side!.width = double.tryParse(newValue);
  //                                       bloc.add(const CAPIEvent.forceRefresh());
  //                                     },
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 140,
  //                                   height: 40,
  //                                   child: DecimalEditor(
  //                                     label: 'radius',
  //                                     originalS: buttonStyle?.radius?.toString() ?? '',
  //                                     onChangedF: (newValue) {
  //                                       buttonStyle ??= NodeButtonStyle();
  //                                       buttonStyle!.radius = double.tryParse(newValue);
  //                                       bloc.add(const CAPIEvent.forceRefresh());
  //                                     },
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             // CALLOUT CONFIG
  //             if (allowButtonCallouts) const SizedBox(height: 16),
  //             if (allowButtonCallouts)
  //               SizedBox(
  //                 width: 600,
  //                 height: (calloutConfig?.contentSnippetName?.isNotEmpty ?? false) ? 600 : 80,
  //                 child: InputDecorator(
  //                   decoration: InputDecoration(
  //                     labelText: 'callout',
  //                     labelStyle: Useful.enclosureLabelTextStyle,
  //                     border: const OutlineInputBorder(),
  //                     // isDense: false,
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       NodePropertyButtonText(
  //                           label: "contents snippet name",
  //                           text: calloutConfig?.contentSnippetName,
  //                           calloutSize: const Size(600, 200),
  //                           onChangeF: (s) {
  //                             calloutConfig ??= NodeCalloutConfig();
  //                             calloutConfig!.contentSnippetName = s;
  //                             bloc.add(CAPIEvent.forceRefresh());
  //                             Useful.afterNextBuildDo(() {
  //                               Useful.om.refreshAll();
  //                             });
  //                             // bloc.add(const CAPIEvent.forceRefresh());
  //                           }),
  //                       if (calloutConfig?.contentSnippetName?.isNotEmpty ?? false) // SIZE CONSTRAINTS...
  //                         const SizedBox(height: 16),
  //                       if (calloutConfig?.contentSnippetName?.isNotEmpty ?? false) // SIZE CONSTRAINTS...
  //                         calloutConfigEditor,
  //                     ],
  //                   ),
  //                 ),
  //               ), // SIZE CONSTRAINTS...
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               width: 200,
  //               height: 80,
  //               child: InputDecorator(
  //                 decoration: InputDecoration(
  //                   labelText: 'button minSize',
  //                   labelStyle: Useful.enclosureLabelTextStyle,
  //                   border: const OutlineInputBorder(),
  //                   // isDense: false,
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     SizedBox(
  //                       width: 80,
  //                       height: 40,
  //                       child: DecimalEditor(
  //                         label: 'width',
  //                         originalS: buttonStyle?.minW?.toString() ?? '',
  //                         onChangedF: (newValue) {
  //                           buttonStyle ??= NodeButtonStyle();
  //                           buttonStyle!.minW = double.tryParse(newValue);
  //                           bloc.add(const CAPIEvent.forceRefresh());
  //                         },
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 80,
  //                       height: 40,
  //                       child: DecimalEditor(
  //                         label: 'height',
  //                         originalS: buttonStyle?.minH?.toString() ?? '',
  //                         onChangedF: (newValue) {
  //                           buttonStyle ??= NodeButtonStyle();
  //                           buttonStyle!.minH = double.tryParse(newValue);
  //                           bloc.add(const CAPIEvent.forceRefresh());
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               width: 200,
  //               height: 80,
  //               child: InputDecorator(
  //                 decoration: InputDecoration(
  //                   labelText: 'button maxSize',
  //                   labelStyle: Useful.enclosureLabelTextStyle,
  //                   border: const OutlineInputBorder(),
  //                   // isDense: false,
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     SizedBox(
  //                       width: 80,
  //                       height: 40,
  //                       child: DecimalEditor(
  //                         label: 'width',
  //                         originalS: buttonStyle?.maxW?.toString() ?? '',
  //                         onChangedF: (newValue) {
  //                           buttonStyle ??= NodeButtonStyle();
  //                           buttonStyle!.maxW = double.tryParse(newValue);
  //                           bloc.add(const CAPIEvent.forceRefresh());
  //                         },
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 80,
  //                       height: 40,
  //                       child: DecimalEditor(
  //                         label: 'height',
  //                         originalS: buttonStyle?.maxH?.toString() ?? '',
  //                         onChangedF: (newValue) {
  //                           buttonStyle ??= NodeButtonStyle();
  //                           buttonStyle!.maxH = double.tryParse(newValue);
  //                           bloc.add(const CAPIEvent.forceRefresh());
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               width: 200,
  //               height: 80,
  //               child: InputDecorator(
  //                 decoration: InputDecoration(
  //                   labelText: 'button fixedSize',
  //                   labelStyle: Useful.enclosureLabelTextStyle,
  //                   border: const OutlineInputBorder(),
  //                   // isDense: false,
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     SizedBox(
  //                       width: 80,
  //                       height: 40,
  //                       child: DecimalEditor(
  //                         label: 'width',
  //                         originalS: buttonStyle?.fixedW?.toString() ?? '',
  //                         onChangedF: (newValue) {
  //                           buttonStyle ??= NodeButtonStyle();
  //                           buttonStyle!.fixedW = double.tryParse(newValue);
  //                           bloc.add(const CAPIEvent.forceRefresh());
  //                         },
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 80,
  //                       height: 40,
  //                       child: DecimalEditor(
  //                         label: 'height',
  //                         originalS: buttonStyle?.fixedH?.toString() ?? '',
  //                         onChangedF: (newValue) {
  //                           buttonStyle ??= NodeButtonStyle();
  //                           buttonStyle!.fixedH = double.tryParse(newValue);
  //                           bloc.add(const CAPIEvent.forceRefresh());
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ];
  // }

  @override
  Size get nodeAddersAndPropertiesCalloutSize => const Size(460, 600);
}
