// // ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
// import 'package:flutter_content/src/measuring/measuring_wrapper.dart';
// import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';
//
// Feature singleTargetBtnFeature(String snippetName) =>
//     "singleTargetBtnfeature:$snippetName";
//
// void hideAllSingleTargetBtns() {
//   FeatureList features = FC().singleTargetBtnFeatures;
//   // debugPrint("hideAllSingleTargetBtns - ${features.toString()} ");
//   for (Feature feature in features) {
//     Callout.hide(feature);
//   }
// }
//
// void unhideAllSingleTargetBtns() {
//   FeatureList features = FC().singleTargetBtnFeatures;
//   // debugPrint("unhideAllSingleTargetBtns - ${features.toString()} ");
//   for (Feature feature in features) {
//     Callout.unhide(feature);
//   }
// }
//
// class SingleTargetWrapper extends StatefulWidget {
//   final String name;
//   final Widget child;
//   final Alignment? playButtonAlignment;
//   final Widget? playButton;
//   final Size? playButtonSize;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   SingleTargetWrapper({
//     super.key,
//     required this.name,
//     required this.child,
//     this.playButtonAlignment,
//     this.playButton,
//     this.playButtonSize,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//   }) {
//     assert(playButton == null ||
//         (playButtonAlignment != null && playButtonSize != null));
//   }
//
//   @override
//   State<SingleTargetWrapper> createState() => SingleTargetWrapperState();
//
//   static List<Feature> singleWidgetFeatures() =>
//       singleTargetMap.keys.map((s) => singleTargetBtnFeature(s)).toList();
//
//   static Map<String, TargetConfig> singleTargetMap = {};
//
//   static TargetConfig? singleTarget({required String name}) {
//     // debugPrint("singleTargetc: $name");
//     TargetConfig? tc;
//     // var singleTargets = singleTargetMap;
//     // debugPrint(singleTargets.toString());
//     try {
//       // var names = singleTargetMap.values.map((tc) => tc.wName).toList();
//       // debugPrint("singleTarget keys: ${names.toString()}");
//       // for (TargetConfig atc in singleTargetMap.values) {
//       //   debugPrint("singleTarget: ${atc.toJson()}");
//       // }
//       tc = singleTargetMap.values.where((tc) => tc.wName == name).first;
//       // debugPrint("singleTarget: ${tc.toJson()}");
//     } catch (e) {
//       // ignore and return null
//     }
//     return tc;
//   }
// }
//
// class SingleTargetWrapperState extends State<SingleTargetWrapper>
//     with SingleTickerProviderStateMixin, WidgetsBindingObserver {
//   late TargetConfig singleTC;
//   late Offset targetPos;
//   late Size targetSize;
//
//   @override
//   void initState() {
//     super.initState();
//
//     debugPrint("C_SingleWidgetWrapperState.initState");
//
//     FC().setSingleTargetGk(widget.name, GlobalKey(debugLabel: widget.name));
//
//     // register this target wrapper - may get overwritten from initApp (i.e. if alrady stored in LS, or FB)
//     SingleTargetWrapper.singleTargetMap[widget.name] ??= TargetConfig(
//       uid: widget.name.hashCode,
//       wName: widget.name,
//       single: true,
//       snippetName: widget.name,
//     );
//     singleTC = SingleTargetWrapper.singleTargetMap[widget.name]!;
//     // debugPrint("singleTargetMap contains: ${CAPIState.singleTargetMap.keys.toList().toString()}");
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
//     return NotificationListener<SizeChangedLayoutNotification>(
//       onNotification: (SizeChangedLayoutNotification notification) {
//         // debugPrint("CAPIWidgetWrapperState on Size Change Notification - ${widget.name}");
//         // measureWidget();
//         return true;
//       },
//       child: SizeChangedLayoutNotifier(
//         child: BlocBuilder<CAPIBloC, CAPIState>(builder: (context, state) {
//           return MeasuringWrapper(
//             onSizeChangedF: (size) => targetSize = size,
//             onPosChangedF: (pos) => targetPos = pos,
//             onMeasuredF: () {
//               if (widget.playButton != null &&
//                   (Zoomer.of(context)?.mounted ?? false)) {
//                 showSingleWidgetPlayButton();
//               }
//             },
//             child: Material(
//               key: FC().getSingleTargetGk(widget.name),
//               child: widget.child,
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   void showSingleWidgetPlayButton() {
//     FeatureList features = FC().singleTargetBtnFeatures;
//     Feature feature = singleTargetBtnFeature(widget.name);
//     Callout.dismiss(feature);
//     features
//       ..remove(feature)
//       ..add(feature);
//     // debugPrint("showSingleWidgetPlayButton feature(${widget.name}): $feature");
//     Callout.showOverlay(
//       boxContentF: (_) => Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onDoubleTap: () async {
//             if (context.mounted) {
//               playSingleTarget(context, justPlaying: false, tc: singleTC);
//               Useful.afterMsDelayDo(1000, () {
//                 FC().capiBloc.add(const CAPIEvent.popSnippetBloc());
//               });
//             }
//
//             // CAPIBloc bloc = FlutterContent().capiBlocnstance;
//             // TargetConfig? tc = bloc.state.singleTarget(name: widget.name);
//             // if (tc != null) {
//             //   Rect? wrapperRect = findGlobalRect(CAPIState.gk(parentTW.widget.name.hashCode)!);
//             //   Rect? targetRect = findGlobalRect(CAPIState.gk(widget.name.hashCode)!);
//             //   if (wrapperRect != null && targetRect != null) {
//             //     bloc.add(CAPIEvent.hideTargetGroupsExcept(tc: tc));
//             //     bloc.add(CAPIEvent.hideAllTargetGroupBtns());
//             //     hideAllSingleTargetBtns();
//             //     Alignment ta = Useful.calcTargetAlignment(wrapperRect, targetRect);
//             //     parentTW.applyTransform(tc.transformScale, tc.transformScale, ta, afterTransformF: () {
//             //       showTargetConfigToolbarCallout(
//             //         tc,
//             //         widget.ancestorHScrollController,
//             //         widget.ancestorVScrollController,
//             //         onCloseF: () async {
//             //           removeTargetConfigToolbarCallout();
//             //           parentTW.resetTransform();
//             //           bloc.add(const CAPIEvent.unhideAllTargetGroups());
//             //           // unhide single widget buttons
//             //           unhideAllSingleTargetBtns();
//             //         },
//             //       );
//             //     });
//             //   }
//             // }
//           },
//           onTap: () {
//             // // tapped helper icon - transform scaffold corr to target widget
//             // Rect? wrapperRect = findGlobalRect(CAPIState.gk(parentTW.widget.name.hashCode)!); //CAPIState.gk(widget.twName)!);
//             // int gkKey = widget.name.hashCode;
//             // Rect? targetRect = findGlobalRect(CAPIState.gk(gkKey)!); //CAPIState.gk("w.$wwName")!);
//             // var map = CAPIState.singleTargetMap;
//             // if (tc != null && wrapperRect != null && targetRect != null) {
//             //   Alignment ta = Useful.calcTargetAlignment(wrapperRect, targetRect);
//             //   // Useful.om.hideAllExceptFor(exceptions: [wwName.hashCode]);
//             //   // bloc.add(const CAPIEvent.hideImageTargetsExcept());
//             //   parentTW.applyTransform(tc.transformScale, tc.transformScale, ta, afterTransformF: () {
//             if (context.mounted)
//               playSingleTarget(context, justPlaying: true, tc: singleTC);
//             // });
//             // Useful.afterMsDelayDo(tc.calloutDurationMs, () {
//             //   parentTW?.resetTransform();
//             //   for (int feature in C_SingleWidgetWrapper.singleWidgetFeatures()) {
//             //     Useful.om.unhide(feature);
//             //   }
//             //   parentTW!.bloc.add(CAPIEvent.unhideTargetGroups());
//             //   // Useful.om.unhideAllExceptFor(exceptions: [wwName.hashCode]);
//             //   // bloc.add(const CAPIEvent.unhideImageTargets());
//             // });
//             // }
//           },
//           child: widget.playButton,
//         ),
//       ),
//       targetGkF: () => FC().getSingleTargetGk(widget.name),
//       calloutConfig: CalloutConfig(
//         feature: feature,
//         initialCalloutPos: _playButtonCenterPos().translate(
//             -widget.playButtonSize!.width / 2,
//             -widget.playButtonSize!.height / 2),
//         suppliedCalloutW: widget.playButtonSize!.width,
//         suppliedCalloutH: widget.playButtonSize!.height,
//         roundedCorners: 20,
//         draggable: false,
//         color: Colors.transparent,
//         arrowType: ArrowType.NO_CONNECTOR,
//         notUsingHydratedStorage: true,
//       ),
//     );
//   }
//
//   static Future<void> playSingleTarget(context,
//       {required bool justPlaying, required TargetConfig tc}) async {
//     debugPrint("Playing");
//     CAPIBloC bloc = FC().capiBloc;
//     // may not be wrapped inside a TransformableWrapper
//     ZoomerState? zoomer = Zoomer.of(context);
//     if (zoomer == null) {
//       Rect? targetRect = FC()
//           .getSingleTargetGk(tc.wName)!
//           .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_singleTargets)[tc.wName]!);
//       if (targetRect != null) {
//         bloc.add(CAPIEvent.hideTargetGroupsExcept(tc: tc));
//         bloc.add(const CAPIEvent.hideAllTargetGroupBtns());
//         bloc.add(const CAPIEvent.hideIframes(hide: true));
//         hideAllSingleTargetBtns();
//         showSnippetContentCallout(
//           initialTC: tc,
//           snippetName: tc.snippetName,
//           justPlaying: justPlaying,
//           allowButtonCallouts: false,
//           onDiscardedF: () async {
//             bloc.add(const CAPIEvent.unhideAllTargetGroups());
//             unhideAllSingleTargetBtns();
//           },
//         );
//         if (justPlaying) {
//           // remove after configured delay
//           Useful.afterMsDelayDo(tc.calloutDurationMs, () async {
//             removeSnippetContentCallout(tc.snippetName);
//             bloc.add(const CAPIEvent.unhideAllTargetGroups());
//             unhideAllSingleTargetBtns();
//           });
//         }
//       }
//     } else {
//       // is wrapped by a transformer
//       Rect? wrapperRect = (zoomer.widget.key as GlobalKey)
//           .globalPaintBounds(); //Measuring.findGlobalRect(parentTW.widget.key as GlobalKey);
//       Rect? targetRect = FC()
//           .getSingleTargetGk(tc.wName)!
//           .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_singleTargets)[tc.wName]!);
//       if (wrapperRect != null && targetRect != null) {
//         bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));
//         hideAllSingleTargetBtns();
//         Alignment ta =
//             Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
//         zoomer.applyTransform(
//             tc.transformScale,
//             tc.transformScale,
//             ta, afterTransformF: () {
//           showSnippetContentCallout(
//               initialTC: tc,
//               snippetName: tc.snippetName,
//               justPlaying: justPlaying,
//               allowButtonCallouts: false,
//               onDiscardedF: () async {
//                 removeSnippetContentCallout(tc.snippetName);
//                 zoomer.resetTransform();
//                 bloc.add(const CAPIEvent.unhideAllTargetGroups());
//                 unhideAllSingleTargetBtns();
//               });
//           if (justPlaying) {
//             // remove after configured delay
//             Useful.afterMsDelayDo(tc.calloutDurationMs, () async {
//               removeSnippetContentCallout(tc.snippetName);
//               zoomer.resetTransform();
//               unhideAllSingleTargetBtns();
//               bloc.add(const CAPIEvent.unhideAllTargetGroups());
//             });
//           }
//           // else {
//           // showTargetConfigToolbarCallout(
//           //   singleTC,
//           //   widget.ancestorHScrollController,
//           //   widget.ancestorVScrollController,
//           //   onCloseF: () async {
//           //     removeTargetConfigToolbarCallout();
//           //     parentTW!.resetTransform();
//           //     bloc.add(const CAPIEvent.unhideAllTargetGroups());
//           //     unhideAllSingleTargetBtns();
//           //     removeSnippetContentCallout();
//           //   },
//           // );
//           // }
//         });
//       }
//     }
//   }
//
//   // use alignment to position a play button
//   Offset _playButtonCenterPos() => Offset(
//         targetPos.dx + targetSize.width / 2,
//         targetPos.dy + targetSize.height / 2,
//       ).translate(
//         widget.playButtonAlignment!.x * targetSize.width / 2,
//         widget.playButtonAlignment!.y * targetSize.height / 2,
//       );
// }
