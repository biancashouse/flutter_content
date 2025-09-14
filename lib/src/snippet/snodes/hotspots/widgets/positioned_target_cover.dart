import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetCover extends StatelessWidget {
  final TargetModel tc;
  final bool playing;
  final int index;
  final Rect wrapperRect;
  final ScrollControllerName? scName;
  final GlobalKey? gk; // only for pulsingPoint

  const TargetCover(
    this.tc,
    this.index, {
    this.playing = false,
    required this.wrapperRect,
    this.scName,
    this.gk,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // in case initialTC replaced by a build ? huh!
    // if (tc != null) {
    // double radius = tc.radius;
    bool preventDrag = fco.anyPresent([CalloutConfigToolbar.CID]);
    return fco.canEditContent() && !playing
        ? Draggable<(TargetId, bool)>(
            data: (tc.uid, false),
            feedback:
                preventDrag ? const Offstage() : _draggableTargetCover(tc),
            childWhenDragging: const Offstage(),
            child: _draggableTargetCover(tc),
          )
        : CircleAvatar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, .01),
            // backgroundColor: Colors.red,
            radius: tc.radius + 2,
          );
  }

  Widget _draggableTargetCover(TargetModel tc) {
    // fco.logger.i('_draggableTarget');
    double radius = tc.getScale() * tc.radius;
    return Visibility(
      visible: true, //fco.snippetBeingEdited == null,
      child: SizedBox(
        width: tc.radius * 2,
        height: tc.radius * 2,
        child: GestureDetector(
          onTap: () {
            if (tc.targetsWrapperState() == null ||
                fco.snippetBeingEdited != null) {
              return;
            }

            if (tc.hasAHotspot() &&
                !fco.anyPresent([CalloutConfigToolbar.CID])) {
              fco.showToast(
                textColor: Colors.purple,
                bgColor: Colors.lightGreenAccent,
                msg:
                    "\nTap this target's hotspot instead\n(or double-tap to configure it's callout)\n",
                removeAfterMs: 5000,
                width: fco.scrW*.4,
              );
              return;
            }

            if (fco.anyPresent([tc.contentCId])) {
              fco.dismiss(tc.contentCId);
            } else {
              tc.targetsWrapperState()!.widget.parentNode.playList.toList()
                ..clear()
                ..add(tc);
              playTarget(tc, wrapperRect, scName);
            }
          },
          onDoubleTap: () async {
            if (fco.snippetBeingEdited != null) return;
            tc.targetsWrapperState()!.setPlayingOrEditingTc(
            tc,
              ()=>TargetsWrapper.configureTarget(
              tc,
              wrapperRect,
              scName,
            ),);
          },
          child: Stack(
            key: gk,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 2 * radius,
                  height: 2 * radius,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .25),
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
                  bgColor:
                      tc.calloutFillColor!.flutterValue.withValues(alpha: .5),
                  radius: radius,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void playTarget(
    TargetModel tc,
    Rect wrapperRect,
    ScrollControllerName? scName,
  ) {
    if (tc.targetsWrapperState() == null) return;

    // cover will now have been rendered with its gk
    var coverGK = fco.getTargetGk(tc.uid);
    // fco.logger.i('getTargetGK: $coverGK');
    if (coverGK == null) return;
    // var cc = coverGK?.currentContext;
    // bool mounted = cc?.mounted??false;
    Rect? targetRect = coverGK.globalPaintBounds();
    if (targetRect == null) return;

    // Alignment? ta =
    //     fco.calcTargetAlignmentWithinWrapper(wrapperRect: wrapperRect, targetRect: targetRect);

    // tc.targetsWrapperState()!.setPlayingOrEditingTc(tc);

    fco.ensureContentSnippetPresent(tc.contentCId).then((_) {
      showSnippetContentCallout(
        tc: tc,
        justPlaying: true,
        wrapperRect: wrapperRect,
        scName: scName,
      );
    });
  }
}

class TargetPainter extends CustomPainter {
  TargetPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // fco.logger.i('TargetPainter');

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
