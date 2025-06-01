import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/m/comment_m.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';
import 'package:flutter_content/src/algc/widgets/pkg_step_widget.dart';

class TappableCommentBtn extends StatelessWidget {
  final FlowchartM flowchart;
  final bool isBeginStep;
  final bool isEndStep;
  final StepM? step;
  final bool bigger;
  final ScrollControllerName? scName;

  const TappableCommentBtn({
    required this.flowchart,
    required this.isBeginStep,
    required this.isEndStep,
    this.step,
    this.bigger = false,
    this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int index = 0;
    CommentM? comment;
    if (isBeginStep && flowchart.beginComment != null) {
      index = 1;
      comment = flowchart.beginComment;
    } else if (isEndStep && flowchart.endComment != null) {
      index = flowchart.countEarlierComments(null) +
          (flowchart.endComment != null ? 1 : 0);
      comment = flowchart.endComment;
    } else {
      index = flowchart.countEarlierComments(step) +
          (step!.comment != null ? 1 : 0);
      comment = step!.comment;
    }

    return GestureDetector(
        onTap: () async {
          if (comment == null) return;
          playComment(
            context,
            flowchart,
            isBeginStep,
            isEndStep,
            step,
            bigger,
            scName,
            comment,
          );
        },
        onLongPress: () async {
          if (comment == null) return;
          playComment(
            context,
            flowchart,
            isBeginStep,
            isEndStep,
            step,
            bigger,
            scName,
            comment,
            onReadyF: () {},
          );
        },
        child: PkgStepWidget.commentNumberWidget(index, bigger: bigger));
  }

  // returns comment root widget
  static void playComment(
    context,
    FlowchartM flowchart,
    bool isBeginStep,
    bool isEndStep,
    StepM? step,
    bool bigger,
    ScrollControllerName? scName,
    CommentM comment, {
    VoidCallback? onReadyF,
  }) {
    final commentSnippetWidget = BlocBuilder<CAPIBloC, CAPIState>(
      builder: (context, state) {
        return comment.snippet!.child?.toWidget(context, comment.snippet) ??
            const Placeholder();
      },
    );
    int stepId = step?.id ??
        (isBeginStep ? FlowchartM.BEGIN_STEP_ID : FlowchartM.END_STEP_ID);
    fco.showOverlay(
      onReadyF: onReadyF,
      calloutConfig: CalloutConfigModel(
        cId: 'comment-snippet',
        initialCalloutW: comment.calloutWidth,
        initialCalloutH: comment.calloutHeight,
        fillColor: ColorModel.fromColor(Colors.purple),
        borderThickness: 5,
        borderRadius: 16,
        borderColor: ColorModel.fromColor(Colors.yellow),
        elevation: 10,
        scrollControllerName: scName,
      ),
      calloutContent: commentSnippetWidget,
      targetGkF: () => flowchart.stepGK(stepId),
    );
  }
}
