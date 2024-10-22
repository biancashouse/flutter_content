import 'dart:collection';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/bv/flowchart_bv.dart';
import 'package:flutter_content/src/algc/model/bv/serializers.dart';
import 'package:flutter_content/src/algc/model/bv/step_bv.dart';
import 'package:flutter_content/src/algc/model/m/constants.dart';
import 'package:flutter_content/src/algc/model/m/pdf_page_format.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';
import 'package:flutter_content/src/algc/model/m/string_encoder_decoder.dart';

import 'comment_m.dart';
import 'has_image.dart';

enum EditingMode { initial, showingAdders, showingMovers }

class FlowchartM with StringEncoderDecoder, HasImageInFBStorage {
  FlowchartM() {
    //painter = FlowchartPainter(this);
  }

  @override
  String toString() => 'id: $id';

  factory FlowchartM.fromJson(Map<String, dynamic> theJson) {
    late FlowchartM result;
    try {
      FlowchartBV deserializedFlowchart =
          serializers.deserializeWith(FlowchartBV.serializer, theJson)!;
      result = flowchartBV2M(deserializedFlowchart);
    } catch (e) {
      fco.logi(e.toString());
    }
    return result;
  }

  factory FlowchartM.fromJsonString(String theJson) {
    late FlowchartM result;
    try {
      Map<String, dynamic> decodedJson = json.decode(theJson);
      debugPrint('FlowchartM.fromJsonString:');
      // debugPrint(decodedJson.toString());
      debugPrint('----------------------------------------------------------');
      FlowchartBV deserializedFlowchart =
          serializers.deserializeWith(FlowchartBV.serializer, decodedJson)!;
      debugPrint('deserialized OK');
      result = flowchartBV2M(deserializedFlowchart);
    } catch (e) {
      fco.logi(e.toString());
      rethrow;
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(FlowchartBV.serializer, toBV())
        as Map<String, dynamic>;
  }

  String toJsonString() {
    var serialized = serializers.serializeWith(FlowchartBV.serializer, toBV());
    return json.encode(serialized);
  }

  Map<String, dynamic> toFirestoreDocument() => {
        "created":
            Timestamp.fromDate(DateTime.fromMillisecondsSinceEpoch(createdMs!)),
        "updated": Timestamp.fromDate(
            DateTime.fromMillisecondsSinceEpoch(lastModifiedMs!)),
        "deleted": deleted,
        // "synced": synced,
        "title": title,
        "json": toJsonString()
      };

  /// for Firestore dto usage ----------------------------------------------------
  factory FlowchartM.fromFirestoreMap(Map<String, dynamic> data) {
    debugPrint('FlowchartM.fromFirestoreMap--------------');
    FlowchartM flowchart = FlowchartM.fromJsonString(data['json']);
    Timestamp ts = data['created'];
    if (flowchart.createdMs != ts.millisecondsSinceEpoch) {
      fco.logi('Flowchart in firestore has created != json createdMs');
    }
    ts = data['updated'];
    if (flowchart.lastModifiedMs != ts.millisecondsSinceEpoch) {
      developer
          .log('Flowchart in firestore has updated != json lastModifiedMs');
    }
    return flowchart;
  }

  String getStorageUrl() => '/$ownerEa/$id';

  //----------------
  Map<String, dynamic> toFirestoreMap() {
    return {
      'ownerEa': ownerEa,
      'deleted': deleted,
      'createdAtMs': createdMs,
      'lastModifiedAtMs': lastModifiedMs,
      'encodedJson': toJson()
    };
  }

  // factory FlowchartM.fromDynamoDBAttributeValue(AttributeValue theFlowchartAV) {
  //   Map<String, AttributeValue> flowchartsAttrs = theFlowchartAV.m;
  //   FlowchartM flowchartM = FlowchartM.fromJson(flowchartsAttrs['encodedJson'].s);
  //   flowchartM.id = flowchartsAttrs['id'].s;
  //   flowchartM.createdMs = int.parse(flowchartsAttrs['createdMs'].n);
  //   flowchartM.lastModifiedMs = int.parse(flowchartsAttrs['updatedMs'].n);
  //   flowchartM.deleted = flowchartsAttrs['deleted'].boolValue;
  //   return flowchartM;
  // }
  //
  // //----------------
  // // returns the whole flowchart as a map<String,AttributeValue> AttributeValue
  // AttributeValue toDynamoDBMapAttribute() {
  //   return AttributeValue(m: {
  //     'id': AttributeValue(s: id),
  //     'deleted': AttributeValue(boolValue: deleted),
  //     'createdMs': AttributeValue(n: createdMs.toString()),
  //     'updatedMs': AttributeValue(n: lastModifiedMs.toString()),
  //     'encodedJson': AttributeValue(s: toJson())
  //   });
  // }

  // factory FlowchartM.fromFirestoreDocument(FirestoreDocument theDoc) {
  //   FlowchartM flowchartM = FlowchartM.fromJson(theDoc.fieldValue('encodedJson'));
  //   flowchartM.id = theDoc.id;
  //   flowchartM.createdMs = theDoc.createTime;
  //   flowchartM.lastModifiedMs = theDoc.updateTime;
  //   flowchartM.deleted = theDoc.fieldValue('deleted');
  //   //userM.remoteModMap = convertMapDynDyn2StringInt(data['modMap'] ?? {});
  //   return flowchartM;
  // }

  // FirestoreDocument toFirestoreDocument() => FirestoreDocument.fromNamesAndValues(
  //     namesAndValues: {"ownerEa": ownerEa, "deleted": deleted, "encodedJson": toJson()});

  /// for Firestore dto usage ----------------------------------------------------

  // flowchart saves by updating its json in the parent user's flowchartMap
  // Future<FlowchartM> save({
  //   bool skipRepoSave = false,
  //   bool skipUpdatingLastMod = false,
  //   bool skipCPI = false,
  // }) async {
  //   // TODO
  //   // if (!skipCPI) {
  //   //   fco.showCircularProgressIndicator(true, reason: 'saving flowchart');
  //   // }
  //   // fco.logi('****** save *******');
  //   // FlowchartM copy = copyOf(generateNewKey: false);
  //   // //copy.dirty = true;
  //   // if (!skipUpdatingLastMod) copy.lastModifiedMs = (lastModifiedMs = DateTime.now().millisecondsSinceEpoch);
  //   // copy.removeInsertersAndMovers();
  //   // App.userBloc.state.flowchart(id) = copy;
  //   // if (!skipRepoSave) {
  //   //   await App.repo.save();
  //   //   // also save the comment images, then the descr image
  //   //   LinkedHashMap<int, CommentM> comments = await extractComments();
  //   //   await Future.forEach(comments.keys, (int stepId) async {
  //   //     CommentM? comment = comments[stepId];
  //   //     if (comment?.imageBytes != null) {
  //   //       String s = base64Encode(comment!.imageBytes!);
  //   //       await fco.localStore.setString(CommentM.getCommentImageStorageKey(this, stepId), s);
  //   //     }
  //   //   });
  //   //   if (imageBytes != null) {
  //   //     String s = base64Encode(imageBytes!);
  //   //     await fco.localStore.setString(descrImageStorageKey, s);
  //   //   }
  //   // }
  //   // if (!skipCPI) {
  //   //   fco.showCircularProgressIndicator(false, reason: 'saving flowchart');
  //   // }
  //   return this;
  // }

  // transient ==================================================================================
  // ============================================================================================
  // GlobalKey? imageGK;
  // GlobalKey? titleGK = GlobalKey();
  // GlobalKey? titleSizeBox1x1GK = GlobalKey();
  // GlobalKey? paperSizeBtnGK;
  // GlobalKey? commentsDDGK;
  // GlobalKey? lastCommentAvatarGK;
  // GlobalKey? descrTxtGK = GlobalKey();
  // GlobalKey? descrImgBtnGK;
  // GlobalKey? firstCommentTopTxtGK;
  // GlobalKey? firstCommentBottomTxtGK;
  // GlobalKey? firstCommentRemoveImageBtnGK;
  // GlobalKey? firstCommentCropImageBtnGK;
  // bool? stepTypeDragInProgress = false;
  // bool? stepWidgetDragInProgress = false;
  // GlobalKey? moverGK;
  // GlobalKey? draggableFeedbackGK;
  //
  // static bool? tempHideStepTypesPanel;

  // ignores all mouseOvers and dragOvers for a while
  // static Timer? _debounceDragEnterTimer;

  // static void doAfterMouseOverOrDragEnterDelay(int millis, VoidCallback fn) {
  //   _debounceDragEnterTimer?.cancel();
  //   _debounceDragEnterTimer = Timer(Duration(milliseconds: millis), () {
  //     fn.call();
  //   });
  // }
  //
  // static void cancelAfterMouseOverOrDragEnterDelay() {
  //   _debounceDragEnterTimer?.cancel();
  // }

  // List<int> draggedOverStepIds = [];

  // int? commentBeingEditedStepId;
  // int? commentBeingEditedIndex; // allows a scrollTo when editing a comment that is probably offscreen

  // saving scroll offsets - fl, row (fl, comments panel), and comments panel
  double? scrollControllerOffset;
  double? commentsAutoScrollControllerOffset;
  int? commentsAutoScrollControllerIndex;

  // void _saveScrollOffsets() {
  //   if (editingPageState?.vSC.positions.isNotEmpty ?? false) {
  //     scrollControllerOffset = editingPageState?.vSC.offset;
  //   }
  //   if (editingPageState != null &&
  //       editingPageState!.itemScrollController.hasClients) {
  //     commentsAutoScrollControllerOffset =
  //         editingPageState!.itemScrollController.offset;
  //   }
  // }

  // void restoreScrollOffsetsAfterNextBuild() {
  //   _saveScrollOffsets();
  //   fco.afterNextBuildDo(() {
  //     fco.logi('restoreScrollOffsetsAfterNextBuild');
  //     if (scrollControllerOffset != null && editingPageState!.vSC.hasClients) {
  //       editingPageState!.vSC.jumpTo(scrollControllerOffset!);
  //     }
  //     if (commentsAutoScrollControllerOffset != null &&
  //         editingPageState!.itemScrollController.hasClients) {
  //       editingPageState!.itemScrollController
  //           .jumpTo(commentsAutoScrollControllerOffset!);
  //     }
  //   });
  // }

  // // memory cache of comment strings and image byte arrays (U8intList)
  // LinkedHashMap<int, dynamic> comments;

  final Map<int, GlobalKey> _stepGKs = {};

  // Map<int, GlobalKey> adderGKs = {};
  //Map<int, GlobalKey> moverGKs = {};

  Map<int, GlobalKey> allStepGKs() => _stepGKs;

  GlobalKey? stepGK(int stepId) {
    if (stepId == BEGIN_STEP_ID) {
      return beginStepGK;
    } else if (stepId == END_STEP_ID) {
      return endStepGK;
    } else {
      return _stepGKs[stepId];
    }
  }

  void setStepGK(int stepId, GlobalKey gk) {
    _stepGKs[stepId] = gk;
    // fco.logi('${_stepGKs.length} step GKs');
  }

  // NOTE - BEGIN and END are keys used to store the begin & end gks with all the step gks
  static const int BEGIN_STEP_ID = 1000000;
  static const int END_STEP_ID = 2000000;

  double? adderOrMoverAnimatedHeight;
  String? ddValue = 'comments';

  GlobalKey get beginStepGK => _stepGKs[BEGIN_STEP_ID]!;

  GlobalKey get endStepGK => _stepGKs[END_STEP_ID]!;

  set beginStepGK(GlobalKey gk) {
    _stepGKs[BEGIN_STEP_ID] = gk;
  }

  set endStepGK(GlobalKey gk) {
    _stepGKs[END_STEP_ID] = gk;
  }

  //TDOO StepM findStep(int id) => steps.where((s) => s.id == id)?.first;

  // StepWidgetDndState? stepStateDnd(int? stepId) {
  //   //fco.logi('step ${stepId}');
  //   var gk = _stepGKs[stepId];
  //   return gk?.currentContext?.findAncestorStateOfType<StepWidgetDndState>();
  // }

  // StepWidgetState? stepState(int? stepId) {
  //   //fco.logi('step ${stepId}');
  //   var gk = _stepGKs[stepId];
  //   return gk?.currentContext?.findAncestorStateOfType<StepWidgetState>();
  // }

  // // Editor Page state ===========================================================================================
  // GlobalKey<FlowchartEditorPageState>? _flowchartEditorPageGK;
  //
  // GlobalKey<FlowchartEditorPageState>? get flowchartEditorPageGK =>
  //     _flowchartEditorPageGK;
  //
  // set flowchartEditorPageGK(
  //     GlobalKey<FlowchartEditorPageState>? flowchartPageGK) {
  //   if (_flowchartEditorPageGK != flowchartPageGK) {
  //     fco.logi(
  //         '******** flowchart pageState GlobalKey changed. ********************************');
  //     _flowchartEditorPageGK = flowchartPageGK;
  //   }
  // }

  // FlowchartEditorPageState? get editingPageState =>
  //     flowchartEditorPageGK?.currentState;

  // Editor Page state ===========================================================================================

  // Editor Body state ===========================================================================================
  // GlobalKey<FlowchartEditorBodyState>? _flowchartBodyGK;
  //
  // GlobalKey<FlowchartEditorBodyState>? get flowchartBodyGK => _flowchartBodyGK;
  //
  // set flowchartBodyGK(GlobalKey<FlowchartEditorBodyState>? flowchartBodyGK) {
  //   if (_flowchartBodyGK != flowchartBodyGK) {
  //     fco.logi(
  //         '******** flowchart BodyState GlobalKey changed. ********************************');
  //     _flowchartBodyGK = flowchartBodyGK;
  //   }
  // }

  // FlowchartEditorBodyState? get bodyState => flowchartBodyGK!.currentState;

  // Editor Body state ===========================================================================================

  // Editor Widgets state ===========================================================================================
  // GlobalKey<FlowchartWidgetStackState>? _flowchartWidgetsGK;

  // GlobalKey<FlowchartWidgetStackState>? get flowchartWidgetsGK =>
  //     _flowchartWidgetsGK;

  // set flowchartWidgetsGK(
  //     GlobalKey<FlowchartWidgetStackState>? flowchartWidgetsGK) {
  //   if (_flowchartWidgetsGK != flowchartWidgetsGK) {
  //     fco.logi(
  //         '******** flowchartWidgetsState GlobalKey changed. ********************************');
  //     _flowchartWidgetsGK = flowchartWidgetsGK;
  //   }
  // }
  //
  // FlowchartWidgetStackState? get widgetsState =>
  //     flowchartWidgetsGK!.currentState;

  // Editor Widgets state ===========================================================================================

  // Editor comments panel state ===========================================================================================
  // GlobalKey<CommentsPanelState>? _commentsPanelGK;

  // GlobalKey<CommentsPanelState>? get commentsPanelGK => _commentsPanelGK;

  // set commentsPanelGK(GlobalKey<CommentsPanelState>? commentsPanelGK) {
  //   if (_commentsPanelGK != commentsPanelGK) {
  //     fco.logi('******** commentsPanelState GlobalKey changed. ********************************');
  //     _commentsPanelGK = commentsPanelGK;
  //   }
  // }

  // CommentsPanelState? get commentsPanelState => commentsPanelGK!.currentState;

  // Editor comments panel state ===========================================================================================

// void setBodyState(GlobalKey<FlowchartEditorBody3State> theBodyGK) {
//   fco.logi('flowchart bodyState set.');
//   flowchartBodyGK = theBodyGK;
// }

// step type callout
  bool showAdvancedStepTypes = false;
  // CalloutRecord? stepTypesCallout;

// StepM step2BMoved;
//   StepM? step2BDeleted;

  // StepM? get step2BMoved => EditorBloc.movingState(editingPageState?.context)?.stepBeingMoved;

  // bool isStep2BMoved(StepM theStep) => step2BMoved?.id == theStep.id;

  bool showingChanges = false;

  bool isAnAdderIconPresent = false;
  bool isAMoverIconPresent = false;
  bool isACommentIconPresent = false;

  double moversOffset = 0.0;

//AdderMenuEnum pickedStepType;

// for maintaining current scroll offset when selecting/deselecting
  bool stepFound = false;

  int _numStepComments = 0;

  int get numStepComments => _numStepComments;

  void zeroNumStepComments() => _numStepComments = beginComment != null ? 1 : 0;

  void incrNumStepComments() => _numStepComments++;

  static const double PAGE_VISIBLE_OVERFLOW = 30.0;

  Size? txtSize; // only used if showing a preview of txt changes

  Size beginOrEndTextSize(String s, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: s, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    //allow for possible icon
    return Size(
        max(30, textPainter.size.width) /* + ((iconIndex ?? 0) > 0 ? 40 : 0) */,
        textPainter.size.height);
  }

  double get beginTxtW => beginOrEndTextSize(
      beginTxt,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: TTT,
        color: Colors.black,
        //backgroundColor: Colors.yellow,
      )).width;

