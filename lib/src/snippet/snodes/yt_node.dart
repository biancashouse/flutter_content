import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/iframe.dart';

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
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'Youtube Url',
          stringValue: ytUrl,
          onStringChange: (newValue) => refreshWithUpdate(() => ytUrl = newValue),
          calloutButtonSize: const Size(280, 20),
          calloutSize: const Size(280, 140),
        ),
    IntPropertyValueNode(
      snode: this,
      name: 'starts (secs)',
      intValue: startAtSecs,
      onIntChange: (newValue) => refreshWithUpdate(() => startAtSecs = newValue),
      calloutButtonSize: const Size(120, 20),
    ),
    IntPropertyValueNode(
      snode: this,
      name: 'ends (secs)',
      intValue: endAtSecs,
      onIntChange: (newValue) => refreshWithUpdate(() => endAtSecs = newValue),
      calloutButtonSize: const Size(120, 20),
    ),
    DecimalPropertyValueNode(
      snode: this,
      name: 'iframeWidth',
      decimalValue: iframeWidth,
      onDoubleChange: (newValue) => refreshWithUpdate(() => iframeWidth = newValue ?? 800),
      calloutButtonSize: const Size(90, 20),
    ),
    DecimalPropertyValueNode(
      snode: this,
      name: 'iframeHeight',
      decimalValue: iframeHeight,
      onDoubleChange: (newValue) => refreshWithUpdate(() => iframeHeight = newValue ?? 800),
      calloutButtonSize: const Size(90, 20),
    ),
  ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    possiblyHighlightSelectedNode();
    // final ytId = getIdFromUrl(ytUrl??'') ?? 'zWh3CShX_do';
    // final controller = YoutubePlayerController.fromVideoId(
    //   videoId: ytId,
    //   autoPlay: false,
    //   params: const YoutubePlayerParams(showFullscreenButton: true),
    // );
    String embedUrl = extractUrlFromIframe(ytUrl)??'https://www.youtube.com/embed/u1FAoLEG16c?si=gNKISAxvqR4Bto9k&amp;start=26&amp;end=70&amp;rel=0';
    if (startAtSecs!=null) embedUrl += "&amp;start=$startAtSecs";
    if (endAtSecs!=null) embedUrl += "&amp;end=$endAtSecs";
    embedUrl += '&amp;rel=0';
      return SizedBox(width: iframeWidth, height: iframeHeight,
        child: AspectRatio(aspectRatio: 16/9,
        child: IFrame(
          key: createNodeGK(),
          src: embedUrl,
          iframeW: iframeWidth,
          iframeH: iframeHeight,
          forceRefresh: true,
        ),
      ),
    );

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
  String toString() => 'YT';

  @override
  Widget? logoSrc() => Row(children: [
        const Icon(Icons.link),
        hspacer(6),
      ]);

  static const String FLUTTER_TYPE = "YT";
}