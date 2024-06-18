import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetCover extends StatelessWidget {
  // final TargetsWrapperState parentWrapperState;
  final TargetModel tc;
  final int index;
  const TargetCover(
    this.tc,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // in case initialTC replaced by a build ? huh!
    // if (tc != null) {
    // double radius = tc.radius;
    return FContent().canEditContent
        ? Draggable<(TargetId,bool)>(
            data: (tc.uid,false),
            feedback: _draggableTarget(tc),
            childWhenDragging: const Offstage(),
               child: _draggableTarget(tc),
          )
        : CircleAvatar(
            backgroundColor: const Color.fromRGBO(255, 0, 0, .1),
            // backgroundColor: Colors.red,
            radius: tc.radius + 2,
          );
  }

  Widget _draggableTarget(TargetModel tc) {
    // debugPrint('_draggableTarget');
    return SizedBox(
      width: tc.radius * 2,
      height: tc.radius * 2,
      child: _TargetCover(tc, index),
    );
  }
}

class _TargetCover extends StatelessWidget {
  final TargetModel tc;
  final int index;

  const _TargetCover(this.tc, this.index);

  @override
  Widget build(BuildContext context) {
    // debugPrint('TargetCover');
    double radius = tc.getScale() * tc.radius;
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
            num: index + 1,
            bgColor: tc.calloutColor().withOpacity(.5),
            radius: radius,
            textColor: FContent().canEditContent ? Colors.white : Colors.transparent,
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
    // debugPrint('TargetPainter');

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
