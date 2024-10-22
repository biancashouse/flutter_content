import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'comment_bv.dart';
import 'flowchart_bv.dart';
import 'step_bv.dart';

part 'serializers.g.dart';

@SerializersFor([
  // AppBV,
  // UserBV,
  StepBV,
  FlowchartBV,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
