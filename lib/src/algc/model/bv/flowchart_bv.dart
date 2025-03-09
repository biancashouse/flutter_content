import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'comment_bv.dart';
import 'step_bv.dart';

part 'flowchart_bv.g.dart';

/*
 * https://medium.com/flutter-io/some-options-for-deserializing-json-with-flutter-7481325a4450
 */

abstract class FlowchartBV implements Built<FlowchartBV, FlowchartBVBuilder> {
  static Serializer<FlowchartBV> get serializer => _$flowchartBVSerializer;

  String? get id; // the firestore document id

  int? get createdMs;

  String? get ownerEa;

  int? get lastModifiedMs;

  bool? get deleted;

  // bool? get synced;

  String? get title;

  String? get descr;

  int?
      get imageSize; // null means no image,  0 means delete, >0 means image should be in LocalStore

  String? get version;

  // PdfPageFormat const value
  String? get pageSize;

  String? get beginTxt; //begin widget label, e.g. someFunc(theParam)

  CommentBV?
      get flowchartComment; //flowchart descr and image (also used, reduced, as a thumbnail in the dashboard)

  CommentBV? get beginComment; //begin widget label, e.g. someFunc(theParam)

  BuiltMap<String, BuiltList<StepBV>>? get stepsMap;

  BuiltList<StepBV>? get steps => stepsMap![version];

  set steps(BuiltList<StepBV>? theSteps) => stepsMap![version];

  BuiltMap<String, String>? get previousVersionMap;

  //StepBV get functionEndStep;

  String? get endTxt; //begin widget label, e.g. someFunc(theParam)

  CommentBV? get endComment; //begin widget label, e.g. someFunc(theParam)

  int? get colorValue;

  bool? get showColouredTrueAndFalse;

  FlowchartBV._();

  factory FlowchartBV([Function(FlowchartBVBuilder b)? updates]) =
      _$FlowchartBV;

  // may create one or two scopes dep on step type
  factory FlowchartBV.fromCustomFactory({
    String? theId,
    String? theTitle,
    String? theDescr,
    int? theCommentImageSize,
    String? theAuthor,
    int? whenLastModified,
    int? whenCreated,
    bool? isDeleted,
    bool? isSynced,
    String? theOwnerEa,
    int? theVersion,
    String thePageSize = 'a4',
    String? theBeginTxt,
    BuiltMap<String, BuiltList<StepBV>>? theStepsMap,
    BuiltMap<String, String>? thePrevVersionMap,
    String? theEndTxt,
    CommentBV? theFlowchartComment,
    CommentBV? theBeginComment,
    CommentBV? theEndComment,
    int? theColorValue,
    bool? theShowDecisionColours,
  }) =>
      FlowchartBV((cs) => cs
        ..id = theId ?? whenCreated.toString()
        ..title = theTitle
        ..descr = theDescr
        ..imageSize = theCommentImageSize
        ..lastModifiedMs = whenLastModified ?? whenCreated
        ..createdMs = whenCreated
        ..deleted = isDeleted
        // ..synced = isSynced
        ..ownerEa = theOwnerEa
        //..lastModified = DateTime.now().millisecondsSinceEpoch
        ..version = theVersion.toString()
        ..pageSize = thePageSize
        //..inAddMode = false
        ..beginTxt = theBeginTxt
        ..stepsMap = theStepsMap!.toBuilder()
        ..previousVersionMap = thePrevVersionMap!.toBuilder()
        ..endTxt = theEndTxt
        ..flowchartComment = theFlowchartComment?.toBuilder()
        ..beginComment = theBeginComment?.toBuilder()
        ..endComment = theEndComment?.toBuilder()
        ..colorValue = theColorValue
        ..showColouredTrueAndFalse = theShowDecisionColours);
}

//FlowchartBV rebuildFlowchartRootSteps(FlowchartBV theFunc, BuiltList<StepBV> theNewSteps) {
//  fco.logger.i('rebuilding function ${theFunc.lastModified}');
//  int newLastModified = DateTime.now().millisecondsSinceEpoch;
//  return theFunc.rebuild((f) => f
//    ..steps = theNewSteps.toBuilder()
//    ..lastModified = newLastModified);
//}

//FlowchartBV rebuildFunctionTitle(FlowchartBV theFunc, String theTitle) {
//  FlowchartBV rebuiltFunc;
//  fco.logger.i('rebuilding function ${theFunc.lastModified}');
//  int newLastModified = DateTime.now().millisecondsSinceEpoch;
//  rebuiltFunc = theTitle != null
//      ? theFunc.rebuild((f) => f
//        ..title = theTitle
//        ..lastModified = newLastModified)
//      : theFunc;
//  return rebuiltFunc;
//}
//
//FlowchartBV rebuildFunctionDescr(FlowchartBV theFunc, String theDescr) {
//  FlowchartBV rebuiltFunc;
//  fco.logger.i('rebuilding function ${theFunc.lastModified}');
//  int newLastModified = DateTime.now().millisecondsSinceEpoch;
//  rebuiltFunc = theDescr != null
//      ? theFunc.rebuild((f) => f
//        ..descr = theDescr
//        ..lastModified = newLastModified)
//      : theFunc;
//  return rebuiltFunc;
//}
//
//FlowchartBV rebuildFunctionVer(FlowchartBV theFunc, String theVer) {
//  FlowchartBV rebuiltFunc;
//  fco.logger.i('rebuilding function ${theFunc.lastModified}');
//  int newLastModified = DateTime.now().millisecondsSinceEpoch;
//  rebuiltFunc = theVer != null
//      ? theFunc.rebuild((f) => f
//        ..version = theVer
//        ..lastModified = newLastModified)
//      : theFunc;
//  return rebuiltFunc;
//}

//FlowchartBV rebuildFunctionTxt(
//  FlowchartBV theFunc,
//  String theNewTxt, {
//  double theNewTxtW,
//  double theNewTxtH,
//}) {
//  FlowchartBV rebuiltFunc;
//  if (theNewTxtW != null && theNewTxtH != null)
//    rebuiltFunc = theFunc.rebuild((f) => f
//      ..txt = theNewTxt
//      ..beginTxtW = theNewTxtW
//      ..beginTxtH = theNewTxtH);
//  else
//    rebuiltFunc = theFunc.rebuild((f) => f.txt = theNewTxt);
//
//  return rebuiltFunc;
//}
