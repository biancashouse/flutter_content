import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/poll_bloc.dart';
import 'package:flutter_content/src/bloc/poll_event.dart';
import 'package:flutter_content/src/bloc/poll_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'flutter_poll.dart';

class FlutterPollOption extends HookWidget {
  final PollOptionId optionId;
  final Widget optionWidget;
  final ScrollControllerName? scName;

  const FlutterPollOption({
    required this.optionId,
    required this.optionWidget,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FlutterPollState? parentPollState = FlutterPoll.of(context);

    if (parentPollState == null) {
      return fco.coloredText('Orphan poll option!', color: Colors.red);
    }

    PollBloC pollBloc = parentPollState.pollBloc;

    return BlocBuilder<PollBloC, PollState>(
      builder: (context, state) {
        int totalVotes = state.totalPollVoteCount();
        int optionVotes = state.optionVoteCounts[optionId] ?? 0;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: pollBloc.state.userAlreadyVoted() ||
                  pollBloc.state.pollHasEnded()
              ? Container(
                  key: UniqueKey(),
                  margin: EdgeInsets.only(
                    bottom: parentPollState.widget.heightBetweenOptions ?? 8,
                  ),
                  decoration: parentPollState.widget.votedPollOptionsBorder !=
                          null
                      ? BoxDecoration(
                          border: parentPollState.widget.votedPollOptionsBorder,
                          borderRadius: BorderRadius.all(
                            parentPollState.widget.votedPollOptionsRadius ??
                                const Radius.circular(8),
                          ),
                        )
                      : null,
                  child: LinearPercentIndicator(
                    width: parentPollState.widget.pollOptionsWidth,
                    lineHeight: parentPollState.widget.pollOptionsHeight!,
                    barRadius: parentPollState.widget.votedPollOptionsRadius ??
                        const Radius.circular(8),
                    padding: EdgeInsets.zero,
                    percent: totalVotes == 0 ? 0 : optionVotes / totalVotes,
                    animation: true,
                    animationDuration:
                        parentPollState.widget.votedAnimationDuration,
                    backgroundColor:
                        parentPollState.widget.votedBackgroundColor,
                    progressColor: pollBloc.state.userVote?.optionId == optionId
                        ? parentPollState.widget.votedProgressColor
                        : parentPollState.widget.leadingVotedProgessColor,
                    center: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      child: Row(
                        children: [
                          optionWidget,
                          const SizedBox(width: 10),
                          if (pollBloc.state.userVote?.optionId == optionId)
                            parentPollState.widget.votedCheckmark ??
                                const Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Colors.black,
                                  size: 16,
                                ),
                          const Spacer(),
                          Text(
                            totalVotes == 0
                                ? "0 ${parentPollState.widget.votesText}"
                                : '${(optionVotes / totalVotes * 100).toStringAsFixed(1)}%',
                            style:
                                parentPollState.widget.votedPercentageTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  key: UniqueKey(),
                  margin: EdgeInsets.only(
                    bottom: parentPollState.widget.heightBetweenOptions ?? 8,
                  ),
                  child: InkWell(
                    onTap: () async {
                      // if (state.voterId == null) {
                      //   await _showDialog(context, [
                      //     "Please let us know who's voting.",
                      //   ]);
                      //   return;
                      // }

                      if (parentPollState.widget.children.length < 2) {
                        await _showDialog(context, [
                          "Poll must have at least 2 option !",
                        ]);
                        return;
                      }

                      // if (parentPollState.widget.startDate != null &&
                      //     parentPollState.widget.endDate != null) {
                      //   int now = DateTime.now().millisecondsSinceEpoch;
                      //   if (now < parentPollState.widget.startDate! ||
                      //       now > parentPollState.widget.endDate!) {
                      //     await _showDialog(context, [
                      //       now < parentPollState.widget.startDate!
                      //           ? "Poll not started yet !"
                      //           : now > parentPollState.widget.endDate!
                      //               ? "Poll has ended !"
                      //               : "dates don't work !",
                      //     ]);
                      //     return;
                      //   }
                      // }

                      if (!pollBloc.state.userAlreadyVoted()) {
                        final String? vea = fco.localStorage.read('vea');
                        if (vea == null) {
                          final gcrServerUrl = fco.gcrServerUrl;
                          if (gcrServerUrl != null) {
                            fco.showPasswordlessStepper(
                              targetGkF: () => key as GlobalKey?,
                              gcrServerUrl: gcrServerUrl,
                              onSignedInF: (ea) {
                                pollBloc.add(
                                  PollEvent.userVoted(
                                      voterId: ea,
                                      poll: parentPollState.widget.poll,
                                      optionId: optionId),
                                );
                              },
                              scName: scName,
                            );
                          } else {
                            fco.logger.d('missing gcr-bh-apps-dart');
                          }
                        } else {
                          pollBloc.add(
                            PollEvent.userVoted(
                                voterId: vea,
                                poll: parentPollState.widget.poll,
                                optionId: optionId),
                          );
                        }
                      }
                    },
                    splashColor: parentPollState.widget.pollOptionsSplashColor,
                    borderRadius:
                        parentPollState.widget.pollOptionsBorderRadius ??
                            BorderRadius.circular(
                              8,
                            ),
                    child: Container(
                      height: parentPollState.widget.pollOptionsHeight,
                      width: parentPollState.widget.pollOptionsWidth,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: pollBloc.state.userVote?.optionId != optionId
                            ? parentPollState.widget.voteInProgressColor
                            : parentPollState.widget.pollOptionsFillColor,
                        border: parentPollState.widget.pollOptionsBorder ??
                            Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                        borderRadius:
                            parentPollState.widget.pollOptionsBorderRadius ??
                                BorderRadius.circular(
                                  8,
                                ),
                      ),
                      child: Center(
                        child: optionWidget,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  Future _showDialog(BuildContext context, List<String> messageLines) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: messageLines.map((txt) => Text(txt)).toList(),
            ),
          ),
        );
      },
    );
  }
}