  double get endTxtW => beginOrEndTextSize(
      endTxt,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: TTT,
        color: Colors.black,
        //backgroundColor: Colors.yellow,
      )).width;

  double get beginTxtH => beginOrEndTextSize(
      beginTxt,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: TTT,
        color: Colors.black,
        //backgroundColor: Colors.yellow,
      )).height;

  double get endTxtH => beginOrEndTextSize(
      endTxt,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: TTT,
        color: Colors.black,
        //backgroundColor: Colors.yellow,
      )).height;

//final GlobalKey<ScaffoldState> pdfPreviewPageScaffoldKey = GlobalKey();
//final GlobalKey pdfPreviewPageScaffoldBodyKey = GlobalKey();
//final GlobalKey<ScaffoldState> printPageScaffoldKey = GlobalKey<ScaffoldState>();
//final GlobalKey logoKey = GlobalKey();
  final GlobalKey previewTextGlobalKey = GlobalKey();

//GlobalKey globalKey = GlobalKey();

// ============================================================================================
// transient ==================================================================================

//  FlowchartM.copy(FlowchartM theFlowchart) {
//    createdMs = theFlowchart.createdMs;
//    deleted = theFlowchart.deleted;
//    title = theFlowchart.title;
//    descr = theFlowchart.descr;
//    version = theFlowchart.version;
//    pageSize = theFlowchart.pageSize;
//    lastModified = theFlowchart.lastModified;
//    author = theFlowchart.author;
//    fileName = theFlowchart.fileName;
//    zoom = theFlowchart.zoom;
//
//    beginTxt = theFlowchart.beginTxt;
//    _beginTxtW = theFlowchart._beginTxtW;
//    _beginTxtH = theFlowchart._beginTxtH;
//    beginComment = theFlowchart.beginComment;
//
//    stepsMap = theFlowchart.stepsMap;
//    endTxt = theFlowchart.endTxt;
//    _endTxtW = theFlowchart._endTxtW;
//    _endTxtH = theFlowchart._endTxtH;
//    endComment = theFlowchart.endComment;
//  }

  late String id; // actually the firestore document id

  bool get notYetOnServer => int.tryParse(id) != null;

  int? createdMs;

  bool? deleted = false;

  // TODO bool dirty = false;

  String? ownerEa = 'anon';

//  String get ownerEa => _ownerEa ?? 'anon';
//
//  set ownerEa(String theEa) => _ownerEa = theEa;

  int? lastModifiedMs;

  EdgeInsets get pdfPageMargin => EdgeInsets.only(top: 20, left: 20);

// top, left margin of flowchart
//Offset get flowchartOffset => Offset(pdfPageMargin.left, pdfPageMargin.top + 50 /*allow for 2 line title*/);
  Offset get flowchartOffset =>
      Offset(pdfPageMargin.left, pdfPageMargin.top + 15);

  String? _title;

  String get title =>
      _title != null && _title!.isNotEmpty ? decodeString(_title!) : 'no title';

  set title(String theNewTitle) => _title = encodeString(theNewTitle);

  double get titleW =>
      _paperSize.width * 3 / 2 - pdfPageMargin.left - pdfPageMargin.right;

  double get titleH => DEFAULT_T;

  // String? _descr;

  // descr and flowchart image are now in flowchartComment
  String get descr => flowchartComment?.topTxt != null &&
          (flowchartComment?.topTxt?.isNotEmpty ?? false)
      ? decodeString((flowchartComment!.topTxt)!)
      : 'no description: double-tap to edit';

  set descr(String theNewDescr) {
    flowchartComment ??= CommentM();
    flowchartComment!.topTxt = encodeString(theNewDescr);
  }

  @override
  int? get imageSize => flowchartComment?.imageSize;

  @override
  set imageSize(int? newSize) {
    flowchartComment ??= CommentM();
    flowchartComment!.imageSize = newSize;
  }

  @override
  Uint8List? get imageBytes => flowchartComment?.imageBytes;

  @override
  set imageBytes(Uint8List? newBytes) {
    flowchartComment ??= CommentM();
    flowchartComment!.imageBytes = newBytes;
  }

  double get descrW =>
      _paperSize.width - pdfPageMargin.left - pdfPageMargin.right;

  double get descrH => DEFAULT_T;

  String author = '';

  int? _version = 0;

  int get version => _version ?? 0;

  set version(int? newV) => _version = newV;

  List<int> get versions {
    List<int> result = Iterable<int>.generate(stepsMap.length + 1).toList();
    result.removeAt(0);
    return result;
  }

  int get versionForScreenOrPdf => version + 1;

  bool get isVersionLatest => version == stepsMap.length - 1;

  void setToLatestVersion() => version = stepsMap.length - 1;

  bool get onlyOneVersion => versions.length < 2;

