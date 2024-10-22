// import 'dart:developer' as developer;
// import 'dart:convert';
//
// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
//
// import 'flowchart_bv.dart';
// import 'serializers.dart';
// import 'user_bv.dart';
//
// part 'app_bv.g.dart';
//
// /*
//  * https://medium.com/flutter-io/some-options-for-deserializing-json-with-flutter-7481325a4450
//  */
//
// abstract class AppBV implements Built<AppBV, AppBVBuilder> {
//   static Serializer<AppBV> get serializer => _$appBVSerializer;
//
//   static AppBV? fromJson(String jsonString) {
//     AppBV? result;
//     try {
//       result = serializers.deserializeWith(AppBV.serializer, json.decode(jsonString));
//     } catch (e) {
//       // ignore: avoid_print
//       fco.logi(e.toString());
//     }
//     return result;
//   }
//
//   BuiltMap<String, UserBV>? get userMap;
//
//   BuiltMap<String, FlowchartBV>? get flowchartMap; // key is document id
//
//   String? get currentEa;
//
//   FlowchartBV? get clipboardFlowchart;
//
//   AppBV._();
//
//   factory AppBV.factory(
//       {String? theCurrentEa,
//       BuiltMap<String, UserBV>? theUserMap,
//       BuiltMap<String, FlowchartBV>? theFlowchartMap,
//       FlowchartBV? theClipboardFlowchart}) {
//     var newApp = AppBV((cs) => cs
//       ..currentEa = theCurrentEa
//       ..userMap = theUserMap!.toBuilder()
//       ..flowchartMap = theFlowchartMap?.toBuilder()
//       ..clipboardFlowchart = theClipboardFlowchart?.toBuilder());
//
//     return newApp;
//   }
//
//   factory AppBV([Function(AppBVBuilder b)? updates]) = _$AppBV;
// }
//
// Map<String, dynamic> testJson = {
//   "userMap": {
//     "anon": {
//       "ea": "anon",
//       "verified": false,
//       "fIds": ["f1621809776139"]
//     },
//     "algc.samples@biancashouse.com": {"ea": "algc.samples@biancashouse.com", "verified": false, "fIds": []}
//   },
//   "flowchartMap": {
//     "f1621809776139": {
//       "id": "f1621809776139",
//       "createdMs": 1621809776139,
//       "ownerEa": "anon",
//       "lastModifiedMs": 1621809776139,
//       "deleted": false,
//       "dirty": true,
//       "title": "no title",
//       "descr": "no description",
//       "version": "0",
//       "pageSize": "a4",
//       "beginTxt": "main()",
//       "stepsMap": {"0": []},
//       "previousVersionMap": {"0": "-1"},
//       "endTxt": "return",
//       "colorValue": 4292927712
//     }
//   },
//   "currentEa": "anon"
// };
//
// String testJsonS =
//     '{userMap: {anon: {ea: anon, verified: false, fIds: [f1621809776139]}, algc.samples@biancashouse.com: {ea: algc.samples@biancashouse.com, verified: false, fIds: []}}, flowchartMap: {f1621809776139: {id: f1621809776139, createdMs: 1621809776139, ownerEa: anon, lastModifiedMs: 1621809776139, deleted: false, dirty: true, title: no title, descr: no description, version: 0, pageSize: a4, beginTxt: main(), stepsMap: {0: []}, previousVersionMap: {0: -1}, endTxt: return, colorValue: 4292927712}}, currentEa: anon}';
