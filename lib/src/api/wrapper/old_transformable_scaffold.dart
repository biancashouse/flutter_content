// // ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// 
//
// import 'panel_chips.dart';
//
// class TransformableScaffoldOLD extends StatefulWidget {
//   final Color? scaffoldBgColor;
//   final AppBar Function()? scaffoldAppBar;
//   final Widget Function()? scaffoldBody;
//   final Widget Function()? scaffoldBottomSheet;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   TransformableScaffoldOLD({
//     this.scaffoldBgColor,
//     this.scaffoldAppBar,
//     this.scaffoldBody,
//     this.scaffoldBottomSheet,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//   }) : super(key: GlobalKey(debugLabel: "TransformableScaffoldOLD"));
//
//   static TransformableScaffoldOLDState? of(BuildContext context) => context.findAncestorStateOfType<TransformableScaffoldOLDState>();
//
//   @override
//   State<TransformableScaffoldOLD> createState() => TransformableScaffoldOLDState();
// }
//
// class TransformableScaffoldOLDState extends State<TransformableScaffoldOLD> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
//   late MaterialAppWrapperState? parentAppState;
//   late Animation<Matrix4> _matrix4Animation;
//   late AnimationController _aController;
//   late Alignment _transformAlignment;
//
//   Map<PanelName, GlobalKey> panelGkMap = {};
//
//   // Rect? _rect;
//   // double _scaleX = 1;
//   // double _scaleY = 1;
//
//   // called when refreshing from slider change (zero duration etc)
//   zoomImmediately(final double scaleX, final double scaleY) {
//     _matrix4Animation = Matrix4Tween(begin: Matrix4.identity(), end: Matrix4.identity()..scale(scaleX, scaleY)).animate(_aController);
//     _aController.duration = Duration.zero;
//     _aController
//       ..reset
//       ..forward().then((value) {
//         _aController.duration = DEFAULT_TRANSITION_DURATION_MS;
//       });
//   }
//
//   // /// given a Rect, returns most appropriate alignment between target and callout
//   // Alignment calcTargetAlignment(final Rect wrapperRect, final Rect targetRect) {
//   //   // Rect? wrapperRect = findGlobalRect(widget.key as GlobalKey);
//   //
//   //   Offset wrapperC = wrapperRect.center;
//   //   Offset targetRectC = targetRect.center;
//   //   double x = (targetRectC.dx - wrapperC.dx) / (wrapperRect.width / 2);
//   //   double y = (targetRectC.dy - wrapperC.dy) / (wrapperRect.height / 2);
//   //   // keep away from sides
//   //   if (x < -0.75)
//   //     x = -1.0;
//   //   else if (x > 0.75) x = 1.0;
//   //   if (y < -0.75)
//   //     y = -1.0;
//   //   else if (y > 0.75) y = 1.0;
//   //   print("$x, $y");
//   //   return Alignment(x, y);
//   // }
//
//   void applyTransform(final double scaleX, final double scaleY, final Alignment alignment, {required VoidCallback afterTransformF}) {
//     _matrix4Animation = Matrix4Tween(begin: Matrix4.identity(), end: (Matrix4.identity()..scale(scaleX, scaleY))).animate(_aController);
//     _transformAlignment = alignment;
//     _aController.forward().then((value) => afterTransformF.call());
//   }
//
//   void resetTransform() {
//     // _matrix4Animation = Matrix4Tween(begin: Matrix4.identity(), end: Matrix4.identity()).animate(_aController);
//     _aController.reverse();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // register this state obj - useful when we need a list of all panels
//     // CAPIState.tScaffolds.add(this);
//
//     parentAppState = MaterialAppWrapper.of(context);
//
//     if (widget.ancestorHScrollController != null) CAPIState.registerScrollController(widget.ancestorHScrollController!);
//     if (widget.ancestorVScrollController != null) CAPIState.registerScrollController(widget.ancestorVScrollController!);
//
//     // make available globally
//     // CAPIState.gkMap[widget.twName] = widget.key as GlobalKey;
//
//     _aController = AnimationController(vsync: this);
//
//     _aController.addListener(() {
//       print("_aController status: ${_aController.status}");
//       print("_aController status: ${_aController.toStringDetails()}");
//     });
//
//     // initially no transform
//     _matrix4Animation = Matrix4Tween(
//       begin: Matrix4.identity(),
//       end: Matrix4.identity(),
//     ).animate(_aController);
//
//     _transformAlignment = Alignment.center;
//
//     _initializeFields();
//   }
//
//   void _initializeFields() {
//     _aController.duration = DEFAULT_TRANSITION_DURATION_MS;
//   }
//
//   @override
//   void reassemble() {
//     _initializeFields();
//     super.reassemble();
//   }
//
//   @override
//   dispose() {
//     _aController.dispose();
//     super.dispose();
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   Useful.instance.initWithContext(context, force: true);
//   //   super.didChangeDependencies();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _aController,
//         builder: (BuildContext context, _) {
//           return Transform(
//             transform: _matrix4Animation.value,
//             alignment: _transformAlignment,
//             child: _AnimatedScaffold(
//               scaffoldAppBar: widget.scaffoldAppBar,
//               scaffoldBody: widget.scaffoldBody,
//               scaffoldBottomSheet: widget.scaffoldBottomSheet,
//               scaffoldBgColor: widget.scaffoldBgColor,
//             ),
//           );
//         });
//   }
// }
//
// class _AnimatedScaffold extends HookWidget {
//   final Color? scaffoldBgColor;
//   final AppBar Function()? scaffoldAppBar;
//   final Widget Function()? scaffoldBody;
//   final Widget Function()? scaffoldBottomSheet;
//
//   const _AnimatedScaffold({
//     this.scaffoldBgColor,
//     this.scaffoldAppBar,
//     this.scaffoldBody,
//     this.scaffoldBottomSheet,
//     // super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final tapCount = useState<int>(0);
//     final lastTapTime = useState<DateTime?>(null);
//
//     bool capiBlocRegistereredWithGetIt = true;
//     try {
//       FlutterContent().capiBloc;
//     } catch (e) {
//       capiBlocRegistereredWithGetIt = false;
//     }
//
//     return capiBlocRegistereredWithGetIt
//         ? BlocBuilder<CAPIBloC, CAPIState>(
//             builder: (context, state) {
//               return Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   RawKeyboardListener(
//                     autofocus: true,
//                     focusNode: FocusNode(), // <-- more magic
//                     onKey: (event) => _enterOrExitEditMode(event, lastTapTime, tapCount),
//                     child: AnimatedContainer(
//                       width: Useful.scrW,
//                       height: MaterialAppWrapper.inEditMode.value ? 40 : 0,
//                       color: Colors.purple,
//                       duration: const Duration(milliseconds: 300),
//                       child: MaterialAppWrapper.inEditMode.value ? const PanelChips() : const Offstage(),
//                     ),
//                   ),
//                   Expanded(
//                     child: Scaffold(
//                       resizeToAvoidBottomInset: false,
//                       // IMPORTANT for ensuring callout not behind keyboard
//                       key: GetIt.I.get<GlobalKey>(instanceName: getIt_scaffoldGK),
//                       backgroundColor: scaffoldBgColor,
//                       appBar: scaffoldAppBar?.call(),
//                       body: scaffoldBody?.call() ??
//                           const Icon(
//                             Icons.warning,
//                             color: Colors.red,
//                           ),
//                       bottomSheet: scaffoldBottomSheet?.call(),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           )
//         : Text(
//             'AnimatedScaffold - BLoC not registered!',
//             style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.red),
//           );
//   }
//
//   // Widget _panelEditButtons(context) {
//   //   TransformableScaffoldOLDState? parentTSState() => TransformableScaffoldOLD.of(context);
//   //   return Material(
//   //     child: Row(
//   //       mainAxisSize: MainAxisSize.max,
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       crossAxisAlignment: CrossAxisAlignment.center,
//   //       children: CAPIState.snippetPanelGkMap.keys
//   //           .map((panelName) => Padding(
//   //                 padding: const EdgeInsets.all(8.0),
//   //                 child: TextButton(
//   //                   style: ChoiceChip(
//   //                     label: Text(panelName,
//   //                     selected: _value == index,
//   //                     onSelected: (bool selected) {
//   //                       setState(() {
//   //                         _value = selected ? index : null;
//   //                       });
//   //                     },
//   //                   )
//   //                   onPressed: () {
//   //                     if (FlutterContent().capiBloc.state.selectedPanel == panelName) {
//   //                       Callout.dismiss('selected-panel-border-overlay');
//   //                       FlutterContent().capiBloc.add(const CAPIEvent.selectPanel(panelName: null));
//   //                     } else if (FlutterContent().capiBloc.state.selectedPanel != null) {
//   //                       Callout.dismiss('selected-panel-border-overlay');
//   //                     }
//   //                     FlutterContent().capiBloc.add(CAPIEvent.selectPanel(panelName: panelName));
//   //                     // show an overlay for the panel (just a border)
//   //                     _showPanelBorderOverlay(panelName);
//   //                    },
//   //                   onLongPress: () {
//   //                     // show an overlay for the panel (just a border)
//   //                     _showPanelBorderOverlay(panelName);
//   //                     // create line connecting this text button to the panel overlay
//   //                     // show the snippet tree callout for this panel
//   //                     _showSnippetCallout(panelName);
//   //                   },
//   //                   child: Center(
//   //                     child: Useful.coloredText(
//   //                       panelName,
//   //                       // '$panelName / ${CAPIState.snippetPlacementMap[panelName]}',
//   //                       color: Colors.white,
//   //                       fontSize: 14,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ))
//   //           .toList(),
//   //     ),
//   //   );
//   // }
//
//   _enterEditMode() {
//     MaterialAppWrapper.inEditMode.value = true;
//     hideAllSingleTargetBtns();
//     FlutterContent().capiBloc.add(const CAPIEvent.forceRefresh());
//   }
//
//   _exitEditMode() {
//     Callout.dismiss('selected-panel-border-overlay');
//     MaterialAppWrapper.inEditMode.value = false;
//     Callout.dismiss(TREENODE_MENU_CALLOUT);
//     Callout.dismiss(CAPIBloC.snippetBeingEdited?.rootNode?.name ?? "snippet name ?!");
//     unhideAllSingleTargetBtns();
//     FlutterContent().capiBloc.add(const CAPIEvent.forceRefresh());
//   }
//
//   _enterOrExitEditMode(RawKeyEvent event, ValueNotifier<DateTime?> lastTapTime, ValueNotifier<int> tapCount) {
//     if ((event.isControlPressed || event.isAltPressed || event.isShiftPressed) && event.logicalKey == LogicalKeyboardKey.escape && event is RawKeyUpEvent) {
//       if (!MaterialAppWrapper.inEditMode.value) {
//         _enterEditMode();
//       } else {
//         _exitEditMode();
//       }
//     }
//   }
//
//   // _enterOrExitEditMode2(RawKeyEvent event, ValueNotifier<DateTime?> lastTapTime, ValueNotifier<int> tapCount) {
//   //   if ((event.logicalKey == LogicalKeyboardKey.abort || event.logicalKey == LogicalKeyboardKey.backquote) && event is RawKeyDownEvent) {
//   //     var now = DateTime.now();
//   //     if (lastTapTime.value == null || now.difference(lastTapTime.value!).inMilliseconds > 300) {
//   //       // Reset tap count if more than 500 milliseconds have passed since the last taptapCount.value = 1;
//   //     } else {
//   //       // Increment tap count if tapped within 500 milliseconds
//   //       tapCount.value++;
//   //     }
//   //
//   //     lastTapTime.value = now;
//   //
//   //     if (tapCount.value == 3) {
//   //       print('Three taps detected!');
//   //       if (!MaterialAppWrapper.inEditMode.value) {
//   //         _enterEditMode();
//   //       } else {
//   //         _exitEditMode();
//   //       }
//   //       // Reset tap count after handling the three taps
//   //       tapCount.value = 0;
//   //     }
//   //
//   //     // keyDownTimer = Timer(const Duration(milliseconds: 300), () {
//   //     //   MaterialAppWrapper.escKeyPressedZFor3Secs = true;
//   //     //   MaterialAppWrapper.inEditMode.value = false;
//   //     //   // show FAB
//   //     //   _showFloatingShowSnippetOverlaysButton();
//   //     // });
//   //   }
//   //   // if (event is RawKeyUpEvent) {
//   //   //   if (keyDownTimer?.isActive ?? false) keyDownTimer?.cancel();
//   //   // }
//   // }
// }
