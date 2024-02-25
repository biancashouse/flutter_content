import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class FCStepper extends StatefulWidget {
  final StepperNode stepperNode;

  const FCStepper(this.stepperNode, {super.key});

  @override
  State<FCStepper> createState() => FCStepperState();
}

class FCStepperState extends State<FCStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    List<STreeNode> children = widget.stepperNode.children;
    List<Step> steps = [];
    children.forEachIndexed((i, childNode) {
      if (childNode is StepNode) {
        steps.add(childNode.toStep(context, i, this));
      }
    });

    return Stepper(
      type: widget.stepperNode.type.flutterValue,
      currentStep: currentStep,
      onStepCancel: currentStep <= 0
          ? null
          : () => setState(() {
                currentStep -= 1;
              }),
      onStepContinue: () {
        final isLastStep = currentStep == steps.length - 1;
        if (isLastStep) {
          print("steps completed.");
        } else {
          if (currentStep <= steps.length) {
            setState(() {
              currentStep += 1;
            });
          }
        }
      },
      onStepTapped: (int index) {
        setState(() {
          currentStep = index;
        });
      },
      steps: steps,
    );
  }
}
