import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/gotits/gotits_helper_string.dart';
import 'package:flutter_content/src/overlays/callouts/callout_config.dart';

class PlayCalloutButton extends StatefulWidget {
  final Feature feature;
  final Widget? calloutContents;
  final double? contentsWidth;
  final double? contentsHeight;
  final bool shouldAutoSetGotit;
  final Alignment calloutAlignment;
  final Alignment targetAlignment;
  final Color? arrowColor;
  final Axis axis;
  final double? separation;
  final Axis? gotitAxis;
  final Function? onGotitF;

  const PlayCalloutButton({
    required this.feature,
    this.calloutContents,
    this.contentsWidth,
    this.contentsHeight,
    this.shouldAutoSetGotit = false,
    this.calloutAlignment = Alignment.topRight,
    this.targetAlignment = Alignment.bottomRight,
    this.axis = Axis.vertical,
    this.separation = 40.0,
    this.gotitAxis,
    this.onGotitF,
    Key? key,
    this.arrowColor,
  }) : super(key: key);

  @override
  PlayCalloutButtonState createState() => PlayCalloutButtonState();
}

class PlayCalloutButtonState extends State<PlayCalloutButton> {
  final _gk = GlobalKey();

  GlobalKey targetGK() => _gk;

  @override
  Widget build(BuildContext context) {
    bool gotit = GotitsHelper.alreadyGotit(widget.feature);
    return gotit
        ? const Offstage()
        : SizedBox(
            width: 50,
            child: IconButton(
              key: _gk,
              icon: const Blink(
                  child: Icon(
                Icons.info,
                size: 26,
                color: Colors.black,
              )),
              onPressed: () async {
                if (widget.shouldAutoSetGotit) {
                  setState(() async {
                    GotitsHelper.gotit(widget.feature);
                    widget.onGotitF?.call();
                  });
                }

                Callout.showOverlay(
                  calloutConfig: CalloutConfig(
                    feature: widget.feature,
                    suppliedCalloutW: widget.contentsWidth,
                    suppliedCalloutH: widget.contentsHeight,
                    gotitAxis: widget.gotitAxis,
                    onGotitPressedF: widget.onGotitF,
                    initialCalloutAlignment: widget.calloutAlignment,
                    initialTargetAlignment: widget.targetAlignment,
                    finalSeparation: widget.separation??30,
                    arrowColor: widget.arrowColor != null ? widget.arrowColor! : Colors.white,
                    arrowType: ArrowType.MEDIUM_REVERSED,
                    color: Colors.black,
                    roundedCorners: 10,
                    barrier: CalloutBarrier(hasCircularHole: true),
                  ),
                  targetGkF: targetGK,
                  boxContentF: (_) => widget.calloutContents!,
                );
              },
            ));
  }
}

// mixin CanShowGotitBUtton {
//   Widget gotitButton(BuildContext context, Function onGotitPressedFunc) => Blink(IconButton(
//     icon: Icon(
//       Icons.thumb_up,
//       color: Colors.yellow,
//       size: 36.0,
//     ),
//     onPressed: () async {
//       onGotitPressedFunc();
//       CalloutsHelper.removeParentCallout(context, true);
//     },
//   )).
//
// }
// }
//
// /// show the help callout.
// /// if the Function is passed, shows a gotit button
// class _HelpCard extends StatelessWidget with HasGotitPressedF {
//   final Widget help;
//   final double width;
//   final double height;
//   final Function onGotitPressedFunc; // null means don't show a gotit button
//   final Axis axis;
//
//   _HelpCard({
//     @required this.help,
//     this.width,
//     this.height,
//     this.axis,
//     this.onGotitPressedFunc,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: Card(
//         color: Colors.black,
//         elevation: 10,
//         child: Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: onGotitPressedFunc != null
//               ? Flex(
//                   direction: axis,
//                   children: <Widget>[
//                     Expanded(flex: 9, child: help),
//                     Expanded(
//                       flex: 1,
//                       child: Blink(IconButton(
//                         icon: Icon(
//                           Icons.thumb_up,
//                           color: Colors.yellow,
//                           size: 36.0,
//                         ),
//                         onPressed: () async {
//                           onGotitPressedFunc();
//                           CalloutsHelper.removeParentCallout(context, true);
//                         },
//                       )),
//                     )
//                   ],
//                 )
//               : help,
//         ),
//       ),
//     );
//   }
// }
