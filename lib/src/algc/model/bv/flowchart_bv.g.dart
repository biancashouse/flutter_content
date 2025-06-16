// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flowchart_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FlowchartBV> _$flowchartBVSerializer = _$FlowchartBVSerializer();

class _$FlowchartBVSerializer implements StructuredSerializer<FlowchartBV> {
  @override
  final Iterable<Type> types = const [FlowchartBV, _$FlowchartBV];
  @override
  final String wireName = 'FlowchartBV';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    FlowchartBV object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.createdMs;
    if (value != null) {
      result
        ..add('createdMs')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ownerEa;
    if (value != null) {
      result
        ..add('ownerEa')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.lastModifiedMs;
    if (value != null) {
      result
        ..add('lastModifiedMs')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.deleted;
    if (value != null) {
      result
        ..add('deleted')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.descr;
    if (value != null) {
      result
        ..add('descr')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.imageSize;
    if (value != null) {
      result
        ..add('imageSize')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.pageSize;
    if (value != null) {
      result
        ..add('pageSize')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.beginTxt;
    if (value != null) {
      result
        ..add('beginTxt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.flowchartComment;
    if (value != null) {
      result
        ..add('flowchartComment')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(CommentBV),
          ),
        );
    }
    value = object.beginComment;
    if (value != null) {
      result
        ..add('beginComment')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(CommentBV),
          ),
        );
    }
    value = object.stepsMap;
    if (value != null) {
      result
        ..add('stepsMap')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(BuiltList, const [const FullType(StepBV)]),
            ]),
          ),
        );
    }
    value = object.previousVersionMap;
    if (value != null) {
      result
        ..add('previousVersionMap')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(String),
            ]),
          ),
        );
    }
    value = object.endTxt;
    if (value != null) {
      result
        ..add('endTxt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.endComment;
    if (value != null) {
      result
        ..add('endComment')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(CommentBV),
          ),
        );
    }
    value = object.colorValue;
    if (value != null) {
      result
        ..add('colorValue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.showColouredTrueAndFalse;
    if (value != null) {
      result
        ..add('showColouredTrueAndFalse')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }
    return result;
  }

  @override
  FlowchartBV deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FlowchartBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'createdMs':
          result.createdMs =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'ownerEa':
          result.ownerEa =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'lastModifiedMs':
          result.lastModifiedMs =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'deleted':
          result.deleted =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool?;
          break;
        case 'title':
          result.title =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'descr':
          result.descr =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'imageSize':
          result.imageSize =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'version':
          result.version =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'pageSize':
          result.pageSize =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'beginTxt':
          result.beginTxt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'flowchartComment':
          result.flowchartComment.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CommentBV),
                )!
                as CommentBV,
          );
          break;
        case 'beginComment':
          result.beginComment.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CommentBV),
                )!
                as CommentBV,
          );
          break;
        case 'stepsMap':
          result.stepsMap.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(StepBV)]),
              ]),
            )!,
          );
          break;
        case 'previousVersionMap':
          result.previousVersionMap.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(String),
              ]),
            )!,
          );
          break;
        case 'endTxt':
          result.endTxt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'endComment':
          result.endComment.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CommentBV),
                )!
                as CommentBV,
          );
          break;
        case 'colorValue':
          result.colorValue =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'showColouredTrueAndFalse':
          result.showColouredTrueAndFalse =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$FlowchartBV extends FlowchartBV {
  @override
  final String? id;
  @override
  final int? createdMs;
  @override
  final String? ownerEa;
  @override
  final int? lastModifiedMs;
  @override
  final bool? deleted;
  @override
  final String? title;
  @override
  final String? descr;
  @override
  final int? imageSize;
  @override
  final String? version;
  @override
  final String? pageSize;
  @override
  final String? beginTxt;
  @override
  final CommentBV? flowchartComment;
  @override
  final CommentBV? beginComment;
  @override
  final BuiltMap<String, BuiltList<StepBV>>? stepsMap;
  @override
  final BuiltMap<String, String>? previousVersionMap;
  @override
  final String? endTxt;
  @override
  final CommentBV? endComment;
  @override
  final int? colorValue;
  @override
  final bool? showColouredTrueAndFalse;

  factory _$FlowchartBV([void Function(FlowchartBVBuilder)? updates]) =>
      (FlowchartBVBuilder()..update(updates))._build();

  _$FlowchartBV._({
    this.id,
    this.createdMs,
    this.ownerEa,
    this.lastModifiedMs,
    this.deleted,
    this.title,
    this.descr,
    this.imageSize,
    this.version,
    this.pageSize,
    this.beginTxt,
    this.flowchartComment,
    this.beginComment,
    this.stepsMap,
    this.previousVersionMap,
    this.endTxt,
    this.endComment,
    this.colorValue,
    this.showColouredTrueAndFalse,
  }) : super._();
  @override
  FlowchartBV rebuild(void Function(FlowchartBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlowchartBVBuilder toBuilder() => FlowchartBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlowchartBV &&
        id == other.id &&
        createdMs == other.createdMs &&
        ownerEa == other.ownerEa &&
        lastModifiedMs == other.lastModifiedMs &&
        deleted == other.deleted &&
        title == other.title &&
        descr == other.descr &&
        imageSize == other.imageSize &&
        version == other.version &&
        pageSize == other.pageSize &&
        beginTxt == other.beginTxt &&
        flowchartComment == other.flowchartComment &&
        beginComment == other.beginComment &&
        stepsMap == other.stepsMap &&
        previousVersionMap == other.previousVersionMap &&
        endTxt == other.endTxt &&
        endComment == other.endComment &&
        colorValue == other.colorValue &&
        showColouredTrueAndFalse == other.showColouredTrueAndFalse;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdMs.hashCode);
    _$hash = $jc(_$hash, ownerEa.hashCode);
    _$hash = $jc(_$hash, lastModifiedMs.hashCode);
    _$hash = $jc(_$hash, deleted.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, descr.hashCode);
    _$hash = $jc(_$hash, imageSize.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jc(_$hash, beginTxt.hashCode);
    _$hash = $jc(_$hash, flowchartComment.hashCode);
    _$hash = $jc(_$hash, beginComment.hashCode);
    _$hash = $jc(_$hash, stepsMap.hashCode);
    _$hash = $jc(_$hash, previousVersionMap.hashCode);
    _$hash = $jc(_$hash, endTxt.hashCode);
    _$hash = $jc(_$hash, endComment.hashCode);
    _$hash = $jc(_$hash, colorValue.hashCode);
    _$hash = $jc(_$hash, showColouredTrueAndFalse.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlowchartBV')
          ..add('id', id)
          ..add('createdMs', createdMs)
          ..add('ownerEa', ownerEa)
          ..add('lastModifiedMs', lastModifiedMs)
          ..add('deleted', deleted)
          ..add('title', title)
          ..add('descr', descr)
          ..add('imageSize', imageSize)
          ..add('version', version)
          ..add('pageSize', pageSize)
          ..add('beginTxt', beginTxt)
          ..add('flowchartComment', flowchartComment)
          ..add('beginComment', beginComment)
          ..add('stepsMap', stepsMap)
          ..add('previousVersionMap', previousVersionMap)
          ..add('endTxt', endTxt)
          ..add('endComment', endComment)
          ..add('colorValue', colorValue)
          ..add('showColouredTrueAndFalse', showColouredTrueAndFalse))
        .toString();
  }
}

class FlowchartBVBuilder implements Builder<FlowchartBV, FlowchartBVBuilder> {
  _$FlowchartBV? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdMs;
  int? get createdMs => _$this._createdMs;
  set createdMs(int? createdMs) => _$this._createdMs = createdMs;

  String? _ownerEa;
  String? get ownerEa => _$this._ownerEa;
  set ownerEa(String? ownerEa) => _$this._ownerEa = ownerEa;

  int? _lastModifiedMs;
  int? get lastModifiedMs => _$this._lastModifiedMs;
  set lastModifiedMs(int? lastModifiedMs) =>
      _$this._lastModifiedMs = lastModifiedMs;

  bool? _deleted;
  bool? get deleted => _$this._deleted;
  set deleted(bool? deleted) => _$this._deleted = deleted;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _descr;
  String? get descr => _$this._descr;
  set descr(String? descr) => _$this._descr = descr;

  int? _imageSize;
  int? get imageSize => _$this._imageSize;
  set imageSize(int? imageSize) => _$this._imageSize = imageSize;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _pageSize;
  String? get pageSize => _$this._pageSize;
  set pageSize(String? pageSize) => _$this._pageSize = pageSize;

  String? _beginTxt;
  String? get beginTxt => _$this._beginTxt;
  set beginTxt(String? beginTxt) => _$this._beginTxt = beginTxt;

  CommentBVBuilder? _flowchartComment;
  CommentBVBuilder get flowchartComment =>
      _$this._flowchartComment ??= CommentBVBuilder();
  set flowchartComment(CommentBVBuilder? flowchartComment) =>
      _$this._flowchartComment = flowchartComment;

  CommentBVBuilder? _beginComment;
  CommentBVBuilder get beginComment =>
      _$this._beginComment ??= CommentBVBuilder();
  set beginComment(CommentBVBuilder? beginComment) =>
      _$this._beginComment = beginComment;

  MapBuilder<String, BuiltList<StepBV>>? _stepsMap;
  MapBuilder<String, BuiltList<StepBV>> get stepsMap =>
      _$this._stepsMap ??= MapBuilder<String, BuiltList<StepBV>>();
  set stepsMap(MapBuilder<String, BuiltList<StepBV>>? stepsMap) =>
      _$this._stepsMap = stepsMap;

  MapBuilder<String, String>? _previousVersionMap;
  MapBuilder<String, String> get previousVersionMap =>
      _$this._previousVersionMap ??= MapBuilder<String, String>();
  set previousVersionMap(MapBuilder<String, String>? previousVersionMap) =>
      _$this._previousVersionMap = previousVersionMap;

  String? _endTxt;
  String? get endTxt => _$this._endTxt;
  set endTxt(String? endTxt) => _$this._endTxt = endTxt;

  CommentBVBuilder? _endComment;
  CommentBVBuilder get endComment => _$this._endComment ??= CommentBVBuilder();
  set endComment(CommentBVBuilder? endComment) =>
      _$this._endComment = endComment;

  int? _colorValue;
  int? get colorValue => _$this._colorValue;
  set colorValue(int? colorValue) => _$this._colorValue = colorValue;

  bool? _showColouredTrueAndFalse;
  bool? get showColouredTrueAndFalse => _$this._showColouredTrueAndFalse;
  set showColouredTrueAndFalse(bool? showColouredTrueAndFalse) =>
      _$this._showColouredTrueAndFalse = showColouredTrueAndFalse;

  FlowchartBVBuilder();

  FlowchartBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdMs = $v.createdMs;
      _ownerEa = $v.ownerEa;
      _lastModifiedMs = $v.lastModifiedMs;
      _deleted = $v.deleted;
      _title = $v.title;
      _descr = $v.descr;
      _imageSize = $v.imageSize;
      _version = $v.version;
      _pageSize = $v.pageSize;
      _beginTxt = $v.beginTxt;
      _flowchartComment = $v.flowchartComment?.toBuilder();
      _beginComment = $v.beginComment?.toBuilder();
      _stepsMap = $v.stepsMap?.toBuilder();
      _previousVersionMap = $v.previousVersionMap?.toBuilder();
      _endTxt = $v.endTxt;
      _endComment = $v.endComment?.toBuilder();
      _colorValue = $v.colorValue;
      _showColouredTrueAndFalse = $v.showColouredTrueAndFalse;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlowchartBV other) {
    _$v = other as _$FlowchartBV;
  }

  @override
  void update(void Function(FlowchartBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlowchartBV build() => _build();

  _$FlowchartBV _build() {
    _$FlowchartBV _$result;
    try {
      _$result =
          _$v ??
          _$FlowchartBV._(
            id: id,
            createdMs: createdMs,
            ownerEa: ownerEa,
            lastModifiedMs: lastModifiedMs,
            deleted: deleted,
            title: title,
            descr: descr,
            imageSize: imageSize,
            version: version,
            pageSize: pageSize,
            beginTxt: beginTxt,
            flowchartComment: _flowchartComment?.build(),
            beginComment: _beginComment?.build(),
            stepsMap: _stepsMap?.build(),
            previousVersionMap: _previousVersionMap?.build(),
            endTxt: endTxt,
            endComment: _endComment?.build(),
            colorValue: colorValue,
            showColouredTrueAndFalse: showColouredTrueAndFalse,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'flowchartComment';
        _flowchartComment?.build();
        _$failedField = 'beginComment';
        _beginComment?.build();
        _$failedField = 'stepsMap';
        _stepsMap?.build();
        _$failedField = 'previousVersionMap';
        _previousVersionMap?.build();

        _$failedField = 'endComment';
        _endComment?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'FlowchartBV',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
