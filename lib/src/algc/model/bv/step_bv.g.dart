// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ChangeType _$txtOrComment = const ChangeType._('txtOrCommentChange');
const ChangeType _$newStep = const ChangeType._('newStep');
const ChangeType _$movedStep = const ChangeType._('movedStep');
const ChangeType _$trashedStep = const ChangeType._('trashedStep');

ChangeType _$stValueOf(String name) {
  switch (name) {
    case 'txtOrCommentChange':
      return _$txtOrComment;
    case 'newStep':
      return _$newStep;
    case 'movedStep':
      return _$movedStep;
    case 'trashedStep':
      return _$trashedStep;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ChangeType> _$stValues = BuiltSet<ChangeType>(const <ChangeType>[
  _$txtOrComment,
  _$newStep,
  _$movedStep,
  _$trashedStep,
]);

Serializer<StepBV> _$stepBVSerializer = _$StepBVSerializer();
Serializer<ChangeType> _$changeTypeSerializer = _$ChangeTypeSerializer();

class _$StepBVSerializer implements StructuredSerializer<StepBV> {
  @override
  final Iterable<Type> types = const [StepBV, _$StepBV];
  @override
  final String wireName = 'StepBV';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    StepBV object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.txt;
    if (value != null) {
      result
        ..add('txt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.iconIndex;
    if (value != null) {
      result
        ..add('iconIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.txtW;
    if (value != null) {
      result
        ..add('txtW')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.txtH;
    if (value != null) {
      result
        ..add('txtH')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(CommentBV),
          ),
        );
    }
    value = object.shape;
    if (value != null) {
      result
        ..add('shape')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.flowchartLinkRef;
    if (value != null) {
      result
        ..add('flowchartLinkRef')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.flowchartLinkVersion;
    if (value != null) {
      result
        ..add('flowchartLinkVersion')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.parentListType;
    if (value != null) {
      result
        ..add('parentListType')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.childStepLists;
    if (value != null) {
      result
        ..add('childStepLists')
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
    value = object.caseNameWidths;
    if (value != null) {
      result
        ..add('caseNameWidths')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(double),
            ]),
          ),
        );
    }
    value = object.dummyList;
    if (value != null) {
      result
        ..add('dummyList')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(StepBV),
            ]),
          ),
        );
    }
    value = object.changeType;
    if (value != null) {
      result
        ..add('changeType')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(ChangeType),
          ),
        );
    }
    return result;
  }

  @override
  StepBV deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StepBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'txt':
          result.txt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'iconIndex':
          result.iconIndex =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'txtW':
          result.txtW =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'txtH':
          result.txtH =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'comment':
          result.comment.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CommentBV),
                )!
                as CommentBV,
          );
          break;
        case 'shape':
          result.shape =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'flowchartLinkRef':
          result.flowchartLinkRef =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'flowchartLinkVersion':
          result.flowchartLinkVersion =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'parentListType':
          result.parentListType =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'childStepLists':
          result.childStepLists.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(StepBV)]),
              ]),
            )!,
          );
          break;
        case 'caseNameWidths':
          result.caseNameWidths.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(double),
              ]),
            )!,
          );
          break;
        case 'dummyList':
          result.dummyList.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(StepBV),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'changeType':
          result.changeType =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(ChangeType),
                  )
                  as ChangeType?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChangeTypeSerializer implements PrimitiveSerializer<ChangeType> {
  @override
  final Iterable<Type> types = const <Type>[ChangeType];
  @override
  final String wireName = 'ChangeType';

  @override
  Object serialize(
    Serializers serializers,
    ChangeType object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  ChangeType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ChangeType.valueOf(serialized as String);
}

class _$StepBV extends StepBV {
  @override
  final int? id;
  @override
  final String? txt;
  @override
  final int? iconIndex;
  @override
  final double? txtW;
  @override
  final double? txtH;
  @override
  final CommentBV? comment;
  @override
  final String? shape;
  @override
  final String? flowchartLinkRef;
  @override
  final int? flowchartLinkVersion;
  @override
  final String? parentListType;
  @override
  final BuiltMap<String, BuiltList<StepBV>>? childStepLists;
  @override
  final BuiltMap<String, double>? caseNameWidths;
  @override
  final BuiltList<StepBV>? dummyList;
  @override
  final ChangeType? changeType;

  factory _$StepBV([void Function(StepBVBuilder)? updates]) =>
      (StepBVBuilder()..update(updates))._build();

  _$StepBV._({
    this.id,
    this.txt,
    this.iconIndex,
    this.txtW,
    this.txtH,
    this.comment,
    this.shape,
    this.flowchartLinkRef,
    this.flowchartLinkVersion,
    this.parentListType,
    this.childStepLists,
    this.caseNameWidths,
    this.dummyList,
    this.changeType,
  }) : super._();
  @override
  StepBV rebuild(void Function(StepBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StepBVBuilder toBuilder() => StepBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StepBV &&
        id == other.id &&
        txt == other.txt &&
        iconIndex == other.iconIndex &&
        txtW == other.txtW &&
        txtH == other.txtH &&
        comment == other.comment &&
        shape == other.shape &&
        flowchartLinkRef == other.flowchartLinkRef &&
        flowchartLinkVersion == other.flowchartLinkVersion &&
        parentListType == other.parentListType &&
        childStepLists == other.childStepLists &&
        caseNameWidths == other.caseNameWidths &&
        dummyList == other.dummyList &&
        changeType == other.changeType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, txt.hashCode);
    _$hash = $jc(_$hash, iconIndex.hashCode);
    _$hash = $jc(_$hash, txtW.hashCode);
    _$hash = $jc(_$hash, txtH.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, shape.hashCode);
    _$hash = $jc(_$hash, flowchartLinkRef.hashCode);
    _$hash = $jc(_$hash, flowchartLinkVersion.hashCode);
    _$hash = $jc(_$hash, parentListType.hashCode);
    _$hash = $jc(_$hash, childStepLists.hashCode);
    _$hash = $jc(_$hash, caseNameWidths.hashCode);
    _$hash = $jc(_$hash, dummyList.hashCode);
    _$hash = $jc(_$hash, changeType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StepBV')
          ..add('id', id)
          ..add('txt', txt)
          ..add('iconIndex', iconIndex)
          ..add('txtW', txtW)
          ..add('txtH', txtH)
          ..add('comment', comment)
          ..add('shape', shape)
          ..add('flowchartLinkRef', flowchartLinkRef)
          ..add('flowchartLinkVersion', flowchartLinkVersion)
          ..add('parentListType', parentListType)
          ..add('childStepLists', childStepLists)
          ..add('caseNameWidths', caseNameWidths)
          ..add('dummyList', dummyList)
          ..add('changeType', changeType))
        .toString();
  }
}

class StepBVBuilder implements Builder<StepBV, StepBVBuilder> {
  _$StepBV? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _txt;
  String? get txt => _$this._txt;
  set txt(String? txt) => _$this._txt = txt;

  int? _iconIndex;
  int? get iconIndex => _$this._iconIndex;
  set iconIndex(int? iconIndex) => _$this._iconIndex = iconIndex;

  double? _txtW;
  double? get txtW => _$this._txtW;
  set txtW(double? txtW) => _$this._txtW = txtW;

  double? _txtH;
  double? get txtH => _$this._txtH;
  set txtH(double? txtH) => _$this._txtH = txtH;

  CommentBVBuilder? _comment;
  CommentBVBuilder get comment => _$this._comment ??= CommentBVBuilder();
  set comment(CommentBVBuilder? comment) => _$this._comment = comment;

  String? _shape;
  String? get shape => _$this._shape;
  set shape(String? shape) => _$this._shape = shape;

  String? _flowchartLinkRef;
  String? get flowchartLinkRef => _$this._flowchartLinkRef;
  set flowchartLinkRef(String? flowchartLinkRef) =>
      _$this._flowchartLinkRef = flowchartLinkRef;

  int? _flowchartLinkVersion;
  int? get flowchartLinkVersion => _$this._flowchartLinkVersion;
  set flowchartLinkVersion(int? flowchartLinkVersion) =>
      _$this._flowchartLinkVersion = flowchartLinkVersion;

  String? _parentListType;
  String? get parentListType => _$this._parentListType;
  set parentListType(String? parentListType) =>
      _$this._parentListType = parentListType;

  MapBuilder<String, BuiltList<StepBV>>? _childStepLists;
  MapBuilder<String, BuiltList<StepBV>> get childStepLists =>
      _$this._childStepLists ??= MapBuilder<String, BuiltList<StepBV>>();
  set childStepLists(MapBuilder<String, BuiltList<StepBV>>? childStepLists) =>
      _$this._childStepLists = childStepLists;

  MapBuilder<String, double>? _caseNameWidths;
  MapBuilder<String, double> get caseNameWidths =>
      _$this._caseNameWidths ??= MapBuilder<String, double>();
  set caseNameWidths(MapBuilder<String, double>? caseNameWidths) =>
      _$this._caseNameWidths = caseNameWidths;

  ListBuilder<StepBV>? _dummyList;
  ListBuilder<StepBV> get dummyList =>
      _$this._dummyList ??= ListBuilder<StepBV>();
  set dummyList(ListBuilder<StepBV>? dummyList) =>
      _$this._dummyList = dummyList;

  ChangeType? _changeType;
  ChangeType? get changeType => _$this._changeType;
  set changeType(ChangeType? changeType) => _$this._changeType = changeType;

  StepBVBuilder();

  StepBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _txt = $v.txt;
      _iconIndex = $v.iconIndex;
      _txtW = $v.txtW;
      _txtH = $v.txtH;
      _comment = $v.comment?.toBuilder();
      _shape = $v.shape;
      _flowchartLinkRef = $v.flowchartLinkRef;
      _flowchartLinkVersion = $v.flowchartLinkVersion;
      _parentListType = $v.parentListType;
      _childStepLists = $v.childStepLists?.toBuilder();
      _caseNameWidths = $v.caseNameWidths?.toBuilder();
      _dummyList = $v.dummyList?.toBuilder();
      _changeType = $v.changeType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StepBV other) {
    _$v = other as _$StepBV;
  }

  @override
  void update(void Function(StepBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StepBV build() => _build();

  _$StepBV _build() {
    _$StepBV _$result;
    try {
      _$result =
          _$v ??
          _$StepBV._(
            id: id,
            txt: txt,
            iconIndex: iconIndex,
            txtW: txtW,
            txtH: txtH,
            comment: _comment?.build(),
            shape: shape,
            flowchartLinkRef: flowchartLinkRef,
            flowchartLinkVersion: flowchartLinkVersion,
            parentListType: parentListType,
            childStepLists: _childStepLists?.build(),
            caseNameWidths: _caseNameWidths?.build(),
            dummyList: _dummyList?.build(),
            changeType: changeType,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comment';
        _comment?.build();

        _$failedField = 'childStepLists';
        _childStepLists?.build();
        _$failedField = 'caseNameWidths';
        _caseNameWidths?.build();
        _$failedField = 'dummyList';
        _dummyList?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'StepBV',
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
