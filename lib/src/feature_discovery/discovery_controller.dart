import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/gotits/gotits_helper_int.dart';

import 'featured_widget.dart';
import 'play_callout_button.dart';
import 'play_overlays_button.dart';

class DiscoveryController {
  final Function? _onFinishedPlaying;
  final List<GlobalKey<PlayOverlaysButtonState>?> _playOverlayButtonsPresent = [];
  final List<GlobalKey<PlayCalloutButtonState>> _playBottomSheetButtonsPresent = [];
  final List<GlobalKey<FeaturedWidgetState>?> _featuredWidgetsPresent = [];
  List<int> playList = [];
  int index = -1;
  Timer? startPlayTimer;

  static Map<int, Color>? featureBgColors;
  static late Map<int, Color> featureFgColors;

  DiscoveryController(this._onFinishedPlaying);

  void registerPlayFeaturesButton(GlobalKey<PlayOverlaysButtonState>? theGlobalKey) {
    _playOverlayButtonsPresent.add(theGlobalKey);
  }

  void registerPlayBottomSheetButton(GlobalKey<PlayCalloutButtonState> theGlobalKey) {
    _playBottomSheetButtonsPresent.add(theGlobalKey);
  }

  void registerFeaturedWidget(GlobalKey<FeaturedWidgetState>? theGlobalKey) {
    _featuredWidgetsPresent.add(theGlobalKey);
  }

  /// find the featured widget having this id
  FeaturedWidget? findFeaturedWidget(int theFeature) {
    List<FeaturedWidget> found = [];
    for (var fwgk in _featuredWidgetsPresent) {
      FeaturedWidget? fw = fwgk!.currentWidget as FeaturedWidget?;
      if (fw != null && fw.featureEnum == theFeature) found.add(fw);
    }
    return (found.isEmpty || found.length > 1) ? null : found[0];
  }

  /// find any player buttons that would play this feature
  List<PlayOverlaysButton> findPlayerButtons(int theFeature) {
    List<PlayOverlaysButton> found = [];
    _playOverlayButtonsPresent.where((pbgk) {
      PlayOverlaysButton? pb = pbgk!.currentWidget as PlayOverlaysButton?;
      if (pb != null && pb.features.contains(theFeature)) {
        found.add(pb);
        return true;
      } else {
        return false;
      }
    });
    return found;
  }

//  void forcePlay(FeatureEnum theFeature) {
//    if (!playList.contains(theFeature)) playList.add(theFeature);
//
//    //need index to point to item for activeDiscoverable()
//    index = playList.indexOf(theFeature);
//    FeaturedWidget container = widgetOf(theFeature) as FeaturedWidget;
//    container?.play();
//  }

  void startPlay(List<int> theFeatures, {int afterSecs = 0}) {
    startPlayTimer = Timer(Duration(seconds: afterSecs), () {
      startPlayTimer = null;
      playList = theFeatures;
      index = -1;
      playNext();
    });
  }

  void playNext() {
//    //print('Gotits: ${repo.gotits()}');
//    _present.forEach((f, g) {
//      //String key = repo.shortFeatureKey(f);
//      //print('Present: $key');
//    });
//    playList.forEach((f) {
//      //String key = repo.shortFeatureKey(f);
//      //print('playList: $key');
//    });
    while (++index < playList.length) {
      int playItem = playList[index];
      FeaturedWidget? foundW = findFeaturedWidget(playItem);
      if (foundW != null && !GotitsHelperInt.alreadyGotit(playItem)) {
        //print('Playing: ${repo.shortFeatureKey(playItem)}');
        foundW.play();
        return;
      }
    }

    if (_onFinishedPlaying != null) {
      _onFinishedPlaying();
    }
    // print('End of Feature Discovery');
  }

  void stopPlay({Function? afterStopF}) {
    //print('DISCOVERY STOPPED');
    if (startPlayTimer?.isActive ?? false) {
      startPlayTimer!.cancel();
      startPlayTimer = null;
    }
    if (index > -1 && index < playList.length) {
      int playItem = playList[index];
      FeaturedWidget? foundW = findFeaturedWidget(playItem);
      if (foundW != null) {
        index = 99999;
        foundW.stop();
      }
    }
    // wait until dismiss controller finished
    // jic delay
    Timer(dismissControllerDuration, () {
      afterStopF?.call();
    });
  }

  void triggerPlayButtonRebuild(Feature theFeature) {
    // find players for given featured widget
    for (var pbgk in _playOverlayButtonsPresent) {
      PlayOverlaysButtonState? pbs = pbgk!.currentState;
      PlayOverlaysButton? pb = pbgk.currentWidget as PlayOverlaysButton?;
      if (pbs != null && pb!.features.contains(theFeature)) {
        pbs.refresh(() {
          //print('setState for playbuttons for $theFeature}');
        });
      }
    }
  }

  int? activeFeature() {
    return index > -1 && index < playList.length ? playList[index] : null;
  }
}
