import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gradient_borders/gradient_borders.dart';

class RainbowSurround extends StatelessWidget {
  final Color bgColorAnimation;
  final Widget contents;

  const RainbowSurround({required this.bgColorAnimation, required this.contents, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.purpleAccent]),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          // return LinearGradient(
          //   colors: [Colors.white, Colors.yellow, Colors.yellow]
          // ).createShader(bounds);
          return RadialGradient(
            center: Alignment.topLeft,
            radius: 1,
            colors: <Color>[Colors.white, bgColorAnimation, Colors.white],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: const ShapeDecoration(
            // color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          child: Flex(
            direction: Useful.narrowWidth || Useful.isLandscape ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(child: contents),
            ],
          ),
        ),
      ),
    );
  }
}
