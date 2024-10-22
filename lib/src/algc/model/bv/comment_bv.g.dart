// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentBV> _$commentBVSerializer = new _$CommentBVSerializer();

class _$CommentBVSerializer implements StructuredSerializer<CommentBV> {
  @override
  final Iterable<Type> types = const [CommentBV, _$CommentBV];
  @override
  final String wireName = 'CommentBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.calloutWidth;
    if (value != null) {
      result
        ..add('calloutWidth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.calloutHeight;
    if (value != null) {
      result
        ..add('calloutHeight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.snippetEncodedJson;
    if (value != null) {
      result
        ..add('snippetEncodedJson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.topTxt;
    if (value != null) {
      result
        ..add('topTxt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bottomTxt;
    if (value != null) {
      result
        ..add('bottomTxt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageSize;
    if (value != null) {
      result
        ..add('imageSize')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CommentBV deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'calloutWidth':
          result.calloutWidth = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'calloutHeight':
          result.calloutHeight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'snippetEncodedJson':
          result.snippetEncodedJson = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'topTxt':
          result.topTxt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bottomTxt':
          result.bottomTxt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageSize':
          result.imageSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentBV extends CommentBV {
  @override
  final double? calloutWidth;
  @override
  final double? calloutHeight;
  @override
  final String? snippetEncodedJson;
  @override
  final String? topTxt;
  @override
  final String? bottomTxt;
  @override
  final int? imageSize;

  factory _$CommentBV([void Function(CommentBVBuilder)? updates]) =>
      (new CommentBVBuilder()..update(updates))._build();

  _$CommentBV._(
      {this.calloutWidth,
      this.calloutHeight,
      this.snippetEncodedJson,
      this.topTxt,
      this.bottomTxt,
      this.imageSize})
      : super._();

  @override
  CommentBV rebuild(void Function(CommentBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentBVBuilder toBuilder() => new CommentBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentBV &&
        calloutWidth == other.calloutWidth &&
        calloutHeight == other.calloutHeight &&
        snippetEncodedJson == other.snippetEncodedJson &&
        topTxt == other.topTxt &&
        bottomTxt == other.bottomTxt &&
        imageSize == other.imageSize;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, calloutWidth.hashCode);
    _$hash = $jc(_$hash, calloutHeight.hashCode);
    _$hash = $jc(_$hash, snippetEncodedJson.hashCode);
    _$hash = $jc(_$hash, topTxt.hashCode);
    _$hash = $jc(_$hash, bottomTxt.hashCode);
    _$hash = $jc(_$hash, imageSize.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentBV')
          ..add('calloutWidth', calloutWidth)
          ..add('calloutHeight', calloutHeight)
          ..add('snippetEncodedJson', snippetEncodedJson)
          ..add('topTxt', topTxt)
          ..add('bottomTxt', bottomTxt)
          ..add('imageSize', imageSize))
        .toString();
  }
}

class CommentBVBuilder implements Builder<CommentBV, CommentBVBuilder> {
  _$CommentBV? _$v;

  double? _calloutWidth;
  double? get calloutWidth => _$this._calloutWidth;
  set calloutWidth(double? calloutWidth) => _$this._calloutWidth = calloutWidth;

  double? _calloutHeight;
  double? get calloutHeight => _$this._calloutHeight;
  set calloutHeight(double? calloutHeight) =>
      _$this._calloutHeight = calloutHeight;

  String? _snippetEncodedJson;
  String? get snippetEncodedJson => _$this._snippetEncodedJson;
  set snippetEncodedJson(String? snippetEncodedJson) =>
      _$this._snippetEncodedJson = snippetEncodedJson;

  String? _topTxt;
  String? get topTxt => _$this._topTxt;
  set topTxt(String? topTxt) => _$this._topTxt = topTxt;

  String? _bottomTxt;
  String? get bottomTxt => _$this._bottomTxt;
  set bottomTxt(String? bottomTxt) => _$this._bottomTxt = bottomTxt;

  int? _imageSize;
  int? get imageSize => _$this._imageSize;
  set imageSize(int? imageSize) => _$this._imageSize = imageSize;

  CommentBVBuilder();

  CommentBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _calloutWidth = $v.calloutWidth;
      _calloutHeight = $v.calloutHeight;
      _snippetEncodedJson = $v.snippetEncodedJson;
      _topTxt = $v.topTxt;
      _bottomTxt = $v.bottomTxt;
      _imageSize = $v.imageSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentBV other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentBV;
  }

  @override
  void update(void Function(CommentBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentBV build() => _build();

  _$CommentBV _build() {
    final _$result = _$v ??
        new _$CommentBV._(
            calloutWidth: calloutWidth,
            calloutHeight: calloutHeight,
            snippetEncodedJson: snippetEncodedJson,
            topTxt: topTxt,
            bottomTxt: bottomTxt,
            imageSize: imageSize);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
