import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'comment_bv.dart';

part 'step_bv.g.dart';

/*
 * https://medium.com/flutter-io/some-options-for-deserializing-json-with-flutter-7481325a4450
 */

abstract class StepBV implements Built<StepBV, StepBVBuilder> {
  static Serializer<StepBV> get serializer => _$stepBVSerializer;

  int? get id;

  String? get txt;

  int? get iconIndex;

  double? get txtW;

  double? get txtH;

  CommentBV? get comment;

  String? get shape;

  String? get flowchartLinkRef; // another clipboard's createdMs
  int? get flowchartLinkVersion; // another clipboard's version

  String? get parentListType;

  BuiltMap<String, BuiltList<StepBV>>? get childStepLists;

  BuiltMap<String, double>?
      get caseNameWidths; //obviously only applies to switch step

  // dummy list forces type generation, otherwise tests fail on BuiltList
  BuiltList<StepBV>? get dummyList;

  ChangeType? get changeType;

  StepBV._();

  // may create one or two scopes dep on step type
  factory StepBV.factory(int theLastModified,
      {int? theKey,
      String? theTxt,
      int? theIconIndex,
      double? theTxtW,
      double? theTxtH,
      CommentBV? theComment,
      String? theShape,
      ChangeType? theChangeType,
      String? theFlowchartLinkRef,
      int? theFlowchartLinkVersion,
      String? theParentListType,
      BuiltMap<String, BuiltList<StepBV>>? theChildStepLists,
      BuiltMap<String, double>? theCaseWidths}) {
    var newStep = StepBV((cs) => cs
      ..id = theKey ?? randomKey()
      ..txt = theTxt
      ..iconIndex = theIconIndex
      ..txtW = theTxtW
      ..txtH = theTxtH
      ..comment = theComment?.toBuilder()
      ..shape = theShape
      ..changeType = theChangeType
      ..flowchartLinkRef = theFlowchartLinkRef
      ..flowchartLinkVersion = theFlowchartLinkVersion
      ..parentListType = theParentListType
      ..childStepLists = theChildStepLists?.toBuilder()
      ..caseNameWidths = theCaseWidths?.toBuilder());
    return newStep;
  }

  factory StepBV([Function(StepBVBuilder b)? updates]) = _$StepBV;
}

/// User status: online, away or offline.
class ChangeType extends EnumClass {
  static Serializer<ChangeType> get serializer => _$changeTypeSerializer;

  static const ChangeType txtOrCommentChange = _$txtOrComment;
  static const ChangeType newStep = _$newStep;
  static const ChangeType movedStep = _$movedStep;
  static const ChangeType trashedStep = _$trashedStep;

  const ChangeType._(super.name);

  static BuiltSet<ChangeType> get values => _$stValues;

  static ChangeType valueOf(String name) => _$stValueOf(name);
}

//StepBV findStepInFlowchart(String theKey) {
//  return findStepInList(theKey, selectedF.steps);
//}
//
//StepBV findStepInList(String theKey, BuiltList<StepBV> theList) {
//  StepBV result;
//  if (theList != null && theList.isNotEmpty) {
//    theList.forEach((s) {
//      if (s.key == theKey)
//        return s;
//      else {
//        s.childStepLists.keys.forEach((key) {
//            BuiltList<StepBV> childList = s.childStepList(key];
//            if (childList != null && childList.isNotEmpty) {
//              StepBV foundStep = findStepInList(theKey, childList);
//              if (foundStep != null)
//                return foundStep;
//            }
//        });
//        return null;
//      }
//    });
//  }
//
//}

//// update the childlist map and return the new updated step
//StepBV rebuildStepChildListMap(StepBV theStep, Map<String, BuiltList<StepBV>> theNewMap) {
//  StepBV newStep = theStep
//      .rebuild((s) => s.childStepLists = BuiltMap<String, BuiltList<StepBV>>.from(theNewMap).toBuilder());
//  return newStep;
//}

// update the childlist map and return the new updated step
//StepBV rebuildStepWithNewTxt(
//  StepBV theStep,
//  String theNewTxt, {
//  double theNewTxtW,
//  double theNewTxtH,
//}) {
//  StepBV newStep;
//  if (theNewTxtW != null && theNewTxtH != null)
//    newStep = theStep.rebuild((s) => s
//      ..txt = theNewTxt
//      ..txtW = theNewTxtW
//      ..txtH = theNewTxtH);
//  else
//    newStep = theStep.rebuild((s) => s.txt = theNewTxt);
//  return newStep;
//}
//

int randomKey() => Random().nextInt(99999999); //Bloc.uuid.v4();
