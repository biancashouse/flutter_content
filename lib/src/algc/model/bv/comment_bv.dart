import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comment_bv.g.dart';

/*
 * https://medium.com/flutter-io/some-options-for-deserializing-json-with-flutter-7481325a4450
 */

abstract class CommentBV implements Built<CommentBV, CommentBVBuilder> {
  static Serializer<CommentBV> get serializer => _$commentBVSerializer;

  double? get calloutWidth;
  double? get calloutHeight;
  String? get snippetEncodedJson;

  String? get topTxt;

  String? get bottomTxt;

  // double? get fsTop;
  //
  // double? get fsBottom;

  int?
      get imageSize; // null means no image,  0 means delete, >0 means image should be in LocalStore

  // notice we don't store the image bytes: they would be found in a pref or in the FB Storage

  CommentBV._();

  // may create one or two scopes dep on step type
  factory CommentBV.factory({
    double? theCalloutW,
    double? theCalloutH,
    String? theSnippetEncodedJson,
    String? theCommentTop,
    String? theCommentBottom,
    int? theCommentImageSize,
    // double? theFsCommentTop,
    // double? theFsCommentBottom,
  }) {
    var newComment = CommentBV((cs) => cs
          ..calloutWidth = theCalloutW
          ..calloutHeight = theCalloutH
          ..snippetEncodedJson = theSnippetEncodedJson
          ..topTxt = theCommentTop
          ..bottomTxt = theCommentBottom
          ..imageSize = theCommentImageSize
        // ..fsTop = theFsCommentTop
        // ..fsBottom = theFsCommentBottom
        );
    return newComment;
  }

  factory CommentBV([Function(CommentBVBuilder b)? updates]) = _$CommentBV;
}
