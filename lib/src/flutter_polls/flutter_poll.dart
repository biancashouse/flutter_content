library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/poll_bloc.dart';
import 'package:flutter_content/src/bloc/poll_state.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// FlutterPolls widget.
// This widget is used to display a poll.
// It can be used in any way and also in a [ListView] or [Column].
class FlutterPoll extends StatefulWidget {
  final PollNode poll;

  /// The [optionId] of each poll option is used to identify the option when the user votes.
  /// The [title] of each poll option is displayed to the user.
  /// [title] can be any widget with a bounded size.
  /// The [optionVoteCount] of each poll option is the number of votes that the option has received.
  final List<Widget> children;

  /// The title of the poll. Can be any widget with a bounded size.
  final Widget titleWidget;

  /// Data format for the poll options.
  /// Must be a list of [PollOptionData] objects.
  /// The list must have at least two elements.
  /// The first element is the option that is selected by default.
  /// The second element is the option that is selected by default.
  /// The rest of the elements are the options that are available.
  /// The list can have any number of elements.
  ///
  /// Poll options are displayed in the order they are in the list.
  /// example_using_go_router:
  ///
  /// pollOptions = [
  ///
  ///  PollOption(id: 1, title: Text('Option 1'), votes: 2),
  ///
  ///  PollOption(id: 2, title: Text('Option 2'), votes: 5),
  ///
  ///  PollOption(id: 3, title: Text('Option 3'), votes: 9),
  ///
  ///  PollOption(id: 4, title: Text('Option 4'), votes: 2),
  ///
  /// ]
  ///

  /// The height between the title and the options.
  /// The default value is 10.
  final double? heightBetweenTitleAndOptions;

  /// The height between the options.
  /// The default value is 0.
  final double? heightBetweenOptions;

  /// Votes text. Can be "Votes", "Votos", "Ibo" or whatever language.
  /// If not specified, "Votes" is used.
  final String? votesText;

  /// [votesTextStyle] is the text style of the votes text.
  /// If not specified, the default text style is used.
  /// Styles for [totalVotes] and [votesTextStyle].
  final TextStyle? votesTextStyle;

  /// [metaWidget] is displayed at the bottom of the poll.
  /// It can be any widget with an unbounded size.
  /// If not specified, no meta widget is displayed.
  /// example_using_go_router:
  /// metaWidget = Text('Created by: $createdBy')
  final Widget? metaWidget;

  /// Who started the poll.
  final String? createdBy;

  final int? startDate;
  final int? endDate;

  /// Height of a [PollOption].
  /// The height is the same for all options.
  /// Defaults to 36.
  final double? pollOptionsHeight;

  /// Width of a [PollOption].
  /// The width is the same for all options.
  /// If not specified, the width is set to the width of the poll.
  /// If the poll is not wide enough, the width is set to the width of the poll.
  /// If the poll is too wide, the width is set to the width of the poll.
  final double? pollOptionsWidth;

  /// Border radius of a [PollOption].
  /// The border radius is the same for all options.
  /// Defaults to 0.
  final BorderRadius? pollOptionsBorderRadius;

  /// Border of a [PollOption].
  /// The border is the same for all options.
  /// Defaults to null.
  /// If null, the border is not drawn.
  final BoxBorder? pollOptionsBorder;

  /// Border of a [PollOption] when the user has voted.
  /// The border is the same for all options.
  /// Defaults to null.
  /// If null, the border is not drawn.
  final BoxBorder? votedPollOptionsBorder;

  /// Color of a [PollOption].
  /// The color is the same for all options.
  /// Defaults to [Colors.blue].
  final Color? pollOptionsFillColor;

  /// Splashes a [PollOption] when the user taps it.
  /// Defaults to [Colors.grey].
  final Color? pollOptionsSplashColor;

  /// Radius of the border of a [PollOption] when the user has voted.
  /// Defaults to Radius.circular(8).
  final Radius? votedPollOptionsRadius;

  /// Color of the background of a [PollOption] when the user has voted.
  /// Defaults to [const Color(0xffEEF0EB)].
  final Color? votedBackgroundColor;

  /// Color of the progress bar of a [PollOption] when the user has voted.
  /// Defaults to [const Color(0xff84D2F6)].
  final Color? votedProgressColor;

  /// Color of the leading progress bar of a [PollOption] when the user has voted.
  /// Defaults to [const Color(0xff0496FF)].
  final Color? leadingVotedProgessColor;

  /// Color of the background of a [PollOption] when the user clicks to vote and its still in progress.
  /// Defaults to [const Color(0xffEEF0EB)].
  final Color? voteInProgressColor;

  /// Widget for the checkmark of a [PollOption] when the user has voted.
  /// Defaults to [Icons.check_circle_outline_rounded].
  final Widget? votedCheckmark;

  /// TextStyle of the percentage of a [PollOption] when the user has voted.
  final TextStyle? votedPercentageTextStyle;

  /// Animation duration of the progress bar of the [PollOption]'s when the user has voted.
  /// Defaults to 1000 milliseconds.
  /// If the animation duration is too short, the progress bar will not animate.
  /// If you don't want the progress bar to animate, set this to 0.
  final int votedAnimationDuration;

  /// Loading animation widget for [PollOption] when [onVoted] callback is invoked
  /// Defaults to [CircularProgressIndicator]
  /// Visible until the [onVoted] execution is completed,
  final Widget? loadingWidget;

