import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class NodePropertyCalloutButton extends StatelessWidget {
  final Feature feature;
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
  final ValueNotifier<int> notifier;

  const NodePropertyCalloutButton({
    required this.feature,
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
    required this.notifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CalloutConfig config = CalloutConfig(
      feature: feature,
      suppliedCalloutW: calloutSize.width,
      suppliedCalloutH: calloutSize.height,
      arrowType: ArrowType.NO_CONNECTOR,
      // arrowColor: Colors.blueAccent,
      fillColor: menuBgColor,
      //alwaysReCalcSize: true,
      initialTargetAlignment: initialTargetAlignment ?? Alignment.center,
      initialCalloutAlignment: initialCalloutAlignment ?? Alignment.center,
      draggable: draggable ?? true,
      onDragStartedF: () {
        // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
      },
      onDragEndedF: (_) {
        // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
      },
      movedOrResizedNotifier: notifier,
      barrier: CalloutBarrier(
        opacity: .1,
        onTappedF: () async {
          // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
          Callout.dismiss(feature);
        },
      ),
      containsTextField: true,
      resizeableH: true,
      resizeableV: true,
      borderRadius: 16,
    );
    return Callout.wrapTarget(
      calloutConfig: config,
      calloutBoxContentBuilderF: (ctx) => calloutContents(ctx),
      targetChangedNotifier: notifier,
      targetBuilderF: (ctx) => GestureDetector(
        onTap: (){
          Callout.unhideParentCallout(ctx, animateSeparation: false);
        },
        child: Tooltip(message: feature,
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

    return GestureDetector(
      // onDoubleTap: (){
      //   // TODO revert to original
      // },
      onTap: () {
        // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
        Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
        CalloutConfig config = CalloutConfig(
          feature: NODE_PROPERTY_CALLOUT_BUTTON,
          suppliedCalloutW: calloutSize.width,
          suppliedCalloutH: calloutSize.height,
          arrowType: ArrowType.NO_CONNECTOR,
          // arrowColor: Colors.blueAccent,
          fillColor: menuBgColor,
          //alwaysReCalcSize: true,
          initialTargetAlignment: initialTargetAlignment ?? Alignment.center,
          initialCalloutAlignment: initialCalloutAlignment ?? Alignment.center,
          draggable: draggable ?? true,
          onDragStartedF: () {
            // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
          },
          onDragEndedF: (_) {
            // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
          },
          barrier: CalloutBarrier(
            opacity: .1,
            onTappedF: () async {
              // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
              Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
            },
          ),
          containsTextField: true,
        );
        Callout.showOverlay(
          calloutConfig: config,
          boxContentF: (ctx) => calloutContents(ctx),
          // targetGkF: ()=>propertyBtnGK,
        );
        // Callout(
        //   feature: NODE_PROPERTY_CALLOUT_BUTTON,
        //   targetGKF: () => propertyBtnGK,
        //   contents: widget.calloutContents,
        //   width: widget.calloutSize.width,
        //   height: widget.calloutSize.height,
        //   barrierOpacity: .1,
        //   arrowType: ArrowType.VERY_THIN,
        //   arrowColor: Colors.blueAccent,
        //   color: widget.menuBgColor,
        //   alwaysReCalcSize: true,
        //   initialTargetAlignment: widget.initialTargetAlignment ?? Alignment.center,
        //   initialCalloutAlignment: widget.initialCalloutAlignment ?? Alignment.center,
        //   draggable: widget.draggable ?? true,
        //   onDragStartedF: () {
        //     FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
        //   },
        //   onDragEndedF: (_) {
        //     FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
        //   },
        //   onBarrierTappedF: () async {
        //     FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
        //     Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
        //   },
        // ).show();
      },
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
    );
  }
}
