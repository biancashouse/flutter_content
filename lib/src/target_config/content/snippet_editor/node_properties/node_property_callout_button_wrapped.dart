import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';

class NodePropertyCalloutButtonWrapped extends StatefulWidget {
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

  const NodePropertyCalloutButtonWrapped({
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
  State<NodePropertyCalloutButtonWrapped> createState() => _NodePropertyCalloutButtonWrappedState();
}

class _NodePropertyCalloutButtonWrappedState extends State<NodePropertyCalloutButtonWrapped> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Callout.wrapTarget(
    //   calloutConfig: CalloutConfig(
    //     feature: "TESTING",
    //     color: widget.menuBgColor,
    //     initialTargetAlignment: widget.initialTargetAlignment ?? Alignment.centerLeft,
    //     initialCalloutAlignment: widget.initialCalloutAlignment ?? Alignment.centerLeft,
    //   ),
    //   calloutBoxContentBuilderF: (_)=>Container(color: Colors.black, width: 50, height: 50, padding: EdgeInsets.all(10),),
    //   calloutTargetBuilderF: (_)=>Container(color: Colors.black, width: 50, height: 50, padding: EdgeInsets.all(10),),
    // );
    return Callout.wrapTarget(
      calloutConfig: _config(),
      calloutBoxContentBuilderF: widget.calloutContents,
      targetBuilderF: _target,
    );
  }

  Widget _target(opContext) => GestureDetector(
        onTap: () {
          setState(() {
            selected = true;
          });
          Useful.afterNextBuildDo(() {
            Callout.unhideParentCallout(opContext);
            // // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
            // Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
            // CalloutConfig config = CalloutConfig(
            //   feature: NODE_PROPERTY_CALLOUT_BUTTON,
            //   width: widget.calloutSize.width,
            //   height: widget.calloutSize.height,
            //   barrierOpacity: .1,
            //   arrowType: ArrowType.VERY_THIN,
            //   arrowColor: Colors.blueAccent,
            //   color: widget.menuBgColor,
            //   //alwaysReCalcSize: true,
            //   initialTargetAlignment: widget.initialTargetAlignment ?? Alignment.centerLeft,
            //   initialCalloutAlignment: widget.initialCalloutAlignment ?? Alignment.centerLeft,
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
            // );
            // // if (propertyBtnGK.currentWidget != null) {
            // Callout.showOverlay(
            //   context: context,
            //   calloutConfig: config,
            //   boxContentF: (ctx) => widget.calloutContents(),
            //   targetGkF: () => PTreeNode.selectedPropertyGK,
            // );
          });
          // }
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
          // margin: const EdgeInsets.only(top: 8),
          width: widget.calloutButtonSize.width,
          height: widget.calloutButtonSize.height,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          color: widget.labelWidget != null ? null : Colors.white70,
          alignment: widget.alignment,
          child: widget.labelWidget ?? (widget.label != null ? Text(widget.label!) : const Offstage()),
        ),
      );

  CalloutConfig _config() => CalloutConfig(
        feature: NODE_PROPERTY_CALLOUT_BUTTON,
        suppliedCalloutW: widget.calloutSize.width,
        suppliedCalloutH: widget.calloutSize.height,
        barrier: CalloutBarrier(
            opacity: .1,
            onTappedF: () async {
              FC().selectedNode?.hidePropertiesWhileDragging = false;
              Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
            }),
        arrowType: ArrowType.VERY_THIN,
        arrowColor: Colors.blueAccent,
        color: widget.menuBgColor,
        //alwaysReCalcSize: true,
        initialTargetAlignment: widget.initialTargetAlignment ?? Alignment.centerLeft,
        initialCalloutAlignment: widget.initialCalloutAlignment ?? Alignment.centerLeft,
        draggable: widget.draggable ?? true,
        onDragStartedF: () {
          FC().selectedNode?.hidePropertiesWhileDragging = true;
        },
        onDragEndedF: (_) {
          FC().selectedNode?.hidePropertiesWhileDragging = false;
        },
      );
}