//void setCurrentVersion(int theVer) => version = theVer;

// ignore: non_constant_identifier_names
  double get TTT => DEFAULT_T;

// ignore: non_constant_identifier_names
  double get MMM => TTT;

// ignore: non_constant_identifier_names
  double get PPP => TTT / 2;

  double get screenPaperH => paperH;

  double get screenPaperW => paperW;

  PdfPageFormat get paperSize => _paperSize;

  double get paperW => paperSize.width == double.infinity
      ? PdfPageFormat.standard.width
      : paperSize.width;

  double get paperH => paperSize.width == double.infinity
      ? PdfPageFormat.standard.height
      : paperSize.height;

  PdfPageFormat _paperSize = PdfPageFormat.a4;

  String get paperSizeAsString {
    if (paperSize == PdfPageFormat.a4) return 'a4';
    if (paperSize == PdfPageFormat.letter) return 'letter';
    if (paperSize == PdfPageFormat.a3) return 'a3';
    return "undefined";
  }

  set paperSizeFromString(String theSize) {
    switch (theSize) {
      case 'a4':
        _paperSize = PdfPageFormat.a4;
        break;
      case 'letter':
        _paperSize = PdfPageFormat.letter;
        break;
      case 'a3':
        _paperSize = PdfPageFormat.a3;
        break;
      default:
        _paperSize = PdfPageFormat.undefined;
    }
  }

//  PageSize _pageSize;
//  String get pageSize => _pageSize.toString().split('.').last;
//  set pageSize(String theNewSize) => PageSize.values.forEach((PageSize ps) {
//    if (theNewSize == ps.toString().split('.').last)
//      _pageSize = ps;
//  });

  String? _beginTxt;

  String get beginTxt => _beginTxt != null && _beginTxt!.isNotEmpty
      ? decodeString(_beginTxt!)
      : '';

  set beginTxt(String theNewText) => _beginTxt = encodeString(theNewText);

//  double _beginTxtW;
//
//  double get beginTxtW => _beginTxtW ?? initialStepWidth(FUNC_BEGIN);
//
//  set beginTxtW(theW) => _beginTxtW = theW;
//  double _beginTxtH;
//
//  double get beginTxtH => _beginTxtH ?? DEFAULT_T;
//
//  set beginTxtH(theH) => _beginTxtH = theH;

  double get radius => PPP + TTT / 2; //3*DEFAULT_T / 2;

  double get beginTxtOverlayT => MMM + PPP;

  double get beginTxtOverlayL => PPP + radius;

//double get beginTxtOverlayH => MMM + PPP * 2 + beginTxtH + MMM;

//flowchart, begin and end step comments
  CommentM? flowchartComment;
  CommentM? beginComment;
  CommentM? endComment;

  int colorValue = Colors.grey[300]!.value;

  Color get color => Color(colorValue);

  bool showColouredTrueAndFalse = false;

  Map<int, List<StepM>> stepsMap = {};

  List<StepM> get steps => stepsMap[version] ?? [];

  List<StepM> get stepsShowingChanges {
    if (showingChanges && version > 0) {
      return stepsMap[version] ?? [];
    } else {
      List<StepM> notTrashedSteps = [];
      for (StepM step in stepsMap[version]!) {
        if (step.changeType != ChangeType.trashedStep) {
          notTrashedSteps.add(step);
        }
      }
      return notTrashedSteps;
    }
  }

  Map<int, int> previousVersionMap = {};

  int get previousVersion => version > 0 ? previousVersionMap[version]! : -1;

  set previousVersion(int thePrevVersion) =>
      previousVersionMap[version] = thePrevVersion;

  set steps(List<StepM> theSteps) => stepsMap[version] = theSteps;

  bool get hasNoSteps {
    List<StepM> st = steps;
    if (st.isEmpty) return true;
    if (st.every(
        (StepM theStep) => theStep.changeType == ChangeType.trashedStep)) {
      return true;
    }
    return false;
  }

// return true if the very first step in a flowchart: no need to show adders
  bool get canSkipShowingAdders => hasNoSteps;

//FlowchartPainter painter;

  String? _endTxt;

  String get endTxt =>
      _endTxt != null && _endTxt!.isNotEmpty ? decodeString(_endTxt!) : '';

  set endTxt(String theNewText) => _endTxt = encodeString(theNewText);

  double get endTxtOverlayT =>
      stepListOffsetTop(ROOT_STEPS) + sumOfHeightsOf(steps) + MMM + PPP;

  double get endTxtOverlayL => PPP + radius;

//double get endTxtOverlayW => endTxt.length == 0 ? 50.0 : endTxtW;
//double get endTxtOverlayH => MMM + PPP * 2 + endTxtH + MMM;

//  double _endTxtW;

//  double _endTxtH;

//  double get endTxtH => _endTxtH ?? TTT;

//  double get endTxtW => _endTxtW ?? initialStepWidth(FUNC_END);

//  set endTxtW(theW) => _endTxtW = theW;

//  set endTxtH(theH) => _endTxtH = theH;

  Color get beginShapeFillColor {
    return Colors.white;
  }

  Color get endShapeFillColor {
    return Colors.white;
  }

// double get height => MMM + PPP + beginTxtH + PPP + sumOfHeightsOf(steps) + MMM + endTxtH + PPP + MMM * 2;
  double get height => beginTxtH + sumOfHeightsOf(steps) + endTxtH + MMM;

  double get width => stepListOffsetLeft(ROOT_STEPS) + widestStep(steps);

//   double get totalHeight {
//     //var sumOfHeights = sumOfHeightsOf(steps);
// //    fco.logi('flowchart ${title}');
//     double totalH = MMM + PPP + beginTxtH + PPP + sumOfHeightsOf(steps) + MMM + endTxtH + PPP;
// //    fco.logi('---------------------');
// //    fco.logi('-- sumOfHeightsOf(steps) = ${sumOfHeightsOf(steps)} ----');
// //    fco.logi('-- total height = $totalH ----');
// //    fco.logi('-- paper height = $paperH ----');
// //    fco.logi('-- totalH / paperH = ${paperH/totalH} ----');
// //    fco.logi('---------------------');
//     return totalH;
//   }

// height of box containing the txt, incl the margin and padding
  double get boxH => MMM + PPP + beginTxtH + PPP + MMM;

  bool containsAnyInserters() {
    if (steps.isEmpty) return false;
    return stepsContainAnyInserters(steps);
  }

// return a map of child flowcharts as {flowchart key, flowchart version}
  Map<String, int> findChildFlowcharts({bool includeDeleted = false}) {
    Map<String, int> childFlowcharts = {};
    for (var step in steps) {
      _traverseChildLists(step, childFlowcharts);
    }
    return childFlowcharts;
  }

  void _traverseChildLists(StepM theStep, Map<String, int> theChildFlowcharts) {
    if (!theStep.isTrashed()) {
      if (theStep.isAFuncCall &&
          theStep.flowchartLinkRef != null &&
          // circular link prevention
          !theChildFlowcharts.containsKey(theStep.flowchartLinkRef)) {
        theChildFlowcharts[theStep.flowchartLinkRef!] =
            theStep.flowchartLinkVersion!;
      }

      // find links within child steps
      theStep.childStepLists.forEach((String listType, List<StepM>? childList) {
        childList?.forEach((StepM childStep) {
          _traverseChildLists(childStep, theChildFlowcharts);
        });
      });
    }
  }

// builds a map of {flowchart id, version} for a root and related descendant flowcharts
//   Map<String, int> selectedFlowchartGroup() {
//     // starts with the selected flowchart, and current version
//
//     void findFuncCalls(List<StepM> theSteps, Map<String, int> theFlowcharts) {
//       for (var theStep in theSteps) {
//         // if step links to a flowchart
//         if (!theStep.isTrashed() &&
//             theStep.isAFuncCall &&
//             theStep.flowchartLinkRef != null) {
//           // circular link prevention
//           if (!theFlowcharts.containsKey(theStep.flowchartLinkRef)) {
//             theFlowcharts[theStep.flowchartLinkRef!] =
//                 theStep.flowchartLinkVersion!;
//             // find links within the linked flowchart
//             FlowchartM? linkedF =
//                 App.bloc.readFlowchart(id: theStep.flowchartLinkRef!);
//             if (linkedF != null) {
//               int? linkedV =
//                   theStep.flowchartLinkVersion ?? linkedF.versions.length - 1;
//               findFuncCalls(linkedF.stepsMap[linkedV]!, theFlowcharts);
//             }
//           }
//         }
//         theStep.childStepLists
//             .forEach((String theListType, List<StepM>? theChildList) {
//           findFuncCalls(theChildList!, theFlowcharts);
//         });
//       }
//     }
//
//     Map<String, int> results = {id: version};
//     findFuncCalls(steps, results);
//     return results;
//   }

//  StepM _findStepByKey({List<StepM> theSteps}) {
//    List<StepM> children = theSteps ?? steps;
//    children.forEach((StepM step) {
//      if ()
//      step.childStepLists?.forEach((String theListType, List<StepM> theChildList) {
//        _findStepByKey(repo, theSteps: theChildList);
//      });
//    });
//  }

// // legacy -----------------------
//   LinkedHashMap<int, String> extractTextComments() {
//     var comments = LinkedHashMap<int, String>();
//     if (beginComment != null && beginComment.length > 0) comments[BEGIN_STEP_ID] = beginComment;
//
//     _traverseStepsForComments(stepsShowingChanges, comments);
//
//     if (endComment != null && endComment.length > 0) comments[END_STEP_ID] = endComment;
//
//     return comments;
//   }

  LinkedHashMap<int, CommentM> extractComments() {
    LinkedHashMap<int, CommentM> commentsMap = LinkedHashMap<int, CommentM>();
    if (beginComment != null) {
      commentsMap[BEGIN_STEP_ID] = beginComment!;
    }

    List<StepM> topLevelSteps = stepsShowingChanges;
    _traverseStepsForComments(topLevelSteps, commentsMap);

    if (endComment != null) {
      commentsMap[END_STEP_ID] = endComment!;
    }

    return commentsMap;
  }

  void _traverseStepsForComments(
      List<StepM> theSteps, LinkedHashMap<int, CommentM> theCommentsMap) {
    for (StepM theStep in theSteps) {
      if (theStep.comment != null) {
        theCommentsMap[theStep.id] = theStep.comment!;
      }
      for (String listType in theStep.childStepListsShowingChanges.keys) {
        List<StepM> childList = theStep.childStepListsShowingChanges[listType]!;
        _traverseStepsForComments(childList, theCommentsMap);
      }
    }
  }

// Future<dynamic> _commentTextOrImage(String comment) async {
//   if (!comment.startsWith('image:') || kIsWeb) return comment;
//
//   comment = comment.substring(6).trim();
//   // comment that starts with http can have optional csv of width, and height
//   String imageUrl;
//   double? imageW;
//   double? imageH;
//
//   List<String> s = comment.split(',');
//   // local file will not start with http:
//   imageUrl = s[0];
//
//   if (s.length > 1) imageW = double.parse(s[1]);
//   if (s.length > 2) imageH = double.parse(s[2]);
//
//   // // if web, unable to save image, so bytes is null
//   // if (kIsWeb)
//   //   return LoadedNetworkImage(
//   //     url: imageUrl,
//   //     bytes: null,
//   //     w: imageW,
//   //     h: imageH,
//   //   );
//
//   Uint8List? data;
//
//   // can avoid network access is already saved bytes in local storage
//   if (App.repo.prefs.containsKey(imageUrl)) {
//     // SharedPreferences sp = App.repo.prefs;
//     String s = App.repo.prefs.getString(imageUrl)!;
//     data = base64.decode(s);
//     fco.logi('$imageUrl taken from Pref ------------------------------');
//   } else {
//     data = (await NetworkAssetBundle(Uri.parse(imageUrl)).load('')).buffer.asUint8List();
//     if (data != null) {
//       // store data
//       String s = base64.encode(data);
//       App.repo.prefs.setString(imageUrl, s);
//     }
//   }
//
//   return data != null
//       ? LoadedNetworkImage(
//           url: imageUrl,
//           bytes: data,
//           w: imageW,
//           h: imageH,
//         )
//       : '404 Error for $imageUrl !';
// }

  bool stepsContainAnyInserters(List<StepM> theList) {
    bool result = false;
    if (theList
        .where((StepM theStep) => theStep.shape == STEP_ADDER)
        .isNotEmpty) {
      return true;
    } else {
      for (var theStep in theList) {
        theStep.childStepLists.forEach((String key, List<StepM>? theChildList) {
          if (stepsContainAnyInserters(theChildList!)) result = true;
        });
      }
    }
    return result;
  }

  double sumOfHeightsOf(List<StepM>? theSteps) {
    double h = 0.0;
    if (theSteps != null && theSteps.isNotEmpty) {
      if (version < 1 || !showingChanges) {
        theSteps = theSteps
            .where((step) => step.changeType != ChangeType.trashedStep)
            .toList();
      }
      if (theSteps.isNotEmpty) {
        List<double> heights = [];
        for (var s in theSteps) {
          heights.add(s.height());
        }
        double sumHeights = heights.reduce((curr, next) => curr + next);
        h = sumHeights;
      }
    } else {
      h = PPP;
    } // + 2*DEFAULT_T;
    return h;
  }

  double widestStep(List<StepM>? theSteps) {
    double widest = 0.0;
    if (theSteps != null && theSteps.isNotEmpty) {
      if (version < 1 || !showingChanges) {
        theSteps = theSteps
            .where((step) => step.changeType != ChangeType.trashedStep)
            .toList();
      }
      //theSteps.forEach((s) => fco.logi('step ${s.shape} width: ${s.width()}'));
      if (theSteps.isNotEmpty) {
        widest = theSteps.map((step) => step.width()).reduce(max);
      }
    }
    //fco.logi('--widestStep = $widest');
    return widest;
  }

// theListType may be a switch case name
  double stepListOffsetTop(String theListType, {StepM? theStep}) {
    double offsetT;
    switch (theListType) {
      case FALSE_STEPS:
        var trueSteps = theStep!.childStepListShowingChanges(TRUE_STEPS);
        if (trueSteps.isNotEmpty) {
          offsetT = stepListOffsetTop(TRUE_STEPS, theStep: theStep) +
              sumOfHeightsOf(trueSteps);
        } else {
          offsetT = MMM +
              PPP +
              theStep.calculatedTxtSize.height +
              PPP +
              (MMM + PPP + TTT + PPP + MMM);
        }
        break;
      case FAIL_STEPS:
        var succeedSteps = theStep!.childStepListShowingChanges(SUCCEED_STEPS);
        if (succeedSteps.isNotEmpty) {
          offsetT = MMM +
              PPP +
              theStep.calculatedTxtSize.height +
              PPP +
              sumOfHeightsOf(succeedSteps);
        } else {
          offsetT = MMM +
              PPP +
              theStep.calculatedTxtSize.height +
              PPP +
              (MMM + PPP + TTT + PPP + theStep.MMM);
        }
        break;
      case ROOT_STEPS:
        offsetT = MMM + PPP + TTT + PPP;
        break;
      case FUNC_CALL_STEPS:
        offsetT = theStep!.boxH - theStep.MMM;
        break;
      case LOOP_STEPS:
      case SUCCEED_STEPS:
      case TRUE_STEPS:
        offsetT = theStep != ROOT_STEP
            ? theStep!.boxH - theStep.MMM
            : boxH - theStep!.MMM;
        break;
      // switch case steplists - tricky, because cases specified by the user
      default:
        offsetT = theStep != ROOT_STEP
            ? theStep!.boxH - theStep.MMM
            : boxH - theStep!.MMM;
        List<String> prevCaseNames = theStep.caseNames
            .takeWhile((String theCasename) => theCasename != theListType)
            .toList();
        for (var theCaseName in prevCaseNames) {
          if (theCaseName != theListType) {
            double caseH = max(theStep.boxH,
                sumOfHeightsOf(theStep.childStepLists[theCaseName]));
            offsetT += caseH;
          }
        }
    }
    return offsetT;
  }

  void addMoversExceptFor(StepM theStep2BMoved) {
    steps = _addMoversExceptFor(steps, ROOT_STEPS, ROOT_STEP,
        exception: theStep2BMoved);
  }

// void addInsertersOrMoversBeforeAndAfter({required StepM? theSelectedStep, required String shape}) {
//   if (shape == STEP_MOVER)
//     _addMoversForAndBelow(STEP_MOVER, shape:shape, below: theSelectedStep!);
//   else if (theSelectedStep != null /* STEP_ADDER */)
//     addAddersOrMoversBeforeAndAfter(around: theSelectedStep, shape: shape);
// }

  void addInsertersOrMoversForOrBelow(
      {StepM? theSelectedStep,
      required String theStepType,
      StepM? stepBeingMoved}) {
    if (theStepType == STEP_MOVER && stepBeingMoved != null) {
      _addMoversForAndBelow(
          below: theSelectedStep!, stepBeingMoved: stepBeingMoved);
    } else if (theSelectedStep != null /* STEP_ADDER */) {
      _addAddersAroundAndBelow(around: theSelectedStep);
    } else {
      //adders everywhere
      if (hasNoSteps) {
        List<StepM> newList = [];
        newList
            .add(createInserterOrMoverStep(ROOT_STEPS, ROOT_STEP!, STEP_ADDER));
        stepsMap[version] = newList;
      } else {
        _addAddersAroundAndBelow(around: ROOT_STEP);
      }
    }
  }

// for use with decision and async power buttons
  void addInsertersBelow({required StepM theSelectedStep}) {
    _addAddersBelow(around: theSelectedStep);
  }

// for use with decision and async power buttons
  void addInsertersOrMoversBelowDiamond(
      {required StepM decisionStep, required String shape}) {
    addInserterOrMoverToChildList(
        theListType: TRUE_STEPS,
        theParentStep: decisionStep,
        moverOrAdder: shape);
    addInserterOrMoverToChildList(
        theListType: FALSE_STEPS,
        theParentStep: decisionStep,
        moverOrAdder: shape);
  }

  void addInsertersOrMoversBelowAsyncFunc(
      {required StepM asyncFuncStep, required String shape}) {
    addInserterOrMoverToChildList(
        theListType: SUCCEED_STEPS,
        theParentStep: asyncFuncStep,
        moverOrAdder: shape);
    addInserterOrMoverToChildList(
        theListType: FAIL_STEPS,
        theParentStep: asyncFuncStep,
        moverOrAdder: shape);
    // }
  }

  void addInserterOrMoverBelowLoop(
      {required StepM loopStep, required String shape}) {
    addInserterOrMoverToChildList(
        theListType: LOOP_STEPS, theParentStep: loopStep, moverOrAdder: shape);
  }

  void addInserterOrMoverToChildList(
      {required String theListType,
      required StepM theParentStep,
      required String moverOrAdder}) {
    List<StepM> theChildList = theParentStep.childStepList(theListType);
    if (theChildList.isEmpty || theChildList.last.shape != FUNC_RETURN) {
      theChildList.add(
          createInserterOrMoverStep(theListType, theParentStep, moverOrAdder));
    } else if (theChildList.isNotEmpty &&
        theChildList.last.shape == FUNC_RETURN) {
      theChildList.insert(theChildList.length - 1,
          createInserterOrMoverStep(theListType, theParentStep, moverOrAdder));
    }
  }

  void addInserterOrMoverBelowFunction(
      {required StepM functionStep, required String shape}) {
    addInserterOrMoverToChildList(
        theListType: FUNC_CALL_STEPS,
        theParentStep: functionStep,
        moverOrAdder: shape);
  }

  void addInserterOrMoverAfterBeginStep(String theStepType) {
    _addInserterOrMoverAfterBeginStep(theStepType);
  }

  void addInserterOrMoverBeforeEndStep(String theStepType) {
    _addInserterOrMoverBeforeEndStep(theStepType);
  }

  StepM createInserterOrMoverStep(
      String theParentListType, StepM? theParentStep, String theStepType) {
    if (theStepType == STEP_ADDER) {
      isAnAdderIconPresent = true;
    } else if (theStepType == STEP_MOVER) {
      isAMoverIconPresent = true;
      // fco.logi('isAMoverIconPresent = true');
    }
    StepM inserter = StepM(this, randomKey())
      ..shape = theStepType
      ..parentListType = theParentListType
      ..parentStep = theParentStep;
    return inserter;
  }

