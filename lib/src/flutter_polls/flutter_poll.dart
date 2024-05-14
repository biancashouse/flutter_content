library flutter_polls;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/poll_bloc.dart';
import 'package:flutter_content/src/bloc/poll_event.dart';
import 'package:flutter_content/src/bloc/poll_state.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// FlutterPolls widget.
// This widget is used to display a poll.
// It can be used in any way and also in a [ListView] or [Column].
class FlutterPoll extends StatefulWidget {
  final String pollName;

  /// The [optionId] of each poll option is used to identify the option when the user votes.
  /// The [title] of each poll option is displayed to the user.
  /// [title] can be any widget with a bounded size.
  /// The [optionVotes] of each poll option is the number of votes that the option has received.
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
  /// example:
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
  /// example:
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
    required this.pollName,
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

  static FlutterPollState? of(BuildContext context) => context.findAncestorStateOfType<FlutterPollState>();

  @override
  State<FlutterPoll> createState() => FlutterPollState();
}

class FlutterPollState extends State<FlutterPoll> {
  late String? voterId;
  late Future<PollBloC> fInitPoll;
  late PollBloC pollBloc;

  @override
  void initState() {
    super.initState();
    fInitPoll = _initPoll();
  }

  Future<PollBloC> _initPoll() async {
    // localstorage
    voterId = HydratedBloc.storage.read("voter-id");
    if (voterId != null) {
      // firestore
      OptionCountsAndVoterRecord result = await FC().capiBloc.modelRepo.getPollResultsForUser(
            voterId: voterId!,
            pollName: widget.pollName,
          );
      pollBloc = PollBloC(
        modelRepo: FC().capiBloc.modelRepo,
        voterId: voterId!,
        pollName: widget.pollName,
        starts: widget.startDate,
        ends: widget.endDate,
        result: result,
      );
    } else {
      var modelRepo = FC().capiBloc.modelRepo;
      pollBloc = PollBloC(
        modelRepo: modelRepo,
        voterId: null,
        pollName: widget.pollName,
        result: (optionVoteCountMap: {}, userVotedForOptionId: null, when: 0),
      );
    }
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
                      bool showTextInputButton = (state.voterId ?? '').isEmpty;
                      return Column(
                        key: ValueKey(widget.pollName),
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (showTextInputButton) Useful.coloredText("Please tap here, so we\nknow who's voting? -->  ", color: Colors.red),
                              Container(
                                color: showTextInputButton ? Colors.red[900] : Colors.white,
                                padding: const EdgeInsets.all(4),
                                child: showTextInputButton
                                    ? PropertyButton<String>(
                                        originalText: voterId ?? '',
                                        label: 'email address',
                                        maxLines: 1,
                                        expands: false,
                                        skipLabelText: true,
                                        skipHelperText: true,
                                        calloutButtonSize: const Size(110, 20),
                                        calloutSize: const Size(300, 80),
                                        propertyBtnGK: GlobalKey(debugLabel: 'ea'),
                                        onChangeF: (userEA) {
                                          snapshot.data!.add(PollEvent.voterIdCreated(newVoterId: userEA));
                                        })
                                    : InkWell(
                                        onTap: () {
                                          snapshot.data!.add(const PollEvent.voterIdCreated(newVoterId: ''));
                                        },
                                        child: Text('${state.voterId}'),
                                      ),
                              ),
                            ],
                          ),
                          vspacer(10),
                          widget.titleWidget,
                          SizedBox(height: widget.heightBetweenTitleAndOptions),
                          ...widget.children,
                          vspacer(10),
                          Useful.coloredText('${widget.votesText} ${snapshot.data!.state.totalPollVoteCount()}', color: Colors.blue[900], fontSize: 14),
                          vspacer(10),
                          Align(
                              alignment: Alignment.centerRight,
                              child: (state.tooEarly())
                                  ? Useful.coloredText('poll not yet open. begins: ${Useful.formattedDate(state.startDate!)}', fontSize: 12)
                                  : (state.pollHasEnded())
                                      ? Useful.coloredText('poll closed. ended: ${Useful.formattedDate(state.startDate!)}', fontSize: 12)
                                      : (!state.tooEarly() && !state.pollHasEnded() && state.startDate != null && state.endDate != null)
                                          ? Useful.coloredText('poll closes: ${Useful.formattedDate(state.endDate!)}', fontSize: 12)
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
}
