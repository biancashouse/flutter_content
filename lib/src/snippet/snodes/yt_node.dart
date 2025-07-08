// ignore_for_file: constant_identifier_names
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/int_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/iframe/iframe.dart';

// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

part 'yt_node.mapper.dart';

@MappableClass()
class YTNode extends CL with YTNodeMappable {
  String? ytUrl;
  int? startAtSecs;
  int? endAtSecs;
  double iframeWidth;
  double iframeHeight;

  YTNode({
    this.ytUrl,
    this.startAtSecs,
    this.endAtSecs,
    this.iframeWidth = 560, // not 595?
    this.iframeHeight = 316, // not 842?
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'IFrame',
        webLink: 'https://pub.dev/packages/webview_flutter_web',
        snode: this,
        name: 'fyi'),
        StringPNode(
          snode: this,
          name: 'Youtube Url',
          stringValue: ytUrl,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => ytUrl = newValue),
          calloutButtonSize: const Size(280, 20),
          calloutWidth: 280,
        ),
        IntPNode(
          snode: this,
          name: 'starts (secs)',
          intValue: startAtSecs,
          onIntChange: (newValue) =>
              refreshWithUpdate(context, () => startAtSecs = newValue),
          calloutButtonSize: const Size(120, 20),
        ),
        IntPNode(
          snode: this,
          name: 'ends (secs)',
          intValue: endAtSecs,
          onIntChange: (newValue) =>
              refreshWithUpdate(context, () => endAtSecs = newValue),
          calloutButtonSize: const Size(120, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'iframeWidth',
          decimalValue: iframeWidth,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => iframeWidth = newValue ?? 800),
          calloutButtonSize: const Size(90, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'iframeHeight',
          decimalValue: iframeHeight,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => iframeHeight = newValue ?? 800),
          calloutButtonSize: const Size(90, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      ) {
    try {
      setParent(parentNode); // propagating parents down from root
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      // final ytId = getIdFromUrl(ytUrl??'') ?? 'zWh3CShX_do';
      // final controller = YoutubePlayerController.fromVideoId(
      //   videoId: ytId,
      //   autoPlay: false,
      //   params: const YoutubePlayerParams(showFullscreenButton: true),
      // );
      String embedUrl = extractUrlFromIframe(ytUrl) ??
          'https://www.youtube.com/embed/u1FAoLEG16c?si=gNKISAxvqR4Bto9k&amp;start=26&amp;end=70&amp;rel=0';
      if (startAtSecs != null) embedUrl += "&amp;start=$startAtSecs";
      if (endAtSecs != null) embedUrl += "&amp;end=$endAtSecs";
      embedUrl += '&amp;rel=0';
      return SizedBox(
        width: iframeWidth,
        height: iframeHeight,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: IFrame(
            key: createNodeWidgetGK(),
            src: embedUrl,
            iframeW: iframeWidth,
            iframeH: iframeHeight,
            forceRefresh: true,
          ),
        ),
      );
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }

    // YoutubePlayer(
    // key: createNodeGK(),
    // controller: controller,
    // aspectRatio: 16 / 9,
    // );
  }

  String? extractUrlFromIframe(String? iframeTag) {
    if (iframeTag == null) return null;
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(iframeTag);
    return matches.first.group(0);
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''YT($YT)''';
  // }

  @override
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "YT";
}
