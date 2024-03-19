import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTarget extends StatelessWidget {
  final TargetConfig tc;

  const PositionedTarget(
    this.tc,
      {super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

  @override
  Widget build(BuildContext context) {
    // in case initialTC replaced by a build ? huh!
    // if (tc != null) {
    double radius = tc.radius;
    return Positioned(
      top: tc.targetStackPos().dy - radius,
      left: tc.targetStackPos().dx - radius,
      child: FC().canEditContent
          ? Draggable(
              key: FC().setMultiTargetGk(tc.uid.toString(), GlobalKey()),
              feedback: _draggableTarget(tc),
              childWhenDragging: const Offstage(),
              dragAnchorStrategy: (Draggable<Object> draggable,
                  BuildContext context, Offset position) {
                return Offset(radius, radius);
              },
              onDragUpdate: (DragUpdateDetails details) {
                Offset newLocalPos = details.localPosition;
                debugPrint(newLocalPos.toString());
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
              child: _draggableTarget(tc),
            )
          : CircleAvatar(
              key: FC().setMultiTargetGk(tc.uid.toString(), GlobalKey()),
              backgroundColor: const Color.fromRGBO(255, 0, 0, .01),
              // backgroundColor: Colors.red,
              radius: radius + 2,
            ),
    );
    // } else {
    //   return const Icon(
    //     Icons.warning,
    //     color: Colors.red,
    //   );
    // // }
  }

  // Widget _draggableTargetNotBeingDragged(context, TargetConfig tc) {
  //   // debugPrint('_draggableTargetNotBeingDragged');
  //   double radius = tc.radius;
  //   return SizedBox(
  //     width: radius * 2,
  //     height: radius * 2,
  //     child: IntegerCircleAvatar(
  //       tc,
  //       num: bloc.state.targetIndex(tc) + 1,
  //       bgColor: tc.calloutColor().withOpacity(.5),
  //       radius: radius,
  //       textColor: FC().canEditContent ? Colors.white : Colors.transparent,
  //       fontSize: 14,
  //     ),
  //   );
  // }

  Widget _draggableTarget(TargetConfig tc) {
    // debugPrint('_draggableTarget');
    double radius = tc.radius;
    return SizedBox(
      width: tc.getScale(bloc.state) * radius * 2,
      height: tc.getScale(bloc.state) * radius * 2,
      child: TargetCover(tc),
    );
  }
}

class TargetCover extends StatelessWidget {
  final TargetConfig tc;

  const TargetCover(this.tc, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('TargetCover');
    double radius = tc.getScale(FC().capiBloc.state) * tc.radius;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 2 * radius,
            height: 2 * radius,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.25),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomPaint(
            foregroundPainter: TargetPainter(),
            size: Size(10 + radius * 2, 10 + radius * 2),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: IntegerCircleAvatar(
            tc,
            num: FC().capiBloc.state.targetIndex(tc) + 1,
            bgColor: tc.calloutColor().withOpacity(.5),
            radius: radius,
            textColor: FC().canEditContent ? Colors.white : Colors.transparent,
            fontSize: 14,
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
    debugPrint('TargetPainter');

    double radius = size.width / 2;
    Paint paintWhite() => Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    // Paint paintBlack() => Paint()
    //   ..color = Colors.black
    //   ..style = PaintingStyle.stroke;
    Paint paintPurple() => Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(radius, radius), radius - 10, paintWhite());
    canvas.drawCircle(Offset(radius, radius), radius - 9, paintPurple());
    canvas.drawCircle(Offset(radius, radius), radius - 8, paintWhite());
    canvas.drawLine(Offset(radius - 1, 20),
        Offset(radius - 1, size.height - 20), paintWhite());
    canvas.drawLine(
        Offset(radius, 20), Offset(radius, size.height - 20), paintPurple());
    canvas.drawLine(Offset(radius + 1, 20),
        Offset(radius + 1, size.height - 20), paintWhite());
    canvas.drawLine(Offset(20, radius - 1), Offset(size.width - 20, radius - 1),
        paintWhite());
    canvas.drawLine(
        Offset(20, radius), Offset(size.width - 20, radius), paintPurple());
    canvas.drawLine(Offset(20, radius + 1), Offset(size.width - 20, radius + 1),
        paintWhite());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
