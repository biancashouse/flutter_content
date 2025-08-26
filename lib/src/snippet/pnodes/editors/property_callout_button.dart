import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class PropertyCalloutButton extends StatelessWidget {
  final CalloutId cId;
  final AlignmentEnum alignment;
  final String? label;
  final String? tooltip;
  final Widget? labelWidget;
  final WidgetBuilder calloutContents;
  final Color menuBgColor;
  final AlignmentEnum? initialTargetAlignment;
  final AlignmentEnum? initialCalloutAlignment;
  final bool? draggable;
  final Size calloutButtonSize;
  final Color calloutButtonColor;
  final Size calloutSize;
  final VoidCallback? onDismissedF;
  // final ValueNotifier<int> notifier;
  final ScrollControllerName? scName;

  const PropertyCalloutButton({
    required this.cId,
    this.alignment = AlignmentEnum.centerLeft,
    this.label,
    this.tooltip,
    this.labelWidget,
    required this.calloutContents,
    required this.calloutButtonSize,
    this.calloutButtonColor = Colors.purpleAccent,
    required this.calloutSize,
    this.initialTargetAlignment,
    this.initialCalloutAlignment,
    this.menuBgColor = Colors.purpleAccent,
    this.draggable,
    this.onDismissedF,
    // required this.notifier,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final notifier = ValueNotifier<int>(0);

    CalloutConfigModel config = CalloutConfigModel(
      cId: cId,
      initialCalloutW: calloutSize.width,
      initialCalloutH: calloutSize.height,
      arrowType: ArrowTypeEnum.NONE,
      // arrowColor: Colors.blueAccent,
      fillColor: ColorModel.fromColor(menuBgColor),
      //alwaysReCalcSize: true,
      initialTargetAlignment: initialTargetAlignment ?? AlignmentEnum.centerRight,
      initialCalloutAlignment: initialCalloutAlignment ?? AlignmentEnum.centerLeft,
      draggable: draggable ?? true,
      onDragStartedF: () {
        // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
      },
      onDragEndedF: (_) {
        // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
      },
      movedOrResizedNotifier: notifier,
      barrier: CalloutBarrierConfig(
        opacity: .1,
        onTappedF: () async {
          // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
          fco.dismiss(cId);
        },
      ),
      // containsTextField: true,
      resizeableH: false,
      resizeableV: false,
      borderRadius: 16,
      onDismissedF: onDismissedF,
      scrollControllerName: scName,
    );

    return WrappedCallout(
      calloutConfig: config,
      calloutBoxContentBuilderF: (ctx) => calloutContents(ctx),
      targetChangedNotifier: notifier,
      targetBuilderF: (ctx) => GestureDetector(
        onTap: (){
          fco.unhideParentCallout(ctx, animateSeparation: false);
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Tooltip(message: cId,
            child: Container(
              // key: propertyBtnGK,
              // margin: const EdgeInsets.only(top: 8),
              width: calloutButtonSize.width,
              height: calloutButtonSize.height,
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              color: calloutButtonColor,
              alignment: alignment.flutterValue,
              child: labelWidget ?? (label != null ? fco.coloredText(label!, color: Colors.white, ) : const Offstage()),
            ),
          ),
        ),
      ),
    );
  }
}
