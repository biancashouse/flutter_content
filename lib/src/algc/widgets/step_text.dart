import 'package:flutter/material.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';

class StepText extends StatelessWidget {
  final StepM step;

  const StepText(this.step, {super.key});

  @override
  Widget build(BuildContext context) {
   var txt = step.txt.isEmpty && step.shape != null
        ? step.shape!
        : step.txt;

//    executeAfterBuild(context);

    return Text(
        txt,
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: DEFAULT_T * .9), //step.textStyle,
    );
  }
}