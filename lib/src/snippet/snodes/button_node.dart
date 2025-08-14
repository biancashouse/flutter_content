import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/button_style_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/button_style_hook.dart';
import 'package:go_router/go_router.dart';

part 'button_node.mapper.dart';

@MappableClass(discriminatorKey: 'button', includeSubClasses: buttonSubClasses)
abstract class ButtonNode extends SC with ButtonNodeMappable {
  // deprecated: use tabbar instead
  // when populating a panel with a snippet
  // String? destinationPanelOrPlaceholderName;
  // String? destinationSnippetName;

  // when navigating to path, which is also used as the page's snippet name
  String? destinationRoutePathSnippetName;

  // SnippetTemplateEnum? template;

  @MappableField(hook: ButtonStyleHook())
  ButtonStyleProperties bsPropGroup;
  String? onTapHandlerName;

  // client supplied onTap (list of handlers supplied to FlutterContentApp)

  CalloutConfigModel? calloutConfig;

  ButtonNode({
    // this.destinationPanelOrPlaceholderName,
    // this.destinationSnippetName,
    this.destinationRoutePathSnippetName,
    // this.template,
    required this.bsPropGroup,
    this.onTapHandlerName,
    this.calloutConfig,
    super.child,
  });

  ButtonStyle? defaultButtonStyle();

  String? getTapHandlerName() => onTapHandlerName;

  void setTapHandlerName(String newName) => onTapHandlerName = newName;

  @override
  ButtonStyleProperties? buttonStyleProperties() => bsPropGroup;

  @override
  void setButtonStyleProperties(ButtonStyleProperties newProps) =>
      bsPropGroup = newProps;

  @override
  TextStyleProperties? textStyleProperties() => bsPropGroup.tsPropGroup;

