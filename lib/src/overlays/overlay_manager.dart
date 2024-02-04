// import 'dart:async';
//
// // import 'dart:collection';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/cpi_reason_stack.dart';
// import 'package:flutter_content/src/feature_discovery/featured_widget.dart';
// import 'package:flutter_content/src/overlays/callouts/callout_config.dart';
// import 'package:flutter_content/src/flutter_content.dart';
// //import 'responsive_helper.dart';
//
// /// idea is to keep track of overlay entries currently in the root overlay, so
// /// it easy to ensure all get removed if, say, back button tapped etc.
// class OverlayManager {
//   final OverlayState overlayState;
//
//   // final Queue<Expansions> undoQx = Queue<Expansions>();
//
//   final List<Feature> _featureStack = []; // 0th element is the top most item
//   final Map<Feature, Object> _calloutMap = {}; // actually callouts (incl Toasts) and DiscoveryWidgets
//   final Map<Feature, List<OverlayEntry>> _entryMap = {};
//
//   // void debugging() {
//   //   print("_featureStack size: ${_featureStack.length}");
//   //   print("_calloutMap size: ${_calloutMap.keys.length}");
//   //   print("_entryMap size: ${_entryMap.length}");
//   // }
//
//   // always append entries, and remove from end of list; i.e. treat like a stack
//
//   // int itemCount() => _overlayItems.length;
//
//   // private, named constructor
//   OverlayManager(this.overlayState) {
//     // print("OverlayManager");
//   }
//
//   void overlaySetState({VoidCallback? f}) {
//     // because not allowed to setState from outside of the state itself !
//     if (overlayState.mounted) {
//       overlayState.setState(f ?? () {});
//     } else {
//       throw ('overlayState not mouted!');
//     }
//   }
//
//   // void insertOverlayEntry(OverlayEntry entry, {bool isPartOfACallout = false}) {
//   //   if (false) developer.log('insertOverlayEntry', name: 'om');
//   //   _overlayState.insert(entry);
//   //   if (!isPartOfACallout) _overlayItems.add(entry);
//   // }
//
//   Callout? findCallout(Feature theFeature) {
//     Object? result = _calloutMap[theFeature];
//     return result != null && result is Callout ? result : null;
//   }
//
//   FeaturedWidget? findFeaturedWidget(Feature theFeature) {
//     Object? result = _calloutMap[theFeature];
//     return result != null && result is FeaturedWidget ? result : null;
//   }
//
//   // returns whether any of the features is present
//   // if no feature provided as an arg, return whether ANY callout are present
//   bool anyPresent(List<Feature> features) {
//     if (features.isEmpty) {
//       return _featureStack.isNotEmpty;
//     } else {
//       for (Feature feature in features) {
//         if (_calloutMap.keys.contains(feature)) return true;
//       }
//     }
//     return false;
//   }
//
//   // void insertCalloutOverlayEntry(Callout callout, OverlayEntry entry) {
//   //   if (!_featureStack.contains(callout.feature)) _featureStack.insert(0, callout.feature);
//   //   if (!_calloutMap.containsKey(callout.feature)) _calloutMap[callout.feature] = callout;
//   //   if (!_entryMap.containsKey(callout.feature)) _entryMap[callout.feature] = [];
//   //   Timer.run(() {
//   //     overlayState.insert(entry);
//   //     _entryMap[callout.feature]?.add(entry);
//   //   });
//   // }
//
//   void insertCalloutOverlayEntries(Callout callout, List<OverlayEntry> entries) {
//     for (OverlayEntry entry in entries) {
//       if (!_featureStack.contains(callout.feature)) _featureStack.insert(0, callout.feature);
//       if (!_calloutMap.containsKey(callout.feature)) _calloutMap[callout.feature] = callout;
//       if (!_entryMap.containsKey(callout.feature)) _entryMap[callout.feature] = [];
//     }
//     Timer.run(() {
//       overlayState.insertAll(entries);
//       for (OverlayEntry entry in entries) {
//         _entryMap[callout.feature]?.add(entry);
//       }
//     });
//   }
//
//   void insertFeaturedWidgetOverlayEntry(FeaturedWidget fw, OverlayEntry entry) {
//     if (!_featureStack.contains(fw.featureEnum)) _featureStack.insert(0, fw.featureEnum);
//     if (!_calloutMap.containsKey(fw.featureEnum)) _calloutMap[fw.featureEnum] = fw;
//     if (!_entryMap.containsKey(fw.featureEnum)) _entryMap[fw.featureEnum] = [];
//     Timer.run(() {
//       overlayState.insert(entry);
//       _entryMap[fw.featureEnum]!.add(entry);
//     });
//   }
//
//   // void insertDrawerResizerOverlay(int id, OverlayEntry entry) {
//   //   if (!_entryMap.containsKey(id)) _entryMap[id] = [];
//   //   Timer.run(() {
//   //     overlayState.insert(entry);
//   //     _entryMap[id]?.add(entry);
//   //   });
//   // }
//   //
//   // void removeDrawerResizerOverlay(int id) {
//   //   List<OverlayEntry>? entry = _entryMap[id];
//   //   entry?.first?.remove();
//   // }
//
//   void moveToTop(Feature feature) {
//     Callout? callout = findCallout(feature);
//     if (callout != null) {
//       List<OverlayEntry> toBeMoved = []..addAll(_entryMap[feature] ?? []);
//       for (OverlayEntry entry in toBeMoved) {
//         try {
//           entry.remove();
//           _entryMap[feature]?.remove(entry);
//         } catch (e) {
//           print("remove(${feature}) - ${e.toString()}");
//         }
//       }
//       for (OverlayEntry entry in toBeMoved) {
//         overlayState.insert(entry);
//         _entryMap[feature]!.add(entry);
//       }
//     }
//   }
//
//   void moveToBottom(Feature feature, Feature belowFeature) {
//     Callout? belowCallout = findCallout(belowFeature);
//     if (belowCallout != null) {
//       OverlayEntry? bottomMostFeature = _entryMap[belowFeature]?.last;
//       Callout? callout = findCallout(feature);
//       if (callout != null) {
//         List<OverlayEntry> toBeMoved = []..addAll(_entryMap[feature] ?? []);
//         for (OverlayEntry entry in toBeMoved) {
//           try {
//             entry.remove();
//             _entryMap[feature]?.remove(entry);
//           } catch (e) {
//             print("remove(${feature}) - ${e.toString()}");
//           }
//         }
//         for (OverlayEntry entry in toBeMoved) {
//           overlayState.insert(entry, below: bottomMostFeature);
//           _entryMap[feature]!.add(entry);
//         }
//       }
//     }
//   }
//
//   void remove(Feature feature, [bool theResult = true]) {
//     Callout? callout = findCallout(feature);
//     if (callout != null) {
//       List<OverlayEntry> toBeRemoved = []..addAll(_entryMap[feature] ?? []);
//       for (OverlayEntry entry in toBeRemoved) {
//         try {
//           entry.remove();
//           _entryMap[feature]?.remove(entry);
//         } catch (e) {
//           print("remove(${feature}) - ${e.toString()}");
//         }
//       }
//       _calloutMap.remove(feature);
//       _featureStack.remove(feature);
//       _entryMap.remove(feature);
//       callout.completed(theResult);
//     } else {
//       FeaturedWidget? fw = findFeaturedWidget(feature);
//       if (fw != null) {
//         List<OverlayEntry> toBeRemoved = []..addAll(_entryMap[feature] ?? []);
//         for (OverlayEntry entry in toBeRemoved) {
//           try {
//             entry.remove();
//             _entryMap[feature]?.remove(entry);
//           } catch (e) {
//             print("remove(${feature}) - ${e.toString()}");
//           }
//         }
//         _calloutMap.remove(feature);
//         _featureStack.remove(feature);
//         _entryMap.remove(feature);
//       }
//     }
//   }
//
//   void removeTopFeature(bool theResult) {
//     if (_featureStack.isNotEmpty) {
//       remove(_featureStack[0], theResult);
//     }
//   }
//
//   void removeAll({bool exceptToast = false, bool skipCC = true, bool theResult = true}) {
//     List<Feature> keysToRemove = [];
//     for (Feature feature in _calloutMap.keys) {
//       if ((!skipCC || !feature.startsWith('_')) /* && _calloutMap[feature] is! ToastCallout */) {
//         keysToRemove.add(feature);
//       }
//     }
//     for (Feature feature in keysToRemove) {
//       remove(feature, theResult);
//     }
//   }
//
//   void removeToasts({bool theResult = true}) {
//     List<Feature> keysToRemove = [];
//     for (Feature feature in _calloutMap.keys) {
//       if (_calloutMap[feature] is ToastCallout) {
//         keysToRemove.add(feature);
//       }
//     }
//     for (Feature feature in keysToRemove) {
//       remove(feature, theResult);
//     }
//   }
//
//   void removeAllExceptFor({List<Feature>? exceptions, bool theResult = true}) {
//     List<Feature> keysToRemove = [];
//     for (Feature feature in _calloutMap.keys) {
//       if (!(exceptions ?? []).contains(feature)) {
//         keysToRemove.add(feature);
//       }
//     }
//     for (Feature feature in keysToRemove) {
//       remove(feature, theResult);
//     }
//   }
//
//   void removeParentCallout(context) {
//     CalloutParent? parent = context.findAncestorWidgetOfExactType<CalloutParent>();
//     if (parent != null) {
//       Callout.findCallout<OverlayEntry>(parent.feature)?.remove();
//     }
//   }
//
//   // void removeParentCallout(BuildContext ctx, bool result) {
//   //   Callout? calloutParent = CalloutParent.of(ctx)?.widget.callout;
//   //   if (calloutParent != null) {
//   //     remove(calloutParent.feature, result);
//   //   }
//   // }
//
//   void hide(Feature feature) {
//     Callout? c = findCallout(feature);
//     if (c != null) {
//       c.hide();
//     }
//   }
//
//   void hideAllExceptFor({List<Feature>? exceptions}) {
//     List<Feature> keysToHide = [];
//     for (Feature feature in _calloutMap.keys) {
//       if (!(exceptions ?? []).contains(feature)) {
//         keysToHide.add(feature);
//       }
//     }
//     for (Feature feature in keysToHide) {
//       hide(feature);
//     }
//   }
//
//   void unhideAllExceptFor({List<Feature>? exceptions}) {
//     List<Feature> keysToHide = [];
//     for (Feature feature in _calloutMap.keys) {
//       if (!(exceptions ?? []).contains(feature)) {
//         keysToHide.add(feature);
//       }
//     }
//     for (Feature feature in keysToHide) {
//       unhide(feature);
//     }
//   }
//
//   void unhide(Feature feature) {
//     Callout? c = findCallout(feature);
//     if (c != null) {
//       c.unhide();
//     }
//   }
//
//   // void refreshAll() {
//   //   for (Object o in _calloutMap.values) {
//   //     if (o is Callout) {
//   //       o.refresh();
//   //     }
//   //   }
//   // }
//
//   // void refreshAllCallouts() {
//   //   print('Overlay Helper refresh');
//   //   if (false) developer.log('refresh', name: 'om');
//   //   for (var el in _overlayItems) {
//   //     // if (el is ToastCallout) {
//   //     //   // el.refresh(() => el.tR = el.targetRectangle());
//   //     //   el.refresh((){});
//   //     // }
//   //     if (el is Callout) {
//   //       Callout callout = el;
//   //       callout.refreshOverlay(() {
//   //         callout.widthF = callout.originalWidthF;
//   //         callout.heightF = callout.originalHeightF;
//   //         // callout.tR = callout.targetRectangle();
//   //         callout.possibleMeasure().then((_) {
//   //           callout.didAnimateYet = false;
//   //           callout.initialAnimatedPositionDurationMs = 500;
//   //           callout.calcContentTopLeft();
//   //           callout.refreshOverlay(() {
//   //             // callout.tR = callout.targetRectangle();
//   //             callout.didAnimateYet = false;
//   //             callout.initialAnimatedPositionDurationMs = 500;
//   //             callout.calcContentTopLeft();
//   //             Future.delayed(const Duration(milliseconds: 500), () {
//   //               callout.refreshOverlay(() {
//   //                 callout.didAnimateYet = true;
//   //               });
//   //             });
//   //           });
//   //         });
//   //         //callout.didAnimateYet = true;
//   //       });
//   //     }
//   //   }
//   // }
//
//   // void refreshIfOffscreen({bool force = false}) {
//   //   for (var el in _overlayItems) {
//   //     if (el is ToastCallout) {
//   //       el.refreshOverlay(() => el.tR = el.targetRectangle());
//   //     } else if (el is Callout) {
//   //       Callout callout = el;
//   //       callout.refresh();
//   //     }
//   //   }
//   // }
//
//   // void refreshCallout(Callout callout) {
//   //   if (false) developer.log('refreshCallout', name: 'om');
//   //   callout.refresh(() => callout.tR = callout.targetRectangle());
//   // }
//
// // void refreshCallout(Callout callout) {
// //   if (false) developer.log('refreshCallout', name: 'om');
// //   callout.refreshOverlay(() {
// //     callout.widthF = callout.originalWidthF;
// //     callout.heightF = callout.originalHeightF;
// //     // callout.tR = callout.targetRectangle();
// //     callout.tR = callout.targetRectangle();
// //     callout.possibleMeasure().then((_) {
// //       callout.didAnimateYet = false;
// //       callout.initialAnimatedPositionDurationMs = 500;
// //       callout.calcContentTopLeft();
// //       callout.refreshOverlay(() {
// //         // callout.tR = callout.targetRectangle();
// //         callout.didAnimateYet = false;
// //         callout.initialAnimatedPositionDurationMs = 500;
// //         callout.calcContentTopLeft();
// //         Future.delayed(const Duration(milliseconds: 500), () {
// //           callout.refreshOverlay(() {
// //             callout.didAnimateYet = true;
// //           });
// //         });
// //       });
// //     });
// //     //callout.didAnimateYet = true;
// //   });
// // }
//
// // void reinit() {
// //   for (var element in _overlayItems) {
// //     if (element is Callout) element.init();
// //     if (element is ToastCallout) element.init();
// //   }
// // }
//
// // void refreshAllEntries() async {
// //   overlayState.refresh(() {
// //     overlayItems.forEach((element) {
// //       if (element is Callout)
// //         element.tR = element.targetRectangle();
// //     });
// //     if (false) developer.log('refreshAll()', name:'om');
// //   });
// // }
//
// // void removeCallout(Callout theCallout, bool theResult) {
// //   if (_overlayItems.contains(theCallout)) {
// //     int pos = _overlayItems.indexOf(theCallout);
// //     Callout foundCallout = _overlayItems[pos] as Callout;
// //     foundCallout.completed(theResult);
// //     _overlayItems.remove(foundCallout);
// //     print("num overlay items is now: ${_overlayItems.length}");
// //   }
// // }
// //
// // void removeToast(ToastCallout theToast, bool theResult) {
// //   if (_overlayItems.contains(theToast)) {
// //     int pos = _overlayItems.indexOf(theToast);
// //     ToastCallout foundToast = _overlayItems[pos] as ToastCallout;
// //     foundToast.completed(theResult);
// //     _overlayItems.remove(theToast);
// //     print("num overlay items is now: ${_overlayItems.length}");
// //   }
// // }
//
// // ToastCallout? findToast(int theFeature) {
// //   for (Object el in _overlayItems) {
// //     if (el is ToastCallout && el.feature == theFeature) return el;
// //   }
// //   return null;
// // }
// //
// // int findRelated() {
// //   int count = 0;
// //   for (Object el in _overlayItems) {
// //     if (el is! Callout && el is! ToastCallout) {
// //       count++;
// //     }
// //   }
// //   return count;
// // }
//
// // void refreshCalloutBubbleByFeature(int feature, VoidCallback func) {
// //   Callout? callout = findCallout(feature);
// //   if (callout != null) {
// //     callout.updateTarget;
// //   }
// // }
//
//   void refreshCalloutByFeature(Feature feature, VoidCallback func) {
//     findCallout(feature)?.rebuildOverlays(func);
//   }
//
// // void removeToastByFeature(int feature, bool theResult) {
// //   if (false) developer.log('removeToastByFeature', name: 'om');
// //   ToastCallout? c = findToast(feature);
// //   if (c != null) removeToast(c, theResult);
// // }
//
// // void removeTopCallout() {
// //   if (_overlayItems.isNotEmpty) {
// //     int topPos = _overlayItems.length - 1;
// //     if (_overlayItems[topPos] is Callout) {
// //       Callout c = _overlayItems[topPos] as Callout;
// //       removeCallout(c, false);
// //     }
// //   }
// // }
//
// // void removeTopToast() {
// //   if (false) developer.log('removeTopToast', name: 'om');
// //   if (_overlayItems.isNotEmpty) {
// //     int topPos = _overlayItems.length - 1;
// //     if (_overlayItems[topPos] is ToastCallout) {
// //       ToastCallout c = _overlayItems[topPos] as ToastCallout;
// //       removeToast(c, false);
// //     }
// //   }
// // }
//
// // void clearAllCallouts({List<int> exceptions = const []}) {
// //   if (false) developer.log('clearAllCallouts', name: 'om');
// //   for (int i = _overlayItems.length; i > 0; i--) {
// //     Object el = _overlayItems[i - 1];
// //     if (el is Callout && !exceptions.contains(el.feature) && el.feature > -1) {
// //       removeCallout(el, false);
// //     }
// //   }
// // }
// //
// // void clearAllToasts({List<int> exceptions = const []}) {
// //   if (false) developer.log('clearAllToasts', name: 'om');
// //   for (int i = _overlayItems.length; i > 0; i--) {
// //     Object el = _overlayItems[i - 1];
// //     if (el is ToastCallout && !exceptions.contains(el.feature) && el.feature > -1) {
// //       removeToast(el, false);
// //     }
// //   }
// // }
// //
// // void clearAll({List<int> exceptions = const []}) {
// //   if (false) developer.log('clearAll', name: 'om');
// //   for (int i = _overlayItems.length; i > 0; i--) {
// //     Object el = _overlayItems[i - 1];
// //     if (el is ToastCallout && !exceptions.contains(el.feature) && el.feature > -1) {
// //       removeToast(el, false);
// //     } else if (el is Callout && !exceptions.contains(el.feature) && el.feature > -1) {
// //       removeCallout(el, false);
// //     } else if (el is OverlayEntry && el.mounted) {
// //       removeOverlayEntry(el);
// //     }
// //   }
// // }
//
//   refreshParentCallout(BuildContext ctx, VoidCallback f) {
//     CalloutParent? parent = ctx.findAncestorWidgetOfExactType<CalloutParent>();
//     if (parent != null) {
//       Callout? callout = findCallout(parent.feature);
//       callout?.rebuildOverlays(f);
//     }
//   }
//
//   hideParentCallout(BuildContext ctx) {
//     CalloutParent? parent = ctx.findAncestorWidgetOfExactType<CalloutParent>();
//     if (parent != null) {
//       Callout? callout = findCallout(parent.feature);
//       callout?.hide();
//     }
//   }
//
//   unhideParentCallout(BuildContext ctx) {
//     CalloutParent? parent = ctx.findAncestorWidgetOfExactType<CalloutParent>();
//     if (parent != null) {
//       Callout? callout = findCallout(parent.feature);
//       callout?.unhide();
//     }
//   }
//
//   preventParentCalloutDrag(BuildContext ctx) {
//     CalloutParent? parent = ctx.findAncestorWidgetOfExactType<CalloutParent>();
//     if (parent != null) {
//       Callout? callout = findCallout(parent.feature);
//       callout?.config.preventDrag = true;
//     }
//   }
//
//   allowParentCalloutDrag(BuildContext ctx) {
//     CalloutParent? parent = ctx.findAncestorWidgetOfExactType<CalloutParent>();
//     if (parent != null) {
//       // delay to allow _onContentPointerUp to do its thing
//       Useful.afterMsDelayDo(300, () {
//         Callout? callout = findCallout(parent.feature);
//         callout?.config.preventDrag = true;
//       });
//     }
//   }
//
//
// //------------------------------------------------------------------------------------------
//
// OverlayEntry? _cpiOverlay;
// Timer? _cpiTimer;
//
// void showCircularProgressIndicator(bool theBool, {required String reason}) {
//   if (theBool) {
//     remove(CAPI.CPI.name, true);
//     _cpiOverlay = OverlayEntry(
//       builder: (BuildContext overlayContext) {
//         return Center(
//           child: SizedBox(
//             child: Useful.isAndroid
//                 ? const CircularProgressIndicator(strokeWidth: 50.0, color: Colors.green)
//                 : const CupertinoActivityIndicator(
//               radius: 50,
//             ),
//             width: 100,
//             height: 100,
//           ),
//         );
//       },
//       opaque: false,
//     );
//     overlayState.insert(_cpiOverlay!);
//     CPIReasonStack.singleton().push(reason);
//     // jic hide never called, set timeout at 10s
//     if (_cpiTimer?.isActive ?? false) _cpiTimer?.cancel();
//     _cpiTimer = Timer(const Duration(seconds: 10), () {
//       if (CPIReasonStack
//           .singleton()
//           .length > 0) {
//         CPIReasonStack.singleton().pop();
//         if (CPIReasonStack
//             .singleton()
//             .length == 0 && _cpiOverlay != null) _cpiOverlay?.remove();
//       }
//     });
//   } else {
//     _cpiTimer?.cancel();
//     if (CPIReasonStack
//         .singleton()
//         .length > 0) {
//       CPIReasonStack.singleton().pop();
//       if (CPIReasonStack
//           .singleton()
//           .length == 0 && _cpiOverlay != null) _cpiOverlay?.remove();
//     }
//   }
// }}
