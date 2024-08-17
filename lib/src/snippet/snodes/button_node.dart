import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';
import 'package:go_router/go_router.dart';

import '../pnodes/enums/enum_alignment.dart';

part 'button_node.mapper.dart';

@MappableClass(discriminatorKey: 'button', includeSubClasses: buttonSubClasses)
abstract class ButtonNode extends SC with ButtonNodeMappable {
  // when populating a panel with a snippet
  String? destinationPanelOrPlaceholderName;
  String? destinationSnippetName;

  // when navigating to path, which is also used as the page's snippet name
  String? destinationRoutePathSnippetName;
  SnippetTemplateEnum? template;

  ButtonStyleGroup? buttonStyle;
  String? onTapHandlerName; // client supplied onTap (list of handlers supplied to FlutterContentApp)

  CalloutConfigGroup? calloutConfigGroup;

  ButtonNode({
    this.destinationPanelOrPlaceholderName,
    this.destinationSnippetName,
    this.destinationRoutePathSnippetName,
    this.template,
    this.buttonStyle,
    this.onTapHandlerName,
    this.calloutConfigGroup,
    super.child,
  });

  ButtonStyle? defaultButtonStyle();

  String? getTapHandlerName() => onTapHandlerName;

  void setTapHandlerName(String newName) => onTapHandlerName = newName;

  @override
  List<PTreeNode> properties(BuildContext context) => [
        PropertyGroup(
          snode: this,
          name: 'goto Page...',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'destination Route Path',
              stringValue: destinationRoutePathSnippetName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationRoutePathSnippetName = newValue);
              },
              options: fco.pagePaths,
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            ),
          ],
        ),
        PropertyGroup(
          snode: this,
          name: 'show Snippet in Panel...',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'destination Panel Name',
              stringValue: destinationPanelOrPlaceholderName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationPanelOrPlaceholderName = newValue);
              },
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            ),
            StringPropertyValueNode(
              snode: this,
              name: 'destination Snippet Name',
              stringValue: destinationSnippetName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationSnippetName = newValue);
              },
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            )
          ],
        ),
        ButtonStylePropertyGroup(
          snode: this,
          buttonStyleGroup: buttonStyle,
          onGroupChange: (newValue) => refreshWithUpdate(() => buttonStyle = newValue),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'onTapHandlerName',
          stringValue: onTapHandlerName,
          onStringChange: (newValue) => refreshWithUpdate(() => onTapHandlerName = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
        PropertyGroup(
          snode: this,
          name: 'calloutConfig',
          children: [],
        )
      ];

  Feature? get feature => calloutConfigGroup?.contentSnippetName;

  void onPressed(BuildContext context) {
    if (onTapHandlerName != null) {
      fco.namedVoidCallbacks[onTapHandlerName]?.call(context);
    } else if (feature != null) {
      // possible callout
      // Widget contents = SnippetPanel.getWidget(calloutConfig!.contentSnippetName!, context);
      Future.delayed(
        const Duration(seconds: 1),
        () => fca.showOverlay(
            targetGkF: () => fco.getCalloutGk(feature),
            calloutContent: SnippetPanel.fromSnippet(
                  panelName: calloutConfigGroup!.contentSnippetName!,
                  snippetName: BODY_PLACEHOLDER,
                  // allowButtonCallouts: false,
                ),
            calloutConfig: CalloutConfig(
              cId: feature!,
              initialTargetAlignment:
                  calloutConfigGroup!.targetAlignment != null ? calloutConfigGroup!.targetAlignment!.flutterValue : AlignmentEnum.bottomRight.flutterValue,
              initialCalloutAlignment: calloutConfigGroup!.targetAlignment != null
                  ? calloutConfigGroup!.targetAlignment!.oppositeEnum.flutterValue
                  : AlignmentEnum.topLeft.flutterValue,
              initialCalloutW: 200,
              initialCalloutH: 150,
              arrowType: calloutConfigGroup!.arrowType?.flutterValue ?? ArrowType.POINTY,
              finalSeparation: 100,
              barrier: CalloutBarrier(
                opacity: 0.1,
                onTappedF: () async {
                  Callout.dismiss(feature!);
                },
              ),
              fillColor: calloutConfigGroup?.colorValue != null ? Color(calloutConfigGroup!.colorValue!) : Colors.white,
            )),
      );
    } else if (destinationRoutePathSnippetName != null) {
      fco.addRoute(newPath: destinationRoutePathSnippetName!, template: SnippetTemplateEnum.empty);
      context.go(destinationRoutePathSnippetName!);
      // create a GoRoute and load or create snippet with pageName
    } else if (destinationPanelOrPlaceholderName != null && destinationSnippetName != null) {
      destinationSnippetName ??= '$destinationPanelOrPlaceholderName:default-snippet';
      capiBloc.add(CAPIEvent.setPanelOrPlaceholderSnippet(
        snippetName: destinationSnippetName!,
        panelName: destinationPanelOrPlaceholderName!,
      ));
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
  //             // fco.logi('ScrollEndNotification');
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