  const FlutterPoll({
    super.key,
    required this.poll,
    this.loadingWidget,
    required this.titleWidget,
    this.heightBetweenTitleAndOptions = 10,
    this.heightBetweenOptions,
    this.votesText = 'Total Votes:',
    this.votesTextStyle,
    this.metaWidget,
    this.createdBy,
    this.startDate,
    this.endDate,
    this.pollOptionsHeight = 36,
    this.pollOptionsWidth,
    this.pollOptionsBorderRadius,
    this.pollOptionsFillColor,
    this.pollOptionsSplashColor = Colors.grey,
    this.pollOptionsBorder,
    this.votedPollOptionsBorder,
    this.votedPollOptionsRadius,
    this.votedBackgroundColor = const Color(0xffEEF0EB),
    this.votedProgressColor = const Color(0xff84D2F6),
    this.leadingVotedProgessColor = const Color(0xff0496FF),
    this.voteInProgressColor = const Color(0xffEEF0EB),
    this.votedCheckmark,
    this.votedPercentageTextStyle,
    this.votedAnimationDuration = 1000,
    required this.children,
  });

  static FlutterPollState? of(BuildContext context) =>
      context.findAncestorStateOfType<FlutterPollState>();

  @override
  State<FlutterPoll> createState() => FlutterPollState();
}

class FlutterPollState extends State<FlutterPoll> {
  late String voterId;
  late Future<PollBloC> fInitPoll;
  late PollBloC pollBloc;

  @override
  void initState() {
    super.initState();
    fInitPoll = _initPoll();
  }

  Future<PollBloC> _initPoll() async {
    // localstorage
    voterId = fco.localStorage.read("vea") ?? 'anon';
    // firestore
    OptionVoteCountMap counts =
        await fco.capiBloc.modelRepo.getPollOptionVoteCounts(
      pollName: widget.poll.name,
    );
    UserVoterRecord? usersVote =
        await fco.capiBloc.modelRepo.getUsersVote(
      pollName: widget.poll.name,
      voterId: voterId,
    );
    pollBloc = PollBloC(
      modelRepo: fco.capiBloc.modelRepo,
      voterId: voterId,
      pollName: widget.poll.name,
      starts: widget.startDate,
      ends: widget.endDate,
      optionCountsMap: counts,
      userVote: usersVote,
    );
    return pollBloc;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PollBloC>(
        future: fInitPoll,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? BlocProvider<PollBloC>(
                  // make bloC available to child options
                  create: (context) => snapshot.data!,
                  child: BlocBuilder<PollBloC, PollState>(
                    builder: (context, state) {
                      // bool showTextInputButton = (state.voterId ?? '').isEmpty;
                      bool showDates =
                          widget.startDate != null && widget.endDate != null;
                      String? dates;
                      if (showDates) {
                        final now = DateTime.now().millisecondsSinceEpoch;
                        final startDT = DateTime.fromMillisecondsSinceEpoch(
                            widget.startDate!);
                        String starts = widget.startDate! > now
                            ? DateFormat('MMMMd').format(startDT)
                            : timeago.format(startDT);
                        // fco.logger.d(timeago.format(startDT));
                        final endDT = DateTime.fromMillisecondsSinceEpoch(
                            widget.endDate!);
                        String ends = now < widget.endDate!
                            ? DateFormat('MMMMd').format(endDT)
                            : timeago.format(endDT, allowFromNow: true);
                        // fco.logger.d(timeago.format(endDT));
                        dates =
                            'poll ${widget.startDate! < now ? 'started' : 'starts'}: '
                            '$starts, and '
                            '${now < widget.endDate! ? 'ends' : 'ended'}: '
                            '$ends';
                      }
                      return Column(
                        key: ValueKey(widget.poll.name),
                        children: [
                          widget.titleWidget,
                          if (dates != null) Text(dates),
                          SizedBox(height: widget.heightBetweenTitleAndOptions),
                          ...widget.children,
                          const Gap(10),
                          fco.coloredText(
                              '${widget.votesText} ${snapshot.data!.state.totalPollVoteCount()}',
                              color: Colors.blue[900],
                              fontSize: 14),
                          const Gap(10),
                          Align(
                              alignment: Alignment.centerRight,
                              child: (state.tooEarly())
                                  ? fco.coloredText(
                                      'poll not yet open. begins: ${fco.formattedDate(state.startDate!)}',
                                      fontSize: 12)
                                  : (state.pollHasEnded())
                                      ? fco.coloredText(
                                          'poll closed. ended: ${fco.formattedDate(state.startDate!)}',
                                          fontSize: 12)
                                      : (!state.tooEarly() &&
                                              !state.pollHasEnded() &&
                                              state.startDate != null &&
                                              state.endDate != null)
                                          ? fco.coloredText(
                                              'poll closes: ${fco.formattedDate(state.endDate!)}',
                                              fontSize: 12)
                                          : const Offstage()),
                          Expanded(
                            child: widget.metaWidget ?? Container(),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : const CircularProgressIndicator();
        });
  }

  // called by pollOption(s) when tapped
  // void voterEmailAddressDlg(gk, VoidCallback onGotEa) => fco.showOverlay(
  //       targetGkF: () => gk,
  //       calloutContent: InputEa(
  //         onValidEmailF: (ea) {
  //           pollBloc.add(PollEvent.voterIdCreated(newVoterId: ea));
  //           fco.afterNextBuildDo(() {
  //             onGotEa();
  //             fco.dismiss("voter-ea");
  //           });
  //         },
  //       ),
  //       calloutConfig: CalloutConfig(
  //         cId: "voter-ea",
  //         initialTargetAlignment: Alignment.topLeft,
  //         initialCalloutAlignment: Alignment.bottomRight,
  //         finalSeparation: 60,
  //         barrier: CalloutBarrierConfig(
  //           opacity: .5,
  //           onTappedF: () async {
  //             fco.dismiss("voter-ea");
  //           },
  //         ),
  //         initialCalloutW: 400,
  //         initialCalloutH: 180,
  //         borderRadius: 12,
  //         decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
  //       ),
  //     );
}