  @override
  void setTextStyleProperties(TextStyleProperties newProps) =>
      bsPropGroup.tsPropGroup = newProps;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    return [
      PNode /*Group*/ (
        snode: this,
        name: 'goto Page...',
        children: [
          FYIPNode(
            label: "about page links...",
            msg:
                "tapping the button\nnavigates the user to\nthe page defined by\n'destination Route Path'",
            snode: this,
            name: 'page-linking',
          ),
          StringPNode(
            snode: this,
            name: 'destination Route Path',
            stringValue: destinationRoutePathSnippetName,
            onStringChange: (newValue) {
              refreshWithUpdate(
                context,
                () => destinationRoutePathSnippetName =
                    (newValue == null || newValue.startsWith('/')
                    ? newValue
                    : "/$newValue"),
              );
            },
            options: fco.pageList,
            calloutButtonSize: const Size(240, 70),
            calloutWidth: 280,
          ),
        ],
      ),
      // removed snippet place naming functionality - use tab bar instead
      // if (fco.placeNames.isNotEmpty)
      //   PNode /*Group*/ (
      //     snode: this,
      //     name: 'show Snippet in Panel...',
      //     children: [
      //       StringPNode(
      //         snode: this,
      //         name: 'destination Panel Name',
      //         options: fco.placeNames,
      //         stringValue: destinationPanelOrPlaceholderName,
      //         onStringChange: (newValue) {
      //           refreshWithUpdate(context,
      //               () => destinationPanelOrPlaceholderName = newValue);
      //         },
      //         calloutButtonSize: const Size(240, 70),
      //         calloutWidth: 280,
      //       ),
      //       StringPNode(
      //         snode: this,
      //         name: 'destination Snippet Name',
      //         stringValue: destinationSnippetName,
      //         onStringChange: (newValue) {
      //           refreshWithUpdate(
      //               context, () => destinationSnippetName = newValue);
      //         },
      //         calloutButtonSize: const Size(240, 70),
      //         calloutWidth: 280,
      //       )
      //     ],
      //   ),
      ButtonStylePNode /*Group*/ (
        snode: this,
        name: 'buttonStyle',
        buttonStyleGroup: bsPropGroup,
        onGroupChange: (newValue, refreshPTree) {
          refreshWithUpdate(context, () {
            bsPropGroup = newValue;
            if (refreshPTree) {
              forcePropertyTreeRefresh(context);
            }
          });
        },
      ),
      if (fco.handlers().isNotEmpty)
        StringPNode(
          snode: this,
          name: 'onTapHandlerName',
          stringValue: onTapHandlerName,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => onTapHandlerName = newValue),
          calloutButtonSize: const Size(240, 70),
          calloutWidth: 280,
        ),
      // PNode /*Group*/ (
      //   snode: this,
      //   name: 'calloutConfig',
      //   children: [],
      // )
    ];
  }

  CalloutId? get cid => calloutConfig?.cId;

  void onPressed(
    BuildContext context,
    GlobalKey gk,
    ScrollControllerName? scName,
  ) {
    if (onTapHandlerName != null) {
      fco.namedCallbacks[onTapHandlerName!]?.call(context, gk);
    } else if (cid != null) {
      // possible callout
      // Widget contents = SnippetPanel.getWidget(calloutConfig!.contentSnippetName!, context);
      Future.delayed(
        const Duration(seconds: 1),
        () => fco.showOverlay(
          targetGkF: () => fco.getCalloutGk(cid),
          calloutContent: ContentBuilder.fromSnippet(
            panelName: calloutConfig!.cId,
            snippetName: BODY_PLACEHOLDER,
            // allowButtonCallouts: false,
            scName: scName,
          ),
          calloutConfig: CalloutConfigModel(
            cId: cid!,
            initialTargetAlignment:
                calloutConfig!.initialTargetAlignment ??
                AlignmentEnum.bottomRight,
            initialCalloutAlignment:
                calloutConfig!.initialTargetAlignment != null
                ? calloutConfig!.initialTargetAlignment!.oppositeEnum
                : AlignmentEnum.topLeft,
            initialCalloutW: 200,
            initialCalloutH: 150,
            arrowType: calloutConfig?.arrowType ?? ArrowTypeEnum.POINTY,
            finalSeparation: 100,
            barrier: CalloutBarrierConfig(
              opacity: 0.1,
              onTappedF: () async {
                fco.dismiss(cid!);
              },
            ),
            fillColor: calloutConfig?.fillColor,
            scrollControllerName: scName,
          ),
        ),
      );
    } else if (destinationRoutePathSnippetName != null) {
      fco.addSubRoute(newPath: destinationRoutePathSnippetName!);
      fco.pageList.add(destinationRoutePathSnippetName!);
      context.replace(destinationRoutePathSnippetName!);
      // create a GoRoute and load or create snippet with pageName
      // } else if (destinationPanelOrPlaceholderName != null &&
      //     destinationSnippetName != null) {
      //   destinationSnippetName ??=
      //       '$destinationPanelOrPlaceholderName:default-snippet';
      //   capiBloc.add(CAPIEvent.setPanelOrPlaceholderSnippet(
      //     snippetName: destinationSnippetName!,
      //     panelName: destinationPanelOrPlaceholderName!,
      //   ));
    }
  }

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
  //         StringPNode(
  //           toString: 'namedButtonStyle',
  //           stringValue: namedButtonStyle,
  //           onStringChange: (newValue) => namedButtonStyle = newValue,
  //         ),
  //         StringPNode(
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
  //             // fco.logger.i('ScrollEndNotification');
  //             fco.removeOverlay(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.index);
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
  //                   labelStyle: FCO.enclosureLabelTextStyle,
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
  //                           labelStyle: FCO.enclosureLabelTextStyle,
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
  //                     labelStyle: FCO.enclosureLabelTextStyle,
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
  //                             fco.afterNextBuildDo(() {
  //                               FCO.om.refreshAll();
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
  //                   labelStyle: FCO.enclosureLabelTextStyle,
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
  //                   labelStyle: FCO.enclosureLabelTextStyle,
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
  //                   labelStyle: FCO.enclosureLabelTextStyle,
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

  Size get nodeAddersAndPropertiesCalloutSize => const Size(460, 600);
}
