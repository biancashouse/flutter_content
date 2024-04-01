import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'target_group_model.mapper.dart';

@MappableClass()
class TargetGroupModel  with TargetGroupModelMappable {
  List<TargetModel> targets;

  TargetGroupModel(this.targets);

  // TargetGroupModel clone() {
  //   var cloneJson = toJson();
  //
  //   TargetGroupModel clonedITC = TargetGroupModel.fromJson(cloneJson);
  //   return clonedITC;
  // }
}
