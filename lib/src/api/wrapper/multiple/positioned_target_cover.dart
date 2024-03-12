import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

import 'positioned_target_cover_btn.dart';


// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTarget extends StatelessWidget {
  final String name;
  final TargetConfig initialTC;

  const PositionedTarget({
    required this.name,
    required this.initialTC,
    super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

  @override
  Widget build(BuildContext context) {
    TargetGroupWrapperState? parentTW = TargetGroupWrapper.of(context);
    ZoomerState? zoomer = Zoomer.of(context);
    TargetConfig? tc = bloc.state.tcByNameOrUid(initialTC);
    if (tc != null) {
      Size ivSize = TargetGroupWrapper.iwSize(tc.wName);
      double radius = tc.radiusPc != null ? tc.radiusPc! * ivSize.width : 30;
      return Positioned(
      top: tc.targetStackPos().dy - radius,
      left: tc.targetStackPos().dx - radius,
      child: Draggable(
        key: FC().setMultiTargetGk(initialTC.uid.toString(), GlobalKey()),
        feedback: _draggableTargetBeingDragged(tc),
        childWhenDragging: const Offstage(),
        dragAnchorStrategy: (Draggable<Object> draggable, BuildContext context, Offset position) {
          return Offset(radius,radius);
        },
        onDragUpdate: (DragUpdateDetails details) {
          Offset newGlobalPos = details.globalPosition
            //   .translate(
            // parentTW?.widget.ancestorHScrollController?.offset ?? 0.0,
            // parentTW?.widget.ancestorVScrollController?.offset ?? 0.0,
          // )
          ;
          tc.setTargetStackPosPc(newGlobalPos);
        },
        onDragStarted: () {
          debugPrint("drag started");
          //removeSnippetContentCallout(widget.initialTC.snippetName);
        },
        onDragEnd: (DraggableDetails details) {
          // Offset newGlobalPos = details.offset.translate(
          //   parentTW?.widget.ancestorHScrollController?.offset ?? 0.0,
          //   parentTW?.widget.ancestorVScrollController?.offset ?? 0.0,
          // );
          // // tc.setTargetStackPosPc(newGlobalPos);
          // tc.setTargetStackPosPc(newGlobalPos.translate(
          //   tc.getScale(bloc.state) * tc.radius,
          //   tc.getScale(bloc.state) * tc.radius,
          // ));
          bloc.add(CAPIEvent.targetConfigChanged(newTC: tc));

          // bloc.add(CAPIEvent.targetMoved(tc: tc, targetRadius: radius, newGlobalPos: newGlobalPos));
          // Useful.afterNextBuildPassBlocAndDo(bloc, (bloC) {
          //   if (bloC.state.aTargetIsSelected()) {
          //     showTargetConfigToolbarCallout(
          //       bloc, tc,
          //       ancestorHScrollController,
          //       ancestorVScrollController,
          //     );
          //   }
          // });
        },
        child: _draggableTargetNotBeingDragged(context, tc, Colors.white.withOpacity(.1), parentTW, zoomer),
      ),
    );
    } else {
      return const Icon(Icons.warning, color: Colors.red,);
    }
  }

  Widget _draggableTargetNotBeingDragged(context, TargetConfig tc, Color bgColor, parentTW, zoomer) {
    Size ivSize = TargetGroupWrapper.iwSize(tc.wName);
    double radius = tc.radiusPc != null ? tc.radiusPc! * ivSize.width : 30;
    return GestureDetector(
      onDoubleTap: () async {
        Rect? wrapperRect = (parentTW?.widget.key as GlobalKey)
            .globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
        Rect? targetRect = FC()
            .getMultiTargetGk(tc.uid.toString())!
            .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()]!);
        if (wrapperRect != null && targetRect != null) {
          hideAllSingleTargetBtns();
          bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));
          Alignment ta = Useful.calcTargetAlignmentWithinWrapper(
              wrapperRect, targetRect);
          // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
          zoomer.applyTransform(
              tc.transformScale,
              tc.transformScale,
              ta, afterTransformF: () {
            // showTargetConfigToolbarCallout(
            //   tc,
            //   parentTW.widget.ancestorHScrollController,
            //   parentTW.widget.ancestorVScrollController,
            //   onCloseF: () async {
            //     removeTargetConfigToolbarCallout();
            //     transformableWidgetWrapperState.resetTransform();
            //     bloc.add(const CAPIEvent.unhideAllTargetGroups());
            //     unhideAllSingleTargetBtns();
            //   },
            // );
            showSnippetContentCallout(
              // zoomer: parentZoomer,
              initialTC: tc,
              snippetName: tc.snippetName,
              justPlaying: false,
              allowButtonCallouts: false,
              onDiscardedF: () async {
                zoomer.resetTransform();
                bloc.add(const CAPIEvent.unhideAllTargetGroups());
                unhideAllSingleTargetBtns();
              },
            );
            // show config toolbar in a toast
            PositionedTargetPlayBtn.showConfigToolbar(tc, zoomer, parentTW);
          });
        }
      },
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child:
        IntegerCircleAvatar(
          tc,
          num: bloc.state.targetIndex(tc) + 1,
          bgColor: tc.calloutColor().withOpacity(.3),
          radius: radius,
          textColor: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _draggableTargetBeingDragged(TargetConfig tc) {
    Size ivSize = TargetGroupWrapper.iwSize(tc.wName);
    double radius = tc.radiusPc != null ? tc.radiusPc! * ivSize.width : 30;
    return SizedBox(
      width: tc.getScale(bloc.state) * radius * 2,
      height: tc.getScale(bloc.state) * radius * 2,
      child: TargetCover(
        radius: tc.getScale(bloc.state) * radius,
      ),
    );
  }
}

class TargetCover extends StatelessWidget {
  final double radius;

  const TargetCover({required this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 2 * radius,
            height: 2 * radius,
            decoration: BoxDecoration(color: Colors.white.withOpacity(.25), shape: BoxShape.circle),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomPaint(
            foregroundPainter: TargetPainter(),
            size: Size(radius * 2, radius * 2),
          ),
        ),
      ],
    );
  }
}

class TargetPainter extends CustomPainter {
  TargetPainter();

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;
    Paint paintWhite() => Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    Paint paintBlack() => Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    Paint paintPurple() => Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(radius, radius), radius - 10, paintWhite());
    canvas.drawCircle(Offset(radius, radius), radius - 9, paintPurple());
    canvas.drawCircle(Offset(radius, radius), radius - 8, paintWhite());
    canvas.drawLine(Offset(radius-1, 20), Offset(radius-1, size.height - 20), paintWhite());
    canvas.drawLine(Offset(radius, 20), Offset(radius, size.height - 20), paintPurple());
    canvas.drawLine(Offset(radius+1, 20), Offset(radius+1, size.height - 20), paintWhite());
    canvas.drawLine(Offset(20, radius-1), Offset(size.width - 20, radius-1), paintWhite());
    canvas.drawLine(Offset(20, radius), Offset(size.width - 20, radius), paintPurple());
    canvas.drawLine(Offset(20, radius+1), Offset(size.width - 20, radius+1), paintWhite());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

