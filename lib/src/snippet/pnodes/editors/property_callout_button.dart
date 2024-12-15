import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class PropertyCalloutButton extends StatelessWidget {
  final Feature cId;
  final Alignment alignment;
  final String? label;
  final String? tooltip;
  final Widget? labelWidget;
  final WidgetBuilder calloutContents;
  final Color menuBgColor;
  final Alignment? initialTargetAlignment;
  final Alignment? initialCalloutAlignment;
  final bool? draggable;
  final Size calloutButtonSize;
  final Size calloutSize;
  final VoidCallback? onDismissedF;
  final ValueNotifier<int> notifier;
  final ScrollControllerName? scName;

  const PropertyCalloutButton({
    required this.cId,
    this.alignment = Alignment.centerLeft,
    this.label,
    this.tooltip,
    this.labelWidget,
    required this.calloutContents,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.initialTargetAlignment,
    this.initialCalloutAlignment,
    this.menuBgColor = Colors.purpleAccent,
    this.draggable,
    this.onDismissedF,
    required this.notifier,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CalloutConfig config = CalloutConfig(
      cId: cId,
      initialCalloutW: calloutSize.width,
      initialCalloutH: calloutSize.height,
      arrowType: ArrowType.NONE,
      // arrowColor: Colors.blueAccent,
      fillColor: menuBgColor,
      //alwaysReCalcSize: true,
      initialTargetAlignment: initialTargetAlignment ?? Alignment.center,
      initialCalloutAlignment: initialCalloutAlignment ?? Alignment.center,
      draggable: draggable ?? true,
      onDragStartedF: () {
        // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
      },
      onDragEndedF: (_) {
        // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
      },
      movedOrResizedNotifier: notifier,
      barrier: CalloutBarrier(
        opacity: .1,
        onTappedF: () async {
          // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
          fco.dismiss(cId);
        },
      ),
      containsTextField: true,
      resizeableH: true,
      resizeableV: true,
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
        child: Tooltip(message: cId,
          child: Container(
            // key: propertyBtnGK,
            // margin: const EdgeInsets.only(top: 8),
            width: calloutButtonSize.width,
            height: calloutButtonSize.height,
            // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            color: labelWidget != null ? null : Colors.white70,
            alignment: alignment,
            child: labelWidget ?? (label != null ? Text(label!) : const Offstage()),
          ),
        ),
      ),
    );
  }
}
