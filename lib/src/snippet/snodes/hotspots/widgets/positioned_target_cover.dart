import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/positioned_target_play_btn.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetCover extends StatelessWidget {
  final TargetModel tc;
  final bool playing;
  final int index;
  final TargetsWrapperState wrapperState;

  const TargetCover(
    this.tc,
    this.index, {
    this.playing = false,
    required this.wrapperState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    bool toolbarPresent = fco.anyPresent([
      CalloutConfigToolbar.CID,
    ], includeHidden: true);

    return fco.aSnippetIsBeingEdited || !fco.canEditContent()
        ? CircleAvatar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, .01),
            radius: tc.targetRadius(wrapperState),
          )
        : Draggable<(TargetId, bool)>(
            data: (tc.uid, false),
            feedback: _targetCover(context, tc),
            childWhenDragging: const Offstage(),
            // The child of the Draggable is the visual representation.
            child: DoubleTappable(
              onTap: () => _targetCoverTapped(context),
              onDoubleTap: () => _targetCoverDoubleTapped(context),
              child: _targetCover(context, tc),
            ),
          );
  }

  void _targetCoverTapped(BuildContext context) {
    if (fco.snippetBeingEdited != null) {
      return;
    }

    if (tc.hasAHotspot() && !fco.anyPresent([CalloutConfigToolbar.CID])) {
      fco.showToast(
        textColor: Colors.purple,
        bgColor: Colors.lightGreenAccent,
        msg:
            "\nTap this target's hotspot instead\n(or double-tap to configure it's callout)\n",
        removeAfterMs: 5000,
        width: fco.scrW * .4,
      );
      return;
    }

    if (fco.anyPresent([tc.contentCId]) && fco.canEditContent()) {
      fco.dismiss(tc.contentCId);
    } else {
      wrapperState.widget.parentNode.playList.toList()
        ..clear()
        ..add(tc);
      playTarget(context, tc, wrapperState);
    }
  }

  void _targetCoverDoubleTapped(BuildContext context) {
    if (fco.snippetBeingEdited != null) return;
    wrapperState.setPlayingOrEditingTc(
      tc,
      () => TargetsWrapper.configureTarget(context, tc, wrapperState),
    );
  }

  Widget _targetCover(BuildContext context, TargetModel tc) {
    // fco.logger.i('_draggableTarget');
    double radius = tc.targetRadius(wrapperState);
    return MouseInfoViewer(
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 2 * radius,
                height: 2 * radius,
                decoration: BoxDecoration(
                  color: tc.hasAHotspot()
                      ? Colors.white.withValues(alpha: .25)
                      : Colors.red.withAlpha(50),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CustomPaint(
                foregroundPainter: TargetPainter(),
                size: Size(radius * 2, radius * 2),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: IntegerCircleAvatar(
                num: index + 1,
                bgColor: tc.bgColor().withValues(alpha: .5),
                radius: radius,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void playTarget(
    BuildContext context,
    TargetModel tc,
    TargetsWrapperState wrapperState,
  ) {
    // cover will now have been rendered with its gk
    var coverGK = tc.gk;
    // fco.logger.i('getTargetGK: $coverGK');
    if (coverGK == null) return;
    // var cc = coverGK?.currentContext;
    // bool mounted = cc?.mounted??false;
    Rect? targetRect = coverGK.globalPaintBounds();
    if (targetRect == null) return;

    // Alignment? ta =
    //     fco.calcTargetAlignmentWithinWrapper(wrapperRect: wrapperRect, targetRect: targetRect);

    // tc.targetsWrapperState()!.setPlayingOrEditingTc(tc);

    // SnippetInfoModel.ensureSnippetInfoPresent(
    //   snippetName: tc.contentCId,
    //   firstSnippetVersion: SnippetRootNode(
    //     name: tc.contentCId,
    //     child: PlaceholderNode(),
    //   ),
    // );
    showHotspotSnippetContentCallout(
      tc: tc,
      justPlaying: true,
      wrapperState: wrapperState,
    );
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
    // canvas.drawCircle(Offset(radius, radius), radius - 8, paintWhite());
    canvas.drawLine(
      Offset(radius - 1, 20),
      Offset(radius - 1, size.height - 20),
      paintWhite(),
    );
    canvas.drawLine(
      Offset(radius, 20),
      Offset(radius, size.height - 20),
      paintPurple(),
    );
    canvas.drawLine(
      Offset(radius + 1, 20),
      Offset(radius + 1, size.height - 20),
      paintWhite(),
    );
    canvas.drawLine(
      Offset(20, radius - 1),
      Offset(size.width - 20, radius - 1),
      paintWhite(),
    );
    canvas.drawLine(
      Offset(20, radius),
      Offset(size.width - 20, radius),
      paintPurple(),
    );
    canvas.drawLine(
      Offset(20, radius + 1),
      Offset(size.width - 20, radius + 1),
      paintWhite(),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
