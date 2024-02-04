import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class NodePropertyCalloutButton extends StatefulWidget {
  final Alignment alignment;
  final String? label;
  final Widget? labelWidget;
  final WidgetBuilder calloutContents;
  final Color menuBgColor;
  final Alignment? initialTargetAlignment;
  final Alignment? initialCalloutAlignment;
  final bool? draggable;
  final Size calloutButtonSize;
  final Size calloutSize;

  const NodePropertyCalloutButton({
    this.alignment = Alignment.centerLeft,
    this.label,
    this.labelWidget,
    required this.calloutContents,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.initialTargetAlignment,
    this.initialCalloutAlignment,
    this.menuBgColor = Colors.purpleAccent,
    this.draggable,
    super.key,
  });

  @override
  State<NodePropertyCalloutButton> createState() => _NodePropertyCalloutButtonState();
}

class _NodePropertyCalloutButtonState extends State<NodePropertyCalloutButton> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: (){
      //   // TODO revert to original
      // },
      onTap: () {
        // CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = true;
        Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
        CalloutConfig config = CalloutConfig(
          feature: NODE_PROPERTY_CALLOUT_BUTTON,
          suppliedCalloutW: widget.calloutSize.width,
          suppliedCalloutH: widget.calloutSize.height,
          arrowType: ArrowType.NO_CONNECTOR,
          // arrowColor: Colors.blueAccent,
          color: widget.menuBgColor,
          //alwaysReCalcSize: true,
          initialTargetAlignment: widget.initialTargetAlignment ?? Alignment.center,
          initialCalloutAlignment: widget.initialCalloutAlignment ?? Alignment.center,
          draggable: widget.draggable ?? true,
          onDragStartedF: () {
            // CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = true;
          },
          onDragEndedF: (_) {
            // CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = false;
          },
          barrier: CalloutBarrier(
            opacity: .1,
            onTappedF: () async {
              // CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = false;
              Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
            },
          ),
          containsTextField: true,
        );
        Callout.showOverlay(
          calloutConfig: config,
          boxContentF: (ctx) => widget.calloutContents(ctx),
          targetGkF: ()=>propertyBtnGK,
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
        //     CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = true;
        //   },
        //   onDragEndedF: (_) {
        //     CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = false;
        //   },
        //   onBarrierTappedF: () async {
        //     CAPIBloC.I.selectedNode?.hidePropertiesWhileDragging = false;
        //     Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
        //   },
        // ).show();
      },
      child: Container(
        key: propertyBtnGK,
        // margin: const EdgeInsets.only(top: 8),
        width: widget.calloutButtonSize.width,
        height: widget.calloutButtonSize.height,
        // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        color: widget.labelWidget != null ? null : Colors.white70,
        alignment: widget.alignment,
        child: widget.labelWidget ?? (widget.label != null ? Text(widget.label!) : const Offstage()),
      ),
    );
  }
}
