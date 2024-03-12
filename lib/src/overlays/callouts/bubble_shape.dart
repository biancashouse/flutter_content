import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/overlays/callouts/coord.dart';
import 'package:flutter_content/src/overlays/callouts/line.dart';
import 'package:flutter_content/src/overlays/callouts/path_util.dart';

class BubbleShape_OP extends CustomPainter {
  final CalloutConfig calloutConfig;
  final Color? lineColor;
  final Color? fillColor;
  final double thickness;

  BubbleShape_OP({required this.calloutConfig, this.lineColor = Colors.black, this.fillColor = Colors.yellowAccent, this.thickness = 1.5});

  @override
  void paint(Canvas canvas, Size size) {
    Path? path = _drawBubble(calloutConfig, pointyThickness: calloutConfig.calloutH! <= 40 ? 5 : null);
    if (path != null) {
      canvas.drawPath(path, bgPaint(calloutConfig.calloutColor));
      canvas.drawPath(path, linePaint(Colors.black, theThickness: thickness));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path? _drawBubble(CalloutConfig callout, {int? pointyThickness}) {
    Path path = Path();
    callout.calcEndpoints();
    Offset tE = callout.tE?.asOffset ?? Offset.zero;
    if (callout.arrowType == ArrowType.NO_CONNECTOR || (callout.tE == null || callout.cR().contains(tE))) {
      /*
			 * rectangle around calloutR
			 */
      //PathUtil.roundedRect(path, callout.top!, callout.left!, callout.cR().width, callout.cR().height, callout.roundedCorners);
      // debugPrint('no pointy');
    } else {
      Rectangle calloutR = callout.cR();
      Offset cspCentre = calloutR.center;

      // possibly translate tE with callout args + possible scroll offsets
      callout.tE = Coord.fromOffset(
        callout.tE!.asOffset.translate(
          callout.targetTranslateX ?? 0.0,
          callout.targetTranslateY ?? 0.0,
          // )
          // .translate(
          //   -(callout.hScrollController?.offset ?? 0.0),
          //   -(callout.vScrollController?.offset ?? 0.0),
        ),
      );

      // path.translate(-canvasOffset.left, -canvasOffset.top);

      /*
			 * line from tE centre to calloutR centre
			 */
      Line lineCentreToCentre = Line(callout.tE!, Coord.fromOffset(cspCentre));

      /*
			 * point where line intersects rectangle is the centre of the pointy's base. we draw through a
			 * point either side of that.
			 */
      Coord pointyBase = calloutR.snapToRect(Rectangle.getBubbleIntersectionPoint(lineCentreToCentre, calloutR));
      if (Rectangle.NO_INTERSECTION_FOUND.samePointAs(pointyBase)) return null;
      Coord pointyBase1 = calloutR.cleverTraverseClockwise(pointyBase, (pointyThickness ?? PathUtil.DEFAULT_THICKNESS));
      Coord pointyBase2 = calloutR.cleverTraverseAntiClockwise(pointyBase, (pointyThickness ?? PathUtil.DEFAULT_THICKNESS));

      /*
			 * draw clockwise, only drawing corners (if applicable) that would not intersect with the
			 * pointy
			 */

      if (calloutR.onSameSide(pointyBase1, pointyBase2)) {
        double distanceToNextCorner = calloutR.distanceToNextCorner(pointyBase1);
        double distanceToPrevCorner = calloutR.distanceToPreviousCorner(pointyBase2);
        if (distanceToNextCorner > 0 && distanceToNextCorner < callout.roundedCorners) {
          pointyBase1 = calloutR.nextClockwiseCorner(pointyBase1);
          pointyBase2 = calloutR.cleverTraverseAntiClockwise(pointyBase1, (pointyThickness ?? PathUtil.DEFAULT_THICKNESS) * 2);
          _partialRectWith3CornersRounded(path, pointyBase1, pointyBase2, calloutR, callout);
        } else if (distanceToPrevCorner > 0 && distanceToPrevCorner < callout.roundedCorners) {
          pointyBase2 = calloutR.previousClockwiseCorner(pointyBase2);
          pointyBase1 = calloutR.cleverTraverseClockwise(pointyBase2, (pointyThickness ?? PathUtil.DEFAULT_THICKNESS) * 2);
          _partialRectWith3CornersRounded(path, pointyBase1, pointyBase2, calloutR, callout);
        } else {
          _partialRectWithAll4CornersRounded(path, pointyBase1, pointyBase2, calloutR, callout);
        }
      } else {
        _partialRectWith3CornersRounded(path, pointyBase1, pointyBase2, calloutR, callout);
      }

      /*
				 * finally, close shape by drawing pb2 to pointy and back to pb1
				 */
      // debugPrint("path.lineTo(${callout.tE!.x}, ${callout.tE!.y})");
      path.lineTo(callout.tE!.x, callout.tE!.y);
      path.lineTo(pointyBase1.x, pointyBase1.y);
    }
    //path.close();
    return path;
  }

  void _partialRectWithAll4CornersRounded(Path path, Coord pb1, Coord pb2, Rectangle theRect, callout) {
    // debugPrint("partialRectWith4CornersRounded");
    Coord pos = Coord.clone(pb1);
    path.moveTo(pos.x, pos.y);
    // path.addOval(Rect.fromCenter(center: pos.asOffset, width: 4, height: 4)); //TODO TBD
    Side? startingSide = theRect.whichSide(pos);
    if (startingSide == null) {
      debugPrint('startSide NULL!');
      return;
    }
    Side side = startingSide;
    bool allSidesTraversed = false;
    while (!allSidesTraversed) {
      pos = PathUtil.lineToStartOfNextCorner(path, pos, theRect, callout.roundedCorners, side: side);
      if (callout.roundedCorners > 0) pos = PathUtil.turnCornerClockwise(path, pos, theRect, callout.roundedCorners, side: side);
      side = nextSide(side);
      allSidesTraversed = side == startingSide;
    }

    path.lineTo(pb2.x, pb2.y);
// path.stroke();
  }

  void _partialRectWith3CornersRounded(Path path, Coord pb1, Coord pb2, Rectangle theRect, callout) {
    // debugPrint("partialRectWith3CornersRounded");
    Coord pos = Coord.clone(pb1);
    path.moveTo(pos.x, pos.y);
    Side? startingSide = theRect.whichSide(pos);
    if (startingSide == null) {
      debugPrint('startSide NULL!');
      return;
    }
    Side side = startingSide;
    bool threeSidesTraversed = false;
    while (!threeSidesTraversed) {
      pos = PathUtil.lineToStartOfNextCorner(path, pos, theRect, callout.roundedCorners, side: side);
      if (callout.roundedCorners > 0) pos = PathUtil.turnCornerClockwise(path, pos, theRect, callout.roundedCorners, side: side);
      side = nextSide(side);
      threeSidesTraversed = side == previousSide(startingSide);
    }
    path.lineTo(pb2.x, pb2.y);
// path.stroke();
  }
}
