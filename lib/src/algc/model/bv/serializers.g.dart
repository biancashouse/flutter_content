// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(ChangeType.serializer)
      ..add(CommentBV.serializer)
      ..add(FlowchartBV.serializer)
      ..add(StepBV.serializer)
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BuiltList, const [const FullType(StepBV)])
          ]),
          () => new MapBuilder<String, BuiltList<StepBV>>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(String)]),
          () => new MapBuilder<String, String>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BuiltList, const [const FullType(StepBV)])
          ]),
          () => new MapBuilder<String, BuiltList<StepBV>>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(double)]),
          () => new MapBuilder<String, double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(StepBV)]),
          () => new ListBuilder<StepBV>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