//// assumption: never when a step is selected
//  List<StepM> _addInserters(List<StepM> theList, String listType, StepM parentStep) {
//    //    if (isAStepSelected()) return [];
//
//    List<StepM> newList = [];
//
//    // skip any existing inserters
//    theList = theList.where((StepM s) => s.shape != STEP_ADDER).toList();
//
//    if (theList == null || theList.isEmpty) {
//      newList
//          .add(createInserterStep(listType, parentStep, listType == NEW_CASE_STEPS ? CASE_ADDER : STEP_ADDER));
//    } else if (theList != null) {
//      // add inserter if empty list
//      if (theList.length == 0)
//        newList.add(
//            createInserterStep(listType, parentStep, listType == NEW_CASE_STEPS ? CASE_ADDER : STEP_ADDER));
//      else {
//        theList.forEach((StepM s) {
//          // every step is preceded by an inserter
//          if (s.changeType != ChangeType.trashedStep)
//            newList.add(createInserterStep(listType, parentStep, STEP_ADDER));
//          if (s.childStepLists != null) {
//            // if switch, add new case
//            if (s.shape == SWITCH) {
//              if (s.childStepLists[NEW_CASE_STEPS] == null) {
//                s.childStepLists[NEW_CASE_STEPS] = [];
//              }
//            }
//            s.childStepLists.keys.forEach((childListType) {
//              List<StepM> childList = s.childStepLists[childListType];
//              if (childList != null) {
//                s.childStepLists[childListType] = _addInserters(childList, childListType, s);
//              }
//            });
//          }
//          newList.add(s);
//        });
//        // append an inserter after the steps
//        StepM lastStep = theList.isNotEmpty ? theList.last : null;
//        if (lastStep != null && lastStep.shape != FUNC_RETURN)
//          newList.add(createInserterStep(listType, parentStep, STEP_ADDER));
//      }
//    }
//
//    // return the updated list - caller needs to cascade change up..
//    return newList;
//  }

  List<StepM> _addMoversExceptFor(
      List<StepM> theList, String listType, StepM? parentStep,
      {required StepM exception}) {
    List<StepM> newList = [];

    if (theList.isEmpty) {
      if (parentStep != null &&
          !parentStep.isOrIsADescendentOf([exception.id])) {
        newList
            .add(createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
      }
    } else {
      for (var s in theList) {
        // every step is preceded by an inserter unless its part of the selection
        var beingMoved = (s.id == exception.id);
        //var nextSelected = s.nextStepIsSelected(theList, exception);
        //var prevSelected = s.prevStepIsSelected(theList, exception);
        if (!beingMoved &&
            (parentStep != null ||
                !parentStep!.isOrIsADescendentOf([exception.id])) &&
            //!BLOC.nextStepIsSelected(theList, s) &&
            !s.prevStepIsSelected(theList, exception) &&
            s.changeType != ChangeType.trashedStep) {
          newList
              .add(createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
        }
        if (s.flowchartLinkRef == null) {
          for (var childListType in s.childStepLists.keys) {
            List<StepM>? childList = s.childStepLists[childListType];
            if (childList != null) {
              if (s.id != exception.id) {
                s.childStepLists[childListType] = _addMoversExceptFor(
                    childList, childListType, s,
                    exception: exception);
              }
            }
          }
        }
        newList.add(s);
      }
      // append an inserter after the steps
      StepM lastStep = theList.last;
      if (lastStep.shape != FUNC_RETURN &&
          !lastStep.isOrIsADescendentOf([exception.id]) &&
          lastStep.id != exception.id &&
          !lastStep.nextStepIsSelected(theList.toList(), exception)) {
        newList
            .add(createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
      }
    }

// return the updated list - caller needs to cascade change up..
    return newList;
  }

  void _addMoversForAndBelow(
      {required StepM below, required StepM stepBeingMoved}) {
    List<StepM>? belowsParentList = below.getParentList();

    // surround below with mover (before and after)
    // but of course avoid step adjacent to mover
    int index = belowsParentList.indexOf(below);
    bool prevStepIsSelected =
        below.prevStepIsSelected(belowsParentList, stepBeingMoved);
    bool nextStepIsSelected =
        below.nextStepIsSelected(belowsParentList, stepBeingMoved);

    if (!prevStepIsSelected) {
      belowsParentList.insert(
          index,
          createInserterOrMoverStep(
              below.parentListType, below.parentStep, STEP_MOVER));
    }
    if (!nextStepIsSelected && below.shape != FUNC_RETURN) {
      belowsParentList.insert(
          index + (prevStepIsSelected ? 1 : 2),
          createInserterOrMoverStep(
              below.parentListType, below.parentStep, STEP_MOVER));
    }

    // now surround each child in the same way
    if (below.flowchartLinkRef == null) {
      for (var childListType in below.childStepLists.keys) {
        List<StepM>? childList = below.childStepLists[childListType];
        List<StepM> newList = [];
        if (childList != null) {
          if (childList.isEmpty) {
            newList.add(
                createInserterOrMoverStep(childListType, below, STEP_MOVER));
          } else {
            for (var s in childList) {
              // surround s with mover (before and after)
              bool prevStepIsSelected =
                  s.prevStepIsSelected(childList, stepBeingMoved);
              if (!prevStepIsSelected && stepBeingMoved.id != s.id) {
                newList.add(createInserterOrMoverStep(
                    childListType, below, STEP_MOVER));
              }
              newList.add(s);
            }
            // append an inserter after the steps
            StepM lastStep = childList.last;
            bool prevStepIsSelected =
                lastStep.prevStepIsSelected(childList, stepBeingMoved);
            if (!prevStepIsSelected &&
                stepBeingMoved.id != lastStep.id &&
                lastStep.shape != FUNC_RETURN) {
              newList.add(
                  createInserterOrMoverStep(childListType, below, STEP_MOVER));
            }
          }
        }
        below.childStepLists[childListType] = newList;
      }
    }
  }

  void _addInserterOrMoverAfterBeginStep(String theStepType) {
    StepM moveOrAdder =
        createInserterOrMoverStep(ROOT_STEPS, ROOT_STEP, theStepType);
    steps.insert(0, moveOrAdder);
  }

  void _addInserterOrMoverBeforeEndStep(String theStepType) {
    StepM mover = createInserterOrMoverStep(ROOT_STEPS, ROOT_STEP, theStepType);
    steps.add(mover);
  }

  void addAddersOrMoversBeforeAndAfter(
      {required StepM around,
      required String shape,
      bool skipBefore = false,
      bool skipAfter = false}) {
    List<StepM> parentList = around.getParentList();

    // add adder before and after
    int index = parentList.indexOf(around);
    if (!skipBefore) {
      parentList.insert(
          index,
          createInserterOrMoverStep(
              around.parentListType, around.parentStep, shape));
    }
    if (!skipAfter && around.shape != FUNC_RETURN) {
      parentList.insert(
          index + (skipBefore ? 1 : 2),
          createInserterOrMoverStep(
              around.parentListType, around.parentStep, shape));
    }
  }

  void _addAddersAroundAndBelow(
      {required StepM? around, bool skipAdderBefore = false}) {
    if (around != null) {
      List<StepM> parentList = around.getParentList();

      // add adder before and after
      int index = parentList.indexOf(around);
      if (!skipAdderBefore) {
        parentList.insert(
            index,
            createInserterOrMoverStep(
                around.parentListType, around.parentStep, STEP_ADDER));
      }
      if (around.shape != FUNC_RETURN) {
        parentList.insert(
            index + (skipAdderBefore ? 1 : 2),
            createInserterOrMoverStep(
                around.parentListType, around.parentStep, STEP_ADDER));
      }

      // now surround each child in the same way
      if (!around.isFuncCallStep() || around.flowchartLinkRef == null) {
        for (var childListType in around.childStepLists.keys) {
          List<StepM>? childList = around.childStepLists[childListType];
          List<StepM> newList = [];
          if (childList != null) {
            if (childList.isEmpty) {
              newList.add(
                  createInserterOrMoverStep(childListType, around, STEP_ADDER));
            } else if (childList.isNotEmpty) {
              for (var s in childList) {
                newList.add(createInserterOrMoverStep(
                    childListType, around, STEP_ADDER));
                newList.add(s);
              }
              // append an inserter after the steps
              StepM lastStep = childList.last;
              if (lastStep.shape != FUNC_RETURN) {
                newList.add(createInserterOrMoverStep(
                    childListType, around, STEP_ADDER));
              }
            }
          }
          around.childStepLists[childListType] = newList;
        }
      }
    } else {
      List<StepM> copyOfRootList = [...steps];
      // entire tree
      bool isFirst = true;
      for (StepM step in copyOfRootList) {
        _addAddersAroundAndBelow(around: step, skipAdderBefore: !isFirst);
        isFirst = false;
      }
    }
  }

  void _addAddersBelow({required StepM around}) {
    // now surround each child in the same way
    if (!around.isFuncCallStep() || around.flowchartLinkRef == null) {
      for (var childListType in around.childStepLists.keys) {
        List<StepM>? childList = around.childStepLists[childListType];
        List<StepM> newList = [];
        if (childList != null) {
          if (childList.isEmpty) {
            newList.add(
                createInserterOrMoverStep(childListType, around, STEP_ADDER));
          } else if (childList.isNotEmpty) {
            for (var s in childList) {
              newList.add(
                  createInserterOrMoverStep(childListType, around, STEP_ADDER));
              newList.add(s);
            }
            // append an inserter after the steps
            StepM lastStep = childList.last;
            if (lastStep.shape != FUNC_RETURN) {
              newList.add(
                  createInserterOrMoverStep(childListType, around, STEP_ADDER));
            }
          }
        }
        around.childStepLists[childListType] = newList;
      }
    }
  }

  void addersOrMoversEverywhere(String shape) {
    steps = _addInsertersOrMovers(steps, ROOT_STEPS, ROOT_STEP, shape);
  }

// List<StepM> addAdders(List<StepM> theList, String theParentStepType, StepM theParentStep) {
//   if (theList == null) return [];
//   List<StepM> newList = [];
//   newList.add(createInserterStep(theParentStepType, theParentStep, STEP_ADDER));
//   for (StepM s in theList) {
//     for (String childListType in s.childStepLists.keys) {
//       s.childStepLists[childListType] = addAdders(s.childStepList(childListType), s.shape, s);
//     }
//     newList.add(s);
//     if (theList.isNotEmpty)
//       newList.add(createInserterStep(theParentStepType, theParentStep, STEP_ADDER));
//   }
//   return newList;
// }

// assumption: never when a step is selected
  List<StepM> _addInsertersOrMovers(
      List<StepM> theList, String listType, StepM? parentStep, String shape) {
    List<StepM> newList = [];

// skip any existing inserters
    theList = theList.where((StepM s) => s.shape != shape).toList();

    if (theList.isEmpty) {
      newList.add(createInserterOrMoverStep(listType, parentStep,
          listType == NEW_CASE_STEPS ? CASE_ADDER : shape));
    } else {
// add inserter if empty list
      if (theList.isEmpty) {
        newList.add(createInserterOrMoverStep(listType, parentStep,
            listType == NEW_CASE_STEPS ? CASE_ADDER : shape));
      } else {
        for (var s in theList) {
// every step is preceded by an inserter
          if (s.changeType != ChangeType.trashedStep) {
            newList.add(createInserterOrMoverStep(listType, parentStep, shape));
          }
// if switch, add new case
          if (s.shape == SWITCH) {
            if (s.childStepLists[NEW_CASE_STEPS] == null) {
              s.childStepLists[NEW_CASE_STEPS] = [];
            }
          }
          for (var childListType in s.childStepLists.keys) {
            List<StepM>? childList = s.childStepLists[childListType];
            if (childList != null) {
              s.childStepLists[childListType] =
                  _addInsertersOrMovers(childList, childListType, s, shape);
            }
          }
          newList.add(s);
        }
// append an inserter after the steps
        StepM? lastStep = theList.isNotEmpty ? theList.last : null;
        if (lastStep != null && lastStep.shape != FUNC_RETURN) {
          newList.add(createInserterOrMoverStep(listType, parentStep, shape));
        }
      }
    }

// return the updated list - caller needs to cascade change up..
    return newList;
  }

  List<StepM>? removeInsertersAndMoversExceptSingleAdder() {
    int? possiblySingleAdderId =
        steps.length == 1 && steps[0].shape == STEP_ADDER ? steps[0].id : null;
    steps =
        removeInsertersAndMovers_(steps, theExceptionId: possiblySingleAdderId);
    // fco.logi('${steps.length} steps');
    isAnAdderIconPresent = (possiblySingleAdderId != null);
    isAMoverIconPresent = false;
    return steps;
  }

  List<StepM>? removeInsertersAndMovers({int? theExceptionId}) {
    steps = removeInsertersAndMovers_(steps, theExceptionId: theExceptionId);
    // fco.logi('${steps.length} steps');
    isAnAdderIconPresent = false;
    isAMoverIconPresent = false;
    return steps;
  }

  List<StepM> removeInsertersAndMovers_(List<StepM>? theList,
      {int? theExceptionId, bool omitTrashed = false}) {
    // skip is nothing to remove
    if (!isAnAdderIconPresent && !isAMoverIconPresent) {
      return theList ?? [];
    }

    List<StepM> newList = [];
    List<StepM> listWithoutAdders = [];

    if (theList != null) {
      listWithoutAdders = theList.where((StepM s) {
        return s.id == theExceptionId ||
            (s.shape != STEP_ADDER && s.shape != STEP_MOVER);
      }).toList();

      listWithoutAdders = listWithoutAdders.where((StepM s) {
        return !(omitTrashed && s.changeType == ChangeType.trashedStep);
      }).toList();

      for (var s in listWithoutAdders) {
        for (var listType in s.childStepLists.keys) {
          List<StepM>? childList = s.childStepLists[listType];
          if (childList != null && childList.isNotEmpty) {
            s.childStepLists[listType] = removeInsertersAndMovers_(childList,
                theExceptionId: theExceptionId, omitTrashed: omitTrashed);
          }
        }
        if (s.shape == SWITCH) {
          if (s.childStepLists[NEW_CASE_STEPS] != null) {
            s.childStepLists.remove(NEW_CASE_STEPS);
          }
        }
        newList.add(s);
      }
    }

    return newList;
  }

// use this just to measure diff in scroll offsets when selecting a step
//   List<StepM> addMoversBefore(List<StepM> theList, String listType, StepM? parentStep, StepM beforeStep) {
//     List<StepM> newList = [];
//
//     if (theList.isEmpty) {
//       if (!parentStep!.isOrIsADescendentOf([beforeStep])) {
//         if (!stepFound) {
//           newList.add(beforeStep.parentFlowchart.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//         }
//       }
//     } else {
// // add inserter if empty list
//       if (theList.isEmpty) {
//         if (!parentStep!.isOrIsADescendentOf([beforeStep])) {
//           if (!stepFound) {
//             newList.add(beforeStep.parentFlowchart.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//           }
//         }
//       } else {
//         if (!stepFound) {
//           for (var s in theList) {
//             if (s.id == beforeStep.id) {
//               stepFound = true;
//             }
// // every step is preceded by an inserter
//             if (!isStep2BMoved(s) &&
//                 parentStep != null &&
//                 !parentStep.isOrIsADescendentOf([beforeStep]) &&
//                 !s.nextStepIsSelected(theList, beforeStep) &&
//                 !s.prevStepIsSelected(theList, beforeStep)) {
//               if (!stepFound) newList.add(beforeStep.parentFlowchart.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//             }
//             for (var childListType in s.childStepLists.keys) {
//               if (!stepFound) {
//                 List<StepM> childList = s.childStepList(childListType);
//                 if (!stepFound && (s.id != beforeStep.id)) {
//                   s.setChildStepList(childListType, addMoversBefore(childList, childListType, s, beforeStep));
//                 }
//               }
//             }
//             newList.add(s);
//           }
//         }
// // append an inserter after the steps
//         StepM lastStep = theList.last;
//         if (lastStep.shape != FUNC_RETURN &&
//             !lastStep.isOrIsADescendentOf([beforeStep]) &&
//             !lastStep.nextStepIsSelected(theList.toList(), beforeStep)) {
//           if (!stepFound) {
//             newList.add(createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//           }
//         }
//       }
//     }
//
// // return the updated list - caller needs to cascade change up..
//     return newList;
//   }

// top,left offset of the column of child steps
  double stepListOffsetLeft(String theListType, {StepM? theStep}) {
    switch (theListType) {
      case ROOT_STEPS:
        return MMM + PPP;
      case FUNC_CALL_STEPS:
        return MMM * 3;
      case LOOP_STEPS:
        return MMM * 2 + PPP * 3 + TTT;
      // default applies to case statements as well
      case TRUE_STEPS:
      case FALSE_STEPS:
      case SUCCEED_STEPS:
      case FAIL_STEPS:
        return MMM * 2 + PPP * 2 + TTT;
      case NEW_CASE_STEPS:
        return MMM * 2 + theStep!.getCaseNameW(theListType) / 2;
      default:
        // switch case steps
        return theStep!.getCaseNameW(theListType) +
            MMM * 2 +
            PPP * 2 +
            TTT +
            MMM;
    }

//  double stepListOffsetLeft(String theListType, {StepM theStep}) {
//    switch (theListType) {
//      case ROOT_STEPS:
//        return MMM + PPP;
//      case FUNC_CALL_STEPS:
//        return MMM * 3;
//      case LOOP_STEPS:
//        return MMM * 2 + PPP * 4 + TTT;
//    // default applies to case statements as well
//      case TRUE_STEPS:
//      case FALSE_STEPS:
//      case SUCCEED_STEPS:
//      case FAIL_STEPS:
//        return MMM * 2 + PPP * 3 + TTT;
//      case NEW_CASE_STEPS:
//        return MMM * 2 + theStep.getCaseNameW(theListType) / 2;
//      default:
//      // switch case steps
//        return theStep.getCaseNameW(theListType) + 60 /*case+:*/ + MMM * 2 + PPP * 2 + TTT + MMM;
//    }
  }

  void stepsdebugPrint(List<StepM> theList) {
    for (var theStep in theList) {
      //fco.logi('${theStep!.shape} - ${theStep.id}');
      theStep.childStepLists.forEach((String key, List<StepM> theChildList) {
        fco.logi('  $key children: ${theChildList.length}');
        stepsdebugPrint(theChildList);
      });
    }
  }

  void selectedFlowchartDebugPrint(String calledFrom) {
    fco.logi(
        '---==================---===========---===============------==============--------======');
    fco.logi(calledFrom);
    stepsdebugPrint(steps);
  }

  late int commentCount;

  void resizeAllSteps(BuildContext theContext) {
    //recursive
    void resizeSteps(List<StepM> theList) {
      for (var theStep in theList) {
        theStep.setTxtAndCalcSize(theStep.txt);
        theStep.childStepLists.forEach((String key, List<StepM>? theChildList) {
          resizeSteps(theChildList!);
        });
      }
    }

    resizeSteps(steps);
  }

// navigate to step iot count prior comments
// null step means tally up all comments
  int countEarlierComments(StepM? s) {
    bool found = false;

    int numComments = beginComment != null ? 1 : 0;

    //recursive
    int navigate(List<StepM> theList) {
      int result = 0;
      for (StepM theStep in theList) {
        if (theStep == s || found) {
          found = true;
          return result;
        }
        if (theStep.comment != null) result++;
        theStep.childStepLists.forEach((String key, List<StepM>? theChildList) {
          result += navigate(theChildList!);
        });
      }
      return result;
    }

    numComments += navigate(steps);

    return numComments;
  }

  bool _normalStepTest(StepM s) =>
      s.shape != STEP_MOVER && s.shape != STEP_ADDER;

  bool _everyStepTest(StepM s) => true;

  bool _adderTest(StepM s) => s.shape == STEP_ADDER;

  bool _moverTest(StepM s) => s.shape == STEP_MOVER;

// except Mover and Adders
  List<StepM> allSteps() => _allSteps(_normalStepTest);

  List<StepM> allAdders() {
    List<StepM> every = _allSteps(_everyStepTest).toList();
    List<StepM> onlyAdders = every.where(_adderTest).toList();
    return onlyAdders;
  }

  List<StepM> allMovers() =>
      _allSteps(_everyStepTest).where(_moverTest).toList();

// except Mover and Adders
  List<StepM> _allSteps(bool Function(StepM) testFunc) {
    List<StepM> results = [];
    //recursive
    void traverse(List<StepM> theList) {
      theList.where(testFunc).forEach((StepM theStep) {
        results.add(theStep);
        theStep.childStepLists.forEach((String key, List<StepM> theChildList) {
          traverse(theChildList);
        });
      });
    }

    traverse(steps);
    return results;
  }

// Future<Map<String,ByteData>> loadAllImages() async {
//   // path,image
//   Map<String,ByteData> images = {};
//
//   //recursive
//   void recurse(List<StepM> theList) async {
//     Future.forEach(theList, (StepM theStep) async {
//       if (theStep.iconIndex > 0) {
//         String path = stepIcons[AdderMenuEnum.values[theStep.iconIndex]];
//         ByteData imageData = await rootBundle.load(path);
//         images[path] = imageData;
//       }
//
//       theStep.childStepLists?.forEach((String key, List<StepM> theChildList) async {
//         await recurse(theChildList);
//       });
//     });
//   }
//
//   await recurse(steps);
//   return images;
// }

  StepM? _findStep(List<StepM> theList, int stepId) {
    StepM? foundStep;
    for (StepM theStep in theList) {
      if (theStep.id == stepId) {
        return theStep;
      } else {
        for (String key in theStep.childStepLists.keys) {
          List<StepM> childList = theStep.childStepLists[key]!;
          var step = _findStep(childList, stepId);
          if (step != null) return step;
        }
      }
    }
    return foundStep;
  }

  StepM? findStep(int stepId) {
    return _findStep(steps, stepId);
  }

  void _countStepComments(List<StepM> theList) {
    for (var theStep in theList) {
      if (theStep.comment != null) commentCount++;
      theStep.childStepLists.forEach((String key, List<StepM>? theChildList) {
        _countStepComments(theChildList!);
      });
    }
  }

  int countFlowchartComments() {
    commentCount = 0;
    _countStepComments(stepsShowingChanges);
    return commentCount;
  }

  int totalCommentCount() {
    // calc num comments
    int totalComments = beginComment != null ? 1 : 0;
    totalComments += countFlowchartComments();
    totalComments += endComment != null ? 1 : 0;
    return totalComments;
  }

// =====================================================
// convert BV to M
  static FlowchartM flowchartBV2M(FlowchartBV theFlowchartBV) {
    // deprecating descr with Comment.topTxt, and imageSize with Comment.imageSize
    CommentM? flowchartComment =
        CommentM.commentBV2M(theFlowchartBV.flowchartComment);
    if (flowchartComment == null) {
      flowchartComment = CommentM();
      flowchartComment.topTxt = theFlowchartBV.descr;
      flowchartComment.imageSize = theFlowchartBV.imageSize;
    }
    FlowchartM newFlowchart = FlowchartM();
    newFlowchart
      ..createdMs = theFlowchartBV.createdMs
      ..id = theFlowchartBV.id!
      ..deleted = theFlowchartBV.deleted ?? false
// ..synced = theFlowchartBV.synced ?? false
//       ..dirty = theFlowchartBV.dirty ?? false
      ..ownerEa = theFlowchartBV.ownerEa
      ..beginTxt = theFlowchartBV.beginTxt!
//      ..beginTxtW = theFlowchartBV.beginTxtW
//      ..beginTxtH = theFlowchartBV.beginTxtH

      ..flowchartComment = flowchartComment
      ..beginComment = CommentM.commentBV2M(theFlowchartBV.beginComment)
      ..endComment = CommentM.commentBV2M(theFlowchartBV.endComment)
      ..title = theFlowchartBV.title!
      // ..descr = theFlowchartBV.descr!
      // ..imageSize = theFlowchartBV.imageSize
      ..version = int.parse(theFlowchartBV.version!)
      ..paperSizeFromString = theFlowchartBV.pageSize!
      ..lastModifiedMs = theFlowchartBV.lastModifiedMs
      ..endTxt = theFlowchartBV.endTxt!
//      ..endTxtW = theFlowchartBV.endTxtW
//      ..endTxtH = theFlowchartBV.endTxtH
      ..colorValue = theFlowchartBV.pageSize == "undefined"
          ? Colors.white.value
          : theFlowchartBV.colorValue ?? Colors.grey[300]!.value
      ..showColouredTrueAndFalse =
          theFlowchartBV.showColouredTrueAndFalse ?? false
      ..stepsMap = {}
      ..previousVersionMap = {};
// steps
    for (var key in theFlowchartBV.stepsMap!.keys) {
      BuiltList<StepBV>? list = theFlowchartBV.stepsMap![key];
      List<StepM> newList =
          stepListBV2M(list, ROOT_STEPS, ROOT_STEP, newFlowchart);
      try {
        newFlowchart.stepsMap[int.parse(key)] = newList;
      } catch (error) {
        fco.logi('parse error - key = $key');
      }
    }
// prev versions
    if (theFlowchartBV.previousVersionMap != null) {
      for (var vers in theFlowchartBV.previousVersionMap!.keys) {
        String prevVers = theFlowchartBV.previousVersionMap![vers]!;
        int prevVer = int.parse(prevVers);
        int ver = int.parse(vers);
        newFlowchart.previousVersionMap[ver] = prevVer;
      }
    }
    return newFlowchart;
  }

  void clearChangeTypes(
      List<StepM> theList, String listType, StepM? parentStep) {
    // theList.forEach((StepM s) {
    //   s.changeType = null!;
    //   if (s.childStepLists != null) {
    //     s.childStepLists.keys.forEach((childListType) {
    //       List<StepM>? childList = s.childStepLists[childListType];
    //       if (childList != null) clearChangeTypes(childList, childListType, s);
    //     });
    //   }
    // });
  }

  static List<StepM> stepListBV2M(BuiltList<StepBV>? theBVList,
      String theListType, StepM? theMParent, FlowchartM theFlowchart) {
    List<StepM> newList = [];

    if (theBVList != null) {
      for (var s in theBVList) {
        newList.add(stepBV2M(s, theMParent, theFlowchart));
      }
    }

// return the updated list - caller needs to cascade change up..
    return newList;
  }

  static StepM stepBV2M(
      StepBV theBVStep, StepM? theMParentStep, FlowchartM theFlowchart) {
    StepM mStep = StepM(theFlowchart, theBVStep.id!);
    try {
      mStep
        ..iconIndex = theBVStep.iconIndex
        ..txt = theBVStep.txt!
        ..txtSize = Size(theBVStep.txtW ?? 100, theBVStep.txtH ?? 24)
//        ..txtW = theBVStep.txtW
//        ..txtH = theBVStep.txtH
        ..comment = CommentM.commentBV2M(theBVStep.comment)
        ..shape = theBVStep.shape!
        ..changeType = theBVStep.changeType
        ..flowchartLinkRef = theBVStep.flowchartLinkRef
        ..flowchartLinkVersion = theBVStep.flowchartLinkVersion
        ..parentListType = theBVStep.parentListType!
        ..parentStep = theMParentStep
        ..caseNameWidths = SplayTreeMap<String, double>.of({});
      if (theBVStep.caseNameWidths != null &&
          theBVStep.caseNameWidths!.isNotEmpty) {
        BuiltMap<String, double> caseNameWidths = theBVStep.caseNameWidths!;
        for (var key in caseNameWidths.keys) {
          mStep.caseNameWidths![key] = caseNameWidths[key]!;
        }
      }
      mStep.childStepLists = SplayTreeMap<String, List<StepM>>.of({});
      if (theBVStep.childStepLists != null) {
// convert its child step lists
        if (theBVStep.shape == FUNC_CALL) {
          BuiltList<StepBV> bvSteps =
              theBVStep.childStepLists?[FUNC_CALL_STEPS] ??
                  BuiltList<StepBV>.of([]);
          mStep.setChildStepList(FUNC_CALL_STEPS, []);
          for (var bvStep in bvSteps) {
            mStep
                .childStepList(FUNC_CALL_STEPS)
                .add(stepBV2M(bvStep, mStep, theFlowchart));
          }
        } else if (theBVStep.shape == LOOP) {
          BuiltList<StepBV> bvLoopSteps =
              theBVStep.childStepLists?[LOOP_STEPS] ?? BuiltList<StepBV>.of([]);
          mStep.setChildStepList(LOOP_STEPS, []);
          for (var bvStep in bvLoopSteps) {
            mStep
                .childStepList(LOOP_STEPS)
                .add(stepBV2M(bvStep, mStep, theFlowchart));
          }
        } else if (theBVStep.shape == DECISION) {
          BuiltList<StepBV> bvTrueSteps =
              theBVStep.childStepLists?[TRUE_STEPS] ?? BuiltList<StepBV>.of([]);
          mStep.childStepLists[TRUE_STEPS] = [];
          for (var bvStep in bvTrueSteps) {
            mStep.childStepLists[TRUE_STEPS]!
                .add(stepBV2M(bvStep, mStep, theFlowchart));
          }
          BuiltList<StepBV> bvFalseSteps =
              theBVStep.childStepLists?[FALSE_STEPS] ??
                  BuiltList<StepBV>.of([]);
          mStep.childStepLists[FALSE_STEPS] = [];
          for (var bvStep in bvFalseSteps) {
            mStep.childStepLists[FALSE_STEPS]!
                .add(stepBV2M(bvStep, mStep, theFlowchart));
          }
        } else if (theBVStep.shape == ASYNC_FUNC_CALL) {
          BuiltList<StepBV> bvSucceedSteps =
              theBVStep.childStepLists?[SUCCEED_STEPS] ??
                  BuiltList<StepBV>.of([]);
          mStep.childStepLists[SUCCEED_STEPS] = [];
          for (var bvStep in bvSucceedSteps) {
            mStep.childStepLists[SUCCEED_STEPS]!
                .add(stepBV2M(bvStep, mStep, theFlowchart));
          }
          BuiltList<StepBV> bvFailSteps =
              theBVStep.childStepLists?[FAIL_STEPS] ?? BuiltList<StepBV>.of([]);
          mStep.childStepLists[FAIL_STEPS] = [];
          for (var bvStep in bvFailSteps) {
            mStep.childStepLists[FAIL_STEPS]!
                .add(stepBV2M(bvStep, mStep, theFlowchart));
          }
        } else if (theBVStep.shape == SWITCH) {
          theBVStep.childStepLists?.keys
              .where((key) =>
                  key != FUNC_CALL_STEPS &&
                  key != LOOP_STEPS &&
                  key != TRUE_STEPS &&
                  key != FALSE_STEPS &&
                  key != SUCCEED_STEPS &&
                  key != FAIL_STEPS)
              .forEach((key) {
            BuiltList<StepBV> bvSteps =
                theBVStep.childStepLists?[key] ?? BuiltList<StepBV>.of([]);
            mStep.childStepLists[key] = [];
            for (var bvStep in bvSteps) {
              mStep.childStepLists[key]!
                  .add(stepBV2M(bvStep, mStep, theFlowchart));
            }
          });
        }
      }
    } catch (e) {
      fco.logi(e.toString());
    }
    return mStep;
  }

  FlowchartM cleanClone() {
    FlowchartM fCopy = copyOf(generateNewKey: false);
    fCopy.removeInsertersAndMovers();
    return fCopy;
  }

  /// this creates a copy with its own key, including some transient properties
  FlowchartM copyOf({required bool generateNewKey}) {
    debugPrint('FlowchartM.copyOf--------------');
    var json = toJsonString();
    var copy = FlowchartM.fromJsonString(json);

    // also copy the transients
    // copy.flowchartEditorPageGK = flowchartEditorPageGK;
    copy._stepGKs.addAll(_stepGKs);
    copy.showAdvancedStepTypes = showAdvancedStepTypes;

    // may have fetched imageBytes
    copy.imageBytes = imageBytes;

    if (generateNewKey) copy.createdMs = DateTime.now().millisecondsSinceEpoch;
    return copy;
  }

  FlowchartBV toBV() {
// steps
    Map<String, BuiltList<StepBV>> map = {};
    for (var version in stepsMap.keys) {
      List<StepBV> list =
          stepListM2BV(stepsMap[version], ROOT_STEPS, ROOT_STEP);
      map.putIfAbsent(version.toString(), () => BuiltList<StepBV>.from(list));
    }

    BuiltMap<String, BuiltList<StepBV>> bmap =
        BuiltMap<String, BuiltList<StepBV>>.of(map);

// prev versions
// steps
    Map<String, String> mapP = {};
    for (var version in previousVersionMap.keys) {
      int? prevVer = previousVersionMap[version];
      mapP.putIfAbsent(version.toString(), () => prevVer.toString());
    }

    BuiltMap<String, String> bmapP = BuiltMap<String, String>.of(mapP);

    return FlowchartBV.fromCustomFactory(
      theId: id,
      theTitle: title,
      // theDescr: descr,
      // theCommentImageSize: imageSize,
      theOwnerEa: ownerEa,
      theAuthor: author,
      whenLastModified: lastModifiedMs ?? createdMs,
      whenCreated: createdMs,
      isDeleted: deleted ?? false,
      // isSynced: this.synced ?? false,
      theVersion: version,
      thePageSize: paperSizeAsString,
      theBeginTxt: beginTxt,
      theFlowchartComment: flowchartComment?.toBV(),
      theBeginComment: beginComment?.toBV(),
      theStepsMap: bmap,
      thePrevVersionMap: bmapP,
      theEndTxt: endTxt,
      theEndComment: endComment?.toBV(),
      theColorValue: colorValue,
      theShowDecisionColours: showColouredTrueAndFalse,
    );
  }

  static List<StepBV> stepListM2BV(
      List<StepM>? theMList, String theListType, StepM? theMParent) {
    List<StepBV> newList = [];

    if (theMList != null) {
      for (var s in theMList) {
        Map<String, BuiltList<StepBV>> newChildLists = {};
        for (var childListType in s.childStepLists.keys) {
          List<StepM> childMList = s.childStepLists[childListType]!;
          newChildLists[childListType] = BuiltList<StepBV>.of(
              stepListM2BV(childMList, childListType, s.parentStep));
        }
        StepBV bvStep = stepM2BV(s, newChildLists);
        newList.add(bvStep);
      }
    }

// return the updated list - caller needs to cascade change up..
    return newList;
  }

// convert all except, of course, the childLists
  static StepBV stepM2BV(
      StepM theMStep, Map<String, BuiltList<StepBV>> theMChildLists) {
    StepBV bvStep = StepBV.factory(DateTime.now().millisecondsSinceEpoch,
        theKey: theMStep.id,
        theIconIndex: theMStep.iconIndex,
        theTxt: theMStep.txt,
        theTxtW: theMStep.calculatedTxtSize.width,
        theTxtH: theMStep.calculatedTxtSize.height,
        theShape: theMStep.shape,
        theChangeType: theMStep.changeType,
        theParentListType: theMStep.parentListType,
        theFlowchartLinkRef: theMStep.flowchartLinkRef,
        theFlowchartLinkVersion: theMStep.flowchartLinkVersion,
        theChildStepLists:
            BuiltMap<String, BuiltList<StepBV>>.of(theMChildLists),
        theComment: theMStep.comment?.toBV(),
        theCaseWidths: theMStep.caseNameWidths != null
            ? BuiltMap<String, double>.of(theMStep.caseNameWidths!)
            : BuiltMap<String, double>.of({}));
    return bvStep;
  }

//  void toggleAdders({bool force}) {
//    if (force != null) {
//      if (!showingAdders && force)
//        addInserters();
//      if (showingAdders && !force) removeInsertersAndMovers();
//      showingAdders = force;
//    } else {
//      showingAdders = !showingAdders;
//      if (showingAdders)
//        addInserters();
//      else
//        removeInsertersAndMovers();
//    }
//  }

//  void toggleTrashcans({bool force}) {
//    if (force != null)
//      this.showingTrashcans = force;
//    else
//      this.showingTrashcans = !this.showingTrashcans;
//  }

// /*
//    * (re)initialisation for the editor
//    */
//   void resetTransients() {
//     // commentBeingEditedIndex = commentBeingEditedStepId = null;
//     // fco.logi('*** resetTransients ***');
//     // regardless of whether a step was already selected
//     // moversOffset = 0.0;
//     //step2BMoved = null;
//     // step2BDeleted = null;
//     //step2BMovedGK = null;
//     // don't if empty flowchart
//     removeInsertersAndMovers();
//     //resetEditingMode();
// //    clearStepSelection();
// //    awaitingConfirmationTapForMove = null;
//   }

  String get descrImageStorageKey {
// HACK changed the smaples ea
    var flowchartOwnerEa = ownerEa ?? '';
    if (flowchartOwnerEa.isNotEmpty &&
        flowchartOwnerEa == 'samples@flowchart.studio') {
      ownerEa = flowchartOwnerEa = 'algc.samples@biancashouse.com';
    }
    return '${flowchartOwnerEa.isNotEmpty ? 'algc/users/$flowchartOwnerEa' : "algc/users/algc.samples@biancashouse.com"}/$id/descr';

    // return '${((ownerEa ?? "").isNotEmpty ? '/algc/users/$ownerEa' : "algc/users/algc.samples@biancashouse.com")}/$id/descr';
  }

// Future<Uint8List?> getImage({bool localOnly = false}) async {
//   if (imageSize == null || imageSize == 0) return null;
//
//   // already cached ?
//   if (imageBytes?.isNotEmpty ?? false) {
//     imageSize = imageBytes!.lengthInBytes; // resetting the size is redundant, hopefully ?
//     fco.logi('getImage() returned memory-cached bytes: $imageSize');
//     // await setImage(flowchart, stepId, _bytes); // assuming would already be in prefs
//     return imageBytes;
//   }
//
//   // stored in local store i.e. prefs or indexedDB ?
//   String imgKey = descrImageKey;
//   String? s = await App.localStore.getString(imgKey);
//   if (s != null) {
//     imageBytes = base64Decode(s);
//     if (imageBytes != null) {
//       imageSize = imageBytes!.lengthInBytes;
//       fco.logi('getImage() returned pref-cached bytes: $imageSize');
//       return imageBytes;
//     }
//   }
//
//   if (!localOnly) {
//     // so not found locally, is it in firebase ?
//     fco.logi('Downloading flowchart descr image from Firebase (flowchart:$id}, $title');
//     firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
//     firebase_storage.Reference ref = storage.ref(imgKey);
//     // func to do the fb download
//     Future<Uint8List?> downloadImageData() async {
//       Uint8List? downloadedData = await ref.getData();
//       fco.logi('getImage() downloaded $imageSize bytes from FB Storage');
//       imageBytes = downloadedData;
//       imageSize = imageBytes!.lengthInBytes;
//       // save to local storage
//       String s = base64Encode(imageBytes!);
//       await App.localStore.setString(imgKey, s);
//       fco.logi('saved to local store: $imgKey');
//
//       // don't set dirty - may need to reinstate later ?
//       //flowchart.dirty = true;
//       return downloadedData;
//     }
//
//     try {
//       Uint8List? data = await downloadImageData();
//       return data;
//     } on firebase_storage.FirebaseException catch (e) {
//       fco.logi('\n*** firebase error: ${e.message} ***\n');
//       fco.logi('imageKey $imgKey $title');
//       fco.logi('\nSign in, and try again...\n');
//       await RepoWithFirestore.ensureCurrentEaSignedInToFirebase(FirebaseAuth.instance);
//       try {
//         Uint8List? data = await downloadImageData();
//         return data;
//       } on firebase_storage.FirebaseException catch (e) {
//         fco.logi('\n*** firebase error again: ${e.message} ***\n');
//       }
//     }
//   }
//
//   return null;
// }
}

//enum PageSize {a4, letter, a3}

// ignore: non_constant_identifier_names
double get DEFAULT_T => 14;
// ignore: non_constant_identifier_names
double get DEFAULT_M => DEFAULT_T;
// ignore: non_constant_identifier_names
double get DEFAULT_P => DEFAULT_T / 2;
const String DEFAULT_FONT_FAMILY = 'sans-serif';
const List<String> paperSizes = ['letter', 'a4', 'a3'];

const Offset PdfPageOffset = Offset(10.0, 10.0);
