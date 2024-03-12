// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CAPIModel _$CAPIModelFromJson(Map<String, dynamic> json) => CAPIModel(
      appName: json['appName'] as String?,
      targetConfigs: (json['targetConfigs'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, TargetConfig.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
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
      'targetConfigs': instance.targetConfigs,
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
      single: json['single'] as bool? ?? true,
      transformScale: (json['transformScale'] as num?)?.toDouble() ?? 1.0,
      transformTranslateX:
          (json['transformTranslateX'] as num?)?.toDouble() ?? 0.0,
      transformTranslateY:
          (json['transformTranslateY'] as num?)?.toDouble() ?? 0.0,
      radiusPc: (json['radiusPc'] as num?)?.toDouble(),
      calloutDurationMs: json['calloutDurationMs'] as int? ?? 1500,
      calloutWidth: (json['calloutWidth'] as num?)?.toDouble() ?? 400,
      calloutHeight: (json['calloutHeight'] as num?)?.toDouble() ?? 85,
      calloutTopPc: (json['calloutTopPc'] as num?)?.toDouble(),
      calloutLeftPc: (json['calloutLeftPc'] as num?)?.toDouble(),
      btnLocalTopPc: (json['btnLocalTopPc'] as num?)?.toDouble(),
      btnLocalLeftPc: (json['btnLocalLeftPc'] as num?)?.toDouble(),
      showBtn: json['showBtn'] as bool? ?? true,
      calloutColorValue: json['calloutColorValue'] as int?,
      snippetName: json['snippetName'] as String,
      arrowType: json['arrowType'] as int? ?? 1,
      animateArrow: json['animateArrow'] as bool? ?? false,
    )
      ..targetLocalPosLeftPc =
          (json['targetLocalPosLeftPc'] as num?)?.toDouble()
      ..targetLocalPosTopPc = (json['targetLocalPosTopPc'] as num?)?.toDouble();

Map<String, dynamic> _$TargetConfigToJson(TargetConfig instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'transformScale': instance.transformScale,
      'transformTranslateX': instance.transformTranslateX,
      'transformTranslateY': instance.transformTranslateY,
      'wName': instance.wName,
      'single': instance.single,
      'targetLocalPosLeftPc': instance.targetLocalPosLeftPc,
      'targetLocalPosTopPc': instance.targetLocalPosTopPc,
      'radiusPc': instance.radiusPc,
      'btnLocalTopPc': instance.btnLocalTopPc,
      'btnLocalLeftPc': instance.btnLocalLeftPc,
      'calloutTopPc': instance.calloutTopPc,
      'calloutLeftPc': instance.calloutLeftPc,
      'showBtn': instance.showBtn,
      'calloutWidth': instance.calloutWidth,
      'calloutHeight': instance.calloutHeight,
      'calloutDurationMs': instance.calloutDurationMs,
      'calloutColorValue': instance.calloutColorValue,
      'snippetName': instance.snippetName,
      'arrowType': instance.arrowType,
      'animateArrow': instance.animateArrow,
    };
