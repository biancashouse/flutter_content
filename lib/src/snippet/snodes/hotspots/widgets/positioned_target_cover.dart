import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetCover extends StatelessWidget {

  // final TargetsWrapperState parentWrapperState;
  final TargetModel tc;
  final int index;
  final Rect wrapperRect;
  final ScrollControllerName? scName;

  const TargetCover(
    this.tc,
    this.index, {
    required this.wrapperRect,
    this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // in case initialTC replaced by a build ? huh!
    // if (tc != null) {
    // double radius = tc.radius;
    bool preventDrag = fco.anyPresent([CalloutConfigToolbar.CID]);
    return fco.canEditContent.value
        ? Draggable<(TargetId, bool)>(
            data: (tc.uid, false),
            feedback:
                preventDrag ? const Offstage() : _draggableTargetCover(tc),
            childWhenDragging: const Offstage(),
            child: _draggableTargetCover(tc),
          )
        : CircleAvatar(
            backgroundColor: const Color.fromRGBO(255, 0, 0, .1),
            // backgroundColor: Colors.red,
            radius: tc.radius + 2,
          );
  }

  Widget _draggableTargetCover(TargetModel tc) {
    // fco.logi('_draggableTarget');
    return Visibility(
      visible: true, //FlutterContentApp.snippetBeingEdited == null,
      child: SizedBox(
        width: tc.radius * 2,
        height: tc.radius * 2,
        child: _TargetCover(
          tc,
          index,
          wrapperRect,
          scName,
        ),
      ),
    );
  }
}

class _TargetCover extends StatelessWidget {
  final TargetModel tc;
  final int index;
  final Rect wrapperRect;
  final ScrollControllerName? scName;

  const _TargetCover(
    this.tc,
    this.index,
    this.wrapperRect,
    this.scName,
  );

  @override
  Widget build(BuildContext context) {
    // fco.logi('TargetCover');
    double radius = tc.getScale() * tc.radius;
    return GestureDetector(
      onDoubleTap: () async {
        TargetsWrapper.configureTarget(
          tc,
          wrapperRect,
          scName,
        );
      },
      child: Stack(
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
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class TargetPainter extends CustomPainter {
  TargetPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // fco.logi('TargetPainter');

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
