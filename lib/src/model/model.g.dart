// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CAPIModel _$CAPIModelFromJson(Map<String, dynamic> json) => CAPIModel(
      appName: json['appName'] as String?,
      targetGroupConfigs:
          (json['targetGroupConfigs'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    k, TargetGroupConfig.fromJson(e as Map<String, dynamic>)),
              ) ??
              const {},
      snippetEncodedJsons:
          (json['snippetEncodedJsons'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
      jsonClipboard: json['jsonClipboard'] as String?,
    );

Map<String, dynamic> _$CAPIModelToJson(CAPIModel instance) => <String, dynamic>{
      'appName': instance.appName,
      'targetGroupConfigs': instance.targetGroupConfigs,
      'snippetEncodedJsons': instance.snippetEncodedJsons,
      'jsonClipboard': instance.jsonClipboard,
    };

TargetGroupConfig _$TargetGroupConfigFromJson(Map<String, dynamic> json) =>
    TargetGroupConfig(
      (json['targets'] as List<dynamic>)
          .map((e) => TargetConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TargetGroupConfigToJson(TargetGroupConfig instance) =>
    <String, dynamic>{
      'targets': instance.targets,
    };

TargetConfig _$TargetConfigFromJson(Map<String, dynamic> json) => TargetConfig(
      uid: json['uid'] as int,
      wName: json['wName'] as String,
      transformScale: (json['transformScale'] as num?)?.toDouble() ?? 1.0,
      radiusPc: (json['radiusPc'] as num?)?.toDouble(),
      calloutDurationMs: json['calloutDurationMs'] as int? ?? 1500,
      calloutWidth: (json['calloutWidth'] as num?)?.toDouble() ?? 400,
      calloutHeight: (json['calloutHeight'] as num?)?.toDouble() ?? 85,
      calloutTopPc: (json['calloutTopPc'] as num?)?.toDouble(),
      calloutLeftPc: (json['calloutLeftPc'] as num?)?.toDouble(),
      btnLocalTopPc: (json['btnLocalTopPc'] as num?)?.toDouble(),
      btnLocalLeftPc: (json['btnLocalLeftPc'] as num?)?.toDouble(),
      showBtn: json['showBtn'] as bool? ?? true,
      canResizeH: json['canResizeH'] as bool? ?? true,
      canResizeV: json['canResizeV'] as bool? ?? true,
      calloutFillColorValue: json['calloutFillColorValue'] as int?,
      calloutBorderColorValue: json['calloutBorderColorValue'] as int?,
      calloutDecorationShape: $enumDecodeNullable(
              _$DecorationShapeEnumEnumMap, json['calloutDecorationShape']) ??
          DecorationShapeEnum.rectangle,
      calloutBorderRadius:
          (json['calloutBorderRadius'] as num?)?.toDouble() ?? 30,
      calloutBorderThickness:
          (json['calloutBorderThickness'] as num?)?.toDouble() ?? 1,
      starPoints: json['starPoints'] as int?,
      snippetName: json['snippetName'] as String,
      calloutArrowType: json['calloutArrowType'] as int? ?? 1,
      calloutArrowColorValue: json['calloutArrowColorValue'] as int?,
      animateArrow: json['animateArrow'] as bool? ?? false,
    )
      ..targetLocalPosLeftPc =
          (json['targetLocalPosLeftPc'] as num?)?.toDouble()
      ..targetLocalPosTopPc = (json['targetLocalPosTopPc'] as num?)?.toDouble();

Map<String, dynamic> _$TargetConfigToJson(TargetConfig instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'transformScale': instance.transformScale,
      'wName': instance.wName,
      'targetLocalPosLeftPc': instance.targetLocalPosLeftPc,
      'targetLocalPosTopPc': instance.targetLocalPosTopPc,
      'radiusPc': instance.radiusPc,
      'btnLocalTopPc': instance.btnLocalTopPc,
      'btnLocalLeftPc': instance.btnLocalLeftPc,
      'calloutTopPc': instance.calloutTopPc,
      'calloutLeftPc': instance.calloutLeftPc,
      'showBtn': instance.showBtn,
      'canResizeH': instance.canResizeH,
      'canResizeV': instance.canResizeV,
      'calloutWidth': instance.calloutWidth,
      'calloutHeight': instance.calloutHeight,
      'calloutDurationMs': instance.calloutDurationMs,
      'calloutFillColorValue': instance.calloutFillColorValue,
      'calloutBorderColorValue': instance.calloutBorderColorValue,
      'calloutDecorationShape':
          _$DecorationShapeEnumEnumMap[instance.calloutDecorationShape]!,
      'calloutBorderRadius': instance.calloutBorderRadius,
      'calloutBorderThickness': instance.calloutBorderThickness,
      'starPoints': instance.starPoints,
      'snippetName': instance.snippetName,
      'calloutArrowType': instance.calloutArrowType,
      'calloutArrowColorValue': instance.calloutArrowColorValue,
      'animateArrow': instance.animateArrow,
    };

const _$DecorationShapeEnumEnumMap = {
  DecorationShapeEnum.rectangle: 'rectangle',
  DecorationShapeEnum.rounded_rectangle: 'rounded_rectangle',
  DecorationShapeEnum.rectangle_dotted: 'rectangle_dotted',
  DecorationShapeEnum.rounded_rectangle_dotted: 'rounded_rectangle_dotted',
  DecorationShapeEnum.circle: 'circle',
  DecorationShapeEnum.bevelled: 'bevelled',
  DecorationShapeEnum.stadium: 'stadium',
  DecorationShapeEnum.star: 'star',
};
