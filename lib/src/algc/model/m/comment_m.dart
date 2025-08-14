import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/bv/comment_bv.dart';
import 'package:flutter_content/src/algc/model/m/string_encoder_decoder.dart';

import 'flowchart_m.dart';
import 'has_image.dart';

class CommentM with HasImageInFBStorage, StringEncoderDecoder {
  // implicit id is /ea/fId/b|e|stepId, which is used to find its image in storage
  CommentM();

  // initially a 300x200 placeholder
  double? calloutWidth = 300;
  double? calloutHeight = 200;
  SnippetRootNode? snippet = SnippetRootNode(name: 'who-cares', child: PlaceholderNode());

  String? _topTxt;
  String? _bottomTxt;
  double? fsTop;
  double? fsBottom;

  // transient cache
  GlobalKey? imageGK;
  GlobalKey? topTxtGK;
  GlobalKey? bottomTxtGK;

  String? get topTxt => _topTxt != null &&
          _topTxt != 'optional top comment here...' &&
          _topTxt != 'more comment here: double tap to edit...'
      ? decodeString(_topTxt!)
      : null;

  String? get bottomTxt => _bottomTxt != null &&
          _bottomTxt != 'optional bottom comment...' &&
          _bottomTxt != 'more comment here: double tap to edit...'
      ? decodeString(_bottomTxt!)
      : null;

  set topTxt(String? s) {
    if (s != null) _topTxt = encodeString(s);
  }

  set bottomTxt(String? s) {
    if (s != null) _bottomTxt = encodeString(s);
  }

  static CommentM? commentBV2M(CommentBV? theBVComment) {
    if (theBVComment == null) return null;

    CommentM? mComment;

    try {
      mComment = CommentM()
        ..calloutWidth = theBVComment.calloutWidth ?? 300
        ..calloutHeight = theBVComment.calloutHeight ?? 200
        ..snippet = theBVComment.snippetEncodedJson != null
            ? SnippetRootNodeMapper.fromJson(
                jsonDecode(theBVComment.snippetEncodedJson!))
            : SnippetRootNode(name: 'who-cares', child: PlaceholderNode())
        ..topTxt = theBVComment.topTxt
        ..bottomTxt = theBVComment.bottomTxt
        // ..fsBottom = theBVComment.fsBottom
        // ..fsTop = theBVComment.fsTop
        ..imageSize = theBVComment.imageSize;
    } catch (e) {
      fco.logger.e('commentBV2M: ${e.toString()}');
    }
    return mComment;
  }

  CommentBV toBV() {
    return CommentBV.factory(
      theCalloutW: calloutWidth,
      theCalloutH: calloutHeight,
      theSnippetEncodedJson:
          snippet != null ? jsonEncode(snippet!.toJson()) : null,
      theCommentTop: topTxt,
      theCommentBottom: bottomTxt,
      theCommentImageSize: imageSize,
      // theFsCommentTop: fsTop,
      // theFsCommentBottom: fsTop,
    );
  }

  static String getCommentImageStorageKey(FlowchartM flowchart, int stepId) {
    // HACK changed the smaples ea
    var flowchartOwnerEa = flowchart.ownerEa ?? '';
    if (flowchartOwnerEa.isNotEmpty &&
        flowchartOwnerEa == 'samples@flowchart.studio') {
      flowchart.ownerEa = flowchartOwnerEa = 'algc.samples@biancashouse.com';
    }
    return '${flowchartOwnerEa.isNotEmpty ? 'algc/users/$flowchartOwnerEa' : "algc/users/algc.samples@biancashouse.com"}/${flowchart.id}/$stepId';
  }
}
