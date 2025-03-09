import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/bv/step_bv.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_types_enum.dart';
import 'package:flutter_content/src/algc/model/m/string_encoder_decoder.dart';
import 'package:random_string/random_string.dart';

import 'comment_m.dart';

class StepM with StringEncoderDecoder {
  final int id;
  FlowchartM parentFlowchart;

  // EditorBloc? get editorBloc => App.bloc.getEditorBloc(parentFlowchart.id);

  StepM(this.parentFlowchart, this.id);

  int? _iconIndex;

  int get iconIndex => _iconIndex ?? 0;

  set iconIndex(int? newVal) => _iconIndex = newVal;

  double get MMM => parentFlowchart.MMM;

  double get PPP => parentFlowchart.PPP;

  double get TTT => parentFlowchart.TTT;
  Size _txtSize = Size.zero;

  /// ---- transient ------------------------------------

  // bool txtBeingEdited = false;
  // bool beingDeleted = false;
//  bool wasStepJustMoved = false; //transient
  Size get calculatedTxtSize {
    return _txtSize.width > 0 && shape != null
        ? _txtSize
        : Size(
            shape!.length * DEFAULT_T,
            DEFAULT_T + PPP,
          );
  } //textSize(txt, textStyle);

  // // StepWidgetDndState? stepStateDnd() => parentFlowchart.stepStateDnd(id);
  // StepWidgetState? stepState() => parentFlowchart.stepState(id);
  //
  // FlowchartEditorPageState? get pageState => parentFlowchart.editingPageState;
  //
  // FlowchartEditorBodyState? bodyState(context) =>
  //     context.findAncestorStateOfType<FlowchartEditorBodyState>();

  /// ---- transient ------------------------------------

//  bool awaitingMoverTap;
//  bool awaitingMoveConfirmationTap;

  //StepWidget2 widget;

  int updates = 0;

  String _txt = '';

  String get txt =>
      _txt.isEmpty && (shape != null) ? shape! : decodeString(_txt);

  // only available for bv to m conversion
  set txt(String s) => _txt = encodeString(s);

  set txtSize(ts) => _txtSize = ts;

  void setTxtAndCalcSize(String s) {
    _txt = encodeString(s);
    _txtSize = _calcTextSize(s);
  }

  // assumes casename has a numeric prefix, which indicates its pos in the switch stmt
  int casenamePrefix(String casename) {
    var parts = casename.split(' ');
    if (parts.length > 1) return int.parse(parts[0]);
    return 0;
  }

  String removePrefix(String casename) {
    var parts = casename.split(' ');
    if (parts.length > 1) {
      return casename.substring(parts[0].length + 1);
    } else {
      return casename;
    }
  }

  String? nthCaseName(int n) {
    String? result;
    childStepLists.forEach((key, childList) {
      if (key.startsWith('$n ')) {
        result = key;
      }
    });
    return result;
  }

  Size _calcTextSize(s) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: s, style: textStyle),
      maxLines: 6,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    //allow for possible icon
    return Size(
        max(
            50,
            textPainter.size.width +
                10) /* + ((iconIndex ?? 0) > 0 ? 40 : 0) */,
        textPainter.size.height);
  }

  CommentM? comment;

  String? shape;

  bool get isAFuncCall =>
      shape == FUNC_CALL ||
      shape == ASYNC_FUNC_CALL ||
      shape == AWAIT_FUNC_CALL;

  String? flowchartLinkRef;
  int? flowchartLinkVersion;

  ChangeType? changeType;

  late String parentListType;

  SplayTreeMap<String, List<StepM>> _childStepLists =
      SplayTreeMap<String, List<StepM>>();

  SplayTreeMap<String, List<StepM>> get childStepLists => _childStepLists;

  SplayTreeMap<String, List<StepM>> get childStepListsShowingChanges {
    SplayTreeMap<String, List<StepM>> resultsMap =
        SplayTreeMap<String, List<StepM>>();
    for (var key in _childStepLists.keys) {
      resultsMap[key] = childStepListShowingChanges(key);
    }
    return resultsMap;
  }

  List<StepM> childStepList(String theListType) =>
      _childStepLists[theListType] ?? [];

  // changes aware
  List<StepM> childStepListShowingChanges(String theListType) {
    //if (_childStepLists == null) fco.logger.i('ooooo');
    List<StepM> list = _childStepLists[theListType]!;
    if (parentFlowchart.version > 0 && parentFlowchart.showingChanges) {
      return list;
    } else {
      return list
          .where((step) => step.changeType != ChangeType.trashedStep)
          .toList();
    }
  }

  List<StepM> childStepListExceptTrashed(String theListType) {
    List<StepM> resultList = _childStepLists[theListType]!;
    if (parentFlowchart.version > 0 && parentFlowchart.showingChanges) {
      return resultList
          .where((step) => step.changeType != ChangeType.trashedStep)
          .toList();
    } else {
      return resultList;
    }
  }

  void setChildStepList(String theListType, List<StepM> theNewList) =>
      _childStepLists[theListType] = theNewList;

  SplayTreeMap<String, double>? caseNameWidths =
      SplayTreeMap<String, double>(); //obviously only applies to switch step

  set childStepLists(SplayTreeMap<String, List<StepM>> theNewMap) {
    _childStepLists = theNewMap;
    updates++;
  }

  void replaceList(List<StepM> theNewList, String theListType) {
    SplayTreeMap<String, List<StepM>> map = _childStepLists;
    map[theListType] = theNewList;
  }

  late StepM? parentStep;

  // hack - extra width to try to avoid unexpected wrap
  double get avoidWrap => 0;

  int get widestLine {
    LineSplitter ls = const LineSplitter();
    List<String> lines = ls.convert(txt);
    var lineLens = lines.map((line) => line.length);
    return lineLens.reduce((current, next) => current > next ? current : next);
  }

  // use approximation if not yet set
  double getCaseNameW(String theCaseKey) {
    double caseNameW = theCaseKey.length * TTT;
    if (caseNameWidths != null && caseNameWidths![theCaseKey] != null) {
      caseNameW = caseNameWidths![theCaseKey]!;
    }
    return caseNameW;
  }

  /*
   * any unexpected child list keys are assumed to be cases of a switch
   */
  List<String> get caseNames => _childStepLists.keys
      .where((key) =>
          key != LOOP_STEPS &&
          key != FUNC_CALL_STEPS &&
          key != TRUE_STEPS &&
          key != FALSE_STEPS &&
          key != SUCCEED_STEPS &&
          key != FAIL_STEPS)
      .toList();

  //set txtWForScreen(double theW) => txtW = theW - avoidWrap;

  //set txtH(double theH) => _txtH = theH;

  bool isTheOnlyStep() {
    var ret = parentListType == ROOT_STEPS &&
        parentFlowchart.steps.length == 1 &&
        (childStepLists.isEmpty ||
            _noLoopChildren() ||
            _noTrueChildren() ||
            _noFalseChildren() ||
            _noSucceedChildren() ||
            _noFailChildren() ||
            _noFuncCallChildren() ||
            _noRootChildren());
    return ret;
  }

  bool _noLoopChildren() => childStepList(LOOP_STEPS).isEmpty;

  bool _noTrueChildren() => childStepList(TRUE_STEPS).isEmpty;

  bool _noFalseChildren() => childStepList(FALSE_STEPS).isEmpty;

  bool _noSucceedChildren() => childStepList(SUCCEED_STEPS).isEmpty;

  bool _noFailChildren() => childStepList(FAIL_STEPS).isEmpty;

  bool _noFuncCallChildren() => childStepList(FUNC_CALL_STEPS).isEmpty;

  bool _noRootChildren() => childStepList(ROOT_STEPS).isEmpty;

  String adderLabel() {
    if (parentListType == SUCCEED_STEPS) {
      return 'success';
    } else if (parentListType == FAIL_STEPS) {
      return 'fail';
    } else if (parentListType == TRUE_STEPS) {
      return 'true';
    } else if (parentListType == FALSE_STEPS) {
      return 'false';
    } else {
      return '';
    }
  }

  List<StepM> getParentList() {
    if (parentListType == ROOT_STEPS) {
      return parentFlowchart.steps;
    } else {
      // if (parentStep!.childStepList(parentListType) == null)
      //   fco.logger.i('empty childList[$parentListType]');
      return parentStep?.childStepList(parentListType) ?? [];
    }
  }

  double boxW() {
    double w = //parentFlowchart.MMM +
        (isFuncCallStep() ? parentFlowchart.PPP : 0) +
            calculatedTxtSize.width +
            parentFlowchart.MMM +
            (isFuncCallStep() ? parentFlowchart.PPP : 0);
    //fco.logger.i('boxW = $w');
    return w;
  }

  int get numNewlines => '\n'.allMatches(txt).length + 1;

  // height of box containing the txt, incl the margin and padding
  double get boxH {
    double h = (parentFlowchart.MMM +
        parentFlowchart.PPP +
        calculatedTxtSize.height +
        //parentFlowchart.PPP +
        parentFlowchart.MMM);
//    fco.logger.i('boxH = $h');
    return h;
  }

  double get boxMinH =>
      parentFlowchart.MMM +
      parentFlowchart.PPP +
      TTT +
      parentFlowchart.PPP +
      parentFlowchart.MMM;

  Offset get txtOffset {
    switch (shape) {
      case DECISION:
      case LOOP:
      case STEP_ADDER:
      case STEP_MOVER:
      case CASE_ADDER:
      case ACTION:
      case SWITCH:
        return Offset(parentFlowchart.MMM * 2 + parentFlowchart.PPP,
            parentFlowchart.MMM + parentFlowchart.PPP);
      case FUNC_RETURN:
        return Offset(parentFlowchart.MMM * 2 + parentFlowchart.PPP * 3 / 2,
            parentFlowchart.MMM + parentFlowchart.PPP);
      case FUNC_CALL:
      case ASYNC_FUNC_CALL:
        return Offset(parentFlowchart.MMM * 2 + parentFlowchart.PPP * 2,
            parentFlowchart.MMM + parentFlowchart.PPP);
      case AWAIT_FUNC_CALL:
        double radius = (parentFlowchart.PPP + TTT / 2) * .6;
        double awaitOffset =
            radius + parentFlowchart.PPP * 2 + parentFlowchart.MMM;
        return Offset(awaitOffset + parentFlowchart.MMM * 2,
            parentFlowchart.MMM + parentFlowchart.PPP);
      default:
        throw ('get txtOffset - unknown step type: $shape!');
    }
  }

  bool isChildless() {
    switch (shape) {
      case DECISION:
        return (childStepList(TRUE_STEPS).isEmpty &&
            childStepList(FALSE_STEPS).isEmpty);
      case ASYNC_FUNC_CALL:
        return (childStepList(SUCCEED_STEPS).isEmpty &&
            childStepList(FAIL_STEPS).isEmpty);
      case SWITCH:
        return false;
      case LOOP:
        return childStepList(LOOP_STEPS).isEmpty;
      case FUNC_CALL:
        return childStepList(FUNC_CALL_STEPS).isEmpty;
    }
    return false;
  }

  bool hasAnEmptyChildList() {
    switch (shape) {
      case DECISION:
        return (childStepList(TRUE_STEPS).isEmpty ||
            childStepList(FALSE_STEPS).isEmpty);
      case ASYNC_FUNC_CALL:
        return (childStepList(SUCCEED_STEPS).isEmpty ||
            childStepList(FAIL_STEPS).isEmpty);
      case SWITCH:
        return false;
      case LOOP:
        return childStepList(LOOP_STEPS).isEmpty;
      case FUNC_CALL:
        return childStepList(FUNC_CALL_STEPS).isEmpty;
    }
    return false;
  }

  double height() {
    double h = (childStepLists.isNotEmpty) ? boxH : boxH - parentFlowchart.PPP;
    //hack
    switch (shape) {
      case DECISION:
        if (!isChildless()) {
          List<StepM> steps = childStepListExceptTrashed(TRUE_STEPS);
          if (steps.isEmpty) {
            h += boxH;
          } else {
            double sumOfH = parentFlowchart.sumOfHeightsOf(steps);
            double hWithChildren = parentFlowchart.MMM +
                parentFlowchart.PPP +
                calculatedTxtSize.height +
                parentFlowchart.PPP +
                sumOfH;
            h = max(h, hWithChildren);
          }
          steps = childStepListExceptTrashed(FALSE_STEPS);
          double sumOfH =
              steps.isNotEmpty ? parentFlowchart.sumOfHeightsOf(steps) : 0;
          h += sumOfH;
        } else {
          h += 30;
        }
        h += 4;
        break;
      case ASYNC_FUNC_CALL:
        if (!isChildless()) {
          List<StepM> steps = childStepListExceptTrashed(SUCCEED_STEPS);
          if (steps.isEmpty) {
            h += boxH;
          } else {
            double sumOfH = parentFlowchart.sumOfHeightsOf(steps);
            double hWithChildren = parentFlowchart.MMM +
                parentFlowchart.PPP +
                calculatedTxtSize.height +
                parentFlowchart.PPP +
                sumOfH;
            h = max(h, hWithChildren);
          }
          steps = childStepListExceptTrashed(FAIL_STEPS);
          double sumOfH =
              steps.isNotEmpty ? parentFlowchart.sumOfHeightsOf(steps) : 0;
          h += sumOfH;
        } else {
          h += 30;
        }
        h += 4;
        break;
      case SWITCH:
        if (!isChildless()) {
          h = boxH;
          _childStepLists.forEach((String key, List<StepM> steps) {
            double caseH =
                max(boxH, parentFlowchart.sumOfHeightsOf(childStepList(key)));
            h += caseH;
          });
        }
        break;
      case FUNC_CALL:
        if (_childStepLists[FUNC_CALL_STEPS]!.isNotEmpty) {
          List<StepM> steps = childStepListShowingChanges(FUNC_CALL_STEPS);
          double sumOfH = parentFlowchart.sumOfHeightsOf(steps);
          h = max(
              h,
              parentFlowchart.MMM +
                  parentFlowchart.PPP +
                  calculatedTxtSize.height +
                  parentFlowchart.PPP +
                  sumOfH);
        }
        break;
      case LOOP:
        if (!isChildless()) {
          List<StepM> steps = childStepListShowingChanges(LOOP_STEPS);
          double sumOfH = parentFlowchart.sumOfHeightsOf(steps);
          h = h + sumOfH;
        } else {
          h += 20;
        }
        break;
      case STEP_MOVER:
//        bool isTappedMover = parentFlowchart.awaitingConfirmationTapForMove != null;
        return 40;
      default:
    }

    return h;
  }

  List<StepM> stepListOf(String theListType) {
    return childStepListShowingChanges(theListType);
  }

  double widthWithoutChildren() {
    double w;

    switch (shape) {
      case ASYNC_FUNC_CALL:
        w = parentFlowchart.MMM * 2 +
            parentFlowchart.PPP * 2 +
            calculatedTxtSize.width +
            parentFlowchart.PPP * 2;
        break;
      case AWAIT_FUNC_CALL:
        w = parentFlowchart.MMM * 2 +
            parentFlowchart.PPP * 2 +
            calculatedTxtSize.width +
            parentFlowchart.PPP * 2 +
            parentFlowchart.MMM * 2;
        break;
      case STEP_ADDER:
        w = 120.0;
        break;
      case STEP_MOVER:
        w = 60.0;
        break;
      case SWITCH:
        w = parentFlowchart.MMM * 2 +
            parentFlowchart.PPP +
            calculatedTxtSize.width +
            parentFlowchart.PPP;
        //if (w < 160) w = 160;
        break;
      case FUNC_CALL:
        w = parentFlowchart.MMM * 2 +
            parentFlowchart.PPP +
            calculatedTxtSize.width +
            parentFlowchart.PPP +
            parentFlowchart.MMM;
        break;
      case FUNC_RETURN:
        w = parentFlowchart.MMM * 2 +
            parentFlowchart.PPP +
            calculatedTxtSize.width +
            parentFlowchart.PPP +
            parentFlowchart.MMM * 2;
        break;
      case ACTION:
      case LOOP:
      case DECISION:
      default:
        //var tfw = txtWForScreen;
        w = parentFlowchart.MMM * 2 +
            parentFlowchart.PPP +
            calculatedTxtSize.width +
            parentFlowchart.PPP;
    }

//    fco.logger.i('--widthWithoutChildren = $w');

    if (iconIndex > 0) w += 24;

    return w;
  }

  double width() {
    List<double> wList = [widthWithoutChildren()];
    List<StepM> steps;
    switch (shape) {
      case DECISION:
        steps = stepListOf(TRUE_STEPS);
        if (steps.isNotEmpty) {
          wList.add(steps.map((s) => s.width()).reduce(max));
        }
        steps = stepListOf(FALSE_STEPS);
        if (steps.isNotEmpty) {
          wList.add(
              parentFlowchart.stepListOffsetLeft(FALSE_STEPS, theStep: this) +
                  steps.map((s) => s.width()).reduce(max));
        }
        break;
      case ASYNC_FUNC_CALL:
        steps = stepListOf(SUCCEED_STEPS);
        if (steps.isNotEmpty) {
          //steps.forEach((s)=>fco.logger.i('${s.shape} step width: ${s.width()/clipboard.zoom}'));
          wList.add(steps.map((s) => s.width()).reduce(max));
        }
        steps = stepListOf(FAIL_STEPS);
        if (steps.isNotEmpty) {
          //steps.forEach((s)=>fco.logger.i('${s.shape} step width: ${s.width()/clipboard.zoom}'));
          wList.add(
              parentFlowchart.stepListOffsetLeft(FAIL_STEPS, theStep: this) +
                  steps.map((s) => s.width()).reduce(max));
        }
        break;
      case FUNC_CALL:
        steps = stepListOf(FUNC_CALL_STEPS);
        if (steps.isNotEmpty) {
          wList.add(steps.map((s) => s.width()).reduce(max));
        }
        break;
      case LOOP:
        steps = stepListOf(LOOP_STEPS);
        if (steps.isNotEmpty) {
          wList.add(steps.map((s) => s.width()).reduce(max));
        }
        break;
      case SWITCH:
        List<double> txtWidths = [];
        txtWidths.add(calculatedTxtSize.width);
        txtWidths.addAll(caseNameWidths!.values);
        double widestTxt = txtWidths.map((w) => w).reduce(max);
        double widestCase = 0.0;
        for (var cn in caseNames) {
          double widestStep = parentFlowchart.widestStep(childStepList(cn));
          if (widestStep > widestCase) widestCase = widestStep;
        }
        wList.add(widestTxt + widestCase);
        break;
      case ACTION:
      default:
        break;
      //do nothing
    }

    double result = /*240*/ parentFlowchart.MMM * 2 +
        parentFlowchart.PPP * 2 +
        wList.reduce(max) +
        20 /*doh!*/;
    result = result > maxW ? maxW : result;
//    fco.logger.i('--width = $result ($shape)');

    return result;
  }

  double get maxW => parentFlowchart.screenPaperW - txtOffset.dx - 30;

  bool isFuncCallStep() =>
      shape == FUNC_CALL ||
      shape == ASYNC_FUNC_CALL ||
      shape == AWAIT_FUNC_CALL;

  static bool keysMatch(int? key1, int? key2) => key1 == key2;

  bool isLastStep() {
    if (getParentList().isEmpty) return true;
    if (parentFlowchart.showingChanges) {
      return id == getParentList()[getParentList().length - 1].id;
    } else {
      //allow for being followed by a trashed step
      for (int i = getParentList().length - 1; i > -1; i--) {
        StepM step = getParentList()[i];
        if (step.changeType != ChangeType.trashedStep) {
          return keysMatch(step.id, id);
        }
      }
      return false;
    }
  }

  bool isFirstStep() {
    if (getParentList().isEmpty) return true;
    if (parentFlowchart.showingChanges) {
      return id == getParentList()[0].id;
    } else {
      //allow for being preceded by a trashed step
      for (int i = 0; i < getParentList().length; i++) {
        StepM step = getParentList()[i];
        if (step.changeType != ChangeType.trashedStep) {
          return keysMatch(step.id, id);
        }
      }
      return false;
    }
  }

  int numSiblings() {
    List<StepM> plist = getParentList();
//    if (parentListType == SUCCEED_STEPS)
//      fco.logger.i('isLastStep = ${isLastStep()}');
    if (parentFlowchart.version > 0 && parentFlowchart.showingChanges) {
      return plist.length - 1;
    } else {
      return plist
              .where((step) => step.changeType != ChangeType.trashedStep)
              .toList()
              .length -
          1;
    }
  }

  Color get shapeLineColor => Colors.grey;

  Color get shapeFillColor => Colors.white;

  Color get shapeTxtColor => Colors.black;

  // is this step a descendent of any of theSteps
  bool isOrIsADescendentOf(List<int> theAncestorStepIds) {
    if (theAncestorStepIds.isEmpty) return false;
    for (int ancestorStepId in theAncestorStepIds) {
      StepM? step = this;
      while (step != null) {
        if (step.id == ancestorStepId) {
          return true;
        } else {
          step = step.parentStep;
        }
      }
    }
    return false;
  }

  // is this step a descendent of any of theSteps
  bool isOrIsADescendentOfIds(List<int> theAncestorStepIds) {
    if (theAncestorStepIds.isEmpty) return false;
    for (int ancestorStepId in theAncestorStepIds) {
      StepM? step = this;
      while (step != null) {
        if (step.id == ancestorStepId) {
          return true;
        } else {
          step = step.parentStep;
        }
      }
    }
    return false;
  }

  bool isTrashed() {
    return changeType == ChangeType.trashedStep;
  }

  /*
   * pass in []
   */
  static List<String> buildPath(List<String> pathList, StepM theStep) {
    pathList.insert(0, theStep.parentListType);
    pathList.insert(0, theStep.getParentList().indexOf(theStep).toString());
    if (theStep.parentStep != null) {
      buildPath(pathList, theStep.parentStep!);
    }
    return pathList;
  }

  bool wasMoved() {
    StepM? step = this;
    while (step != null) {
      if (step.changeType == ChangeType.movedStep) {
        return true;
      } else {
        step = step.parentStep;
      }
    }
    return false;
  }

  StepM? prevUntrashedStep(List<StepM> theList) {
    int index = theList.indexOf(this);
    for (int i = index; i > 0; i--) {
      StepM step = theList[i - 1];
      if (step.changeType != ChangeType.trashedStep) return step;
    }
    return null;
  }

  StepM? nextUntrashedStep(List<StepM> theList) {
    int index = theList.indexOf(this);
    for (int i = index; i < theList.length - 1; i++) {
      StepM step = theList[i + 1];
      if (step.changeType != ChangeType.trashedStep) return step;
    }
    return null;
  }

  bool prevStepIsSelected(List<StepM> theList, StepM theStep2BMoved) {
//    int index = theList.indexOf(theStep);
//    return index > 0 && theList[index - 1].isInASelection();
    StepM? prevStep = prevUntrashedStep(theList);
    return prevStep != null &&
        prevStep.isOrIsADescendentOf([theStep2BMoved.id]);
  }

  bool nextStepIsSelected(List<StepM> theList, StepM theStep2BMoved) {
//    int index = theList.indexOf(theStep);
//    return index < theList.length - 1 && theList[index + 1].isInASelection();
    StepM? nextStep = nextUntrashedStep(theList);
    return nextStep != null &&
        nextStep.isOrIsADescendentOf([theStep2BMoved.id]);
  }

  // double calcHeightDiffOfSelectedStep() {
  //   FlowchartM f = parentFlowchart;
  //   f.stepFound = false;
  //   FlowchartM tempFlowchartClone = FlowchartM.flowchartBV2M(f.toBV());
  //   double normalHeight = tempFlowchartClone.sumOfHeightsOf(tempFlowchartClone.steps);
  //   List<StepM> steps = addMoversBefore(tempFlowchartClone.steps, ROOT_STEPS, ROOT_STEP, this);
  //   double withSelectionHeight = tempFlowchartClone.sumOfHeightsOf(steps);
  //   return withSelectionHeight - normalHeight;
  // }

  // use this just to measure diff in scroll offsets when selecting a step
//   List<StepM> addMoversBefore(List<StepM> theList, String listType, StepM? parentStep, StepM theStep2BMoved) {
//     FlowchartM? f = theStep2BMoved.parentFlowchart;
//     List<StepM> newList = [];
//     bool parentStepInASelection = parentStep?.isOrIsADescendentOf([theStep2BMoved]) ?? false;
//
//     if (theList.isEmpty) {
//       if (!parentStepInASelection) {
//         if (!f.stepFound) {
//           newList.add(f.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//         }
//       }
//     } else {
// // add inserter if empty list
//       if (theList.isEmpty) {
//         if (!parentStepInASelection) {
//           if (!f.stepFound) {
//             newList.add(f.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//           }
//         }
//       } else {
//         if (!f.stepFound) {
//           for (var s in theList) {
//             if (s.id == theStep2BMoved.id) {
//               f.stepFound = true;
//             }
// // every step is preceded by an inserter
//             if (!f.isStep2BMoved(s) &&
//                 !parentStepInASelection &&
//                 !s.nextStepIsSelected(theList, theStep2BMoved) &&
//                 !s.prevStepIsSelected(theList, theStep2BMoved)) {
//               if (!f.stepFound) newList.add(f.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//             }
//             for (var childListType in s.childStepLists.keys) {
//               if (!f.stepFound) {
//                 List<StepM> childList = s.childStepLists[childListType]!;
//                 if (!f.stepFound && (s.id != theStep2BMoved.id)) {
//                   s.childStepLists[childListType] = addMoversBefore(childList, childListType, s, theStep2BMoved);
//                 }
//               }
//             }
//             newList.add(s);
//           }
//         }
// // append an inserter after the steps
//         StepM lastStep = theList.last;
//         if (lastStep.shape != FUNC_RETURN &&
//             !lastStep.isOrIsADescendentOf([theStep2BMoved]) &&
//             !lastStep.nextStepIsSelected(theList.toList(), theStep2BMoved)) {
//           if (!f.stepFound) {
//             newList.add(f.createInserterOrMoverStep(listType, parentStep, STEP_MOVER));
//           }
//         }
//       }
//     }
//
// // return the updated list - caller needs to cascade change up..
//     return newList;
//   }

  // recursive
  static Future<StepM> clone(
      StepM theStep, StepM? theParentStep, FlowchartM theFlowchart) async {
    await Future.delayed(const Duration(microseconds: 100), () {});
    int rnd = randomBetween(0, 99999999);
    int newId = DateTime.now().microsecondsSinceEpoch + rnd;
    StepM clonedStep = StepM(theFlowchart, newId);
    try {
      clonedStep
        ..iconIndex = theStep.iconIndex
        ..txt = theStep.txt
        ..txtSize = theStep._txtSize
        ..comment = theStep.comment
        ..shape = theStep.shape
        ..changeType = theStep.changeType
        ..flowchartLinkRef = theStep.flowchartLinkRef
        ..flowchartLinkVersion = theStep.flowchartLinkVersion
        ..parentListType = theStep.parentListType
        ..parentStep = theParentStep
        ..caseNameWidths = SplayTreeMap<String, double>.of({});
      if (theStep.caseNameWidths != null &&
          theStep.caseNameWidths!.isNotEmpty) {
        for (var key in theStep.caseNameWidths!.keys) {
          clonedStep.caseNameWidths![key] = theStep.caseNameWidths![key]!;
        }
      }
      clonedStep.childStepLists = SplayTreeMap<String, List<StepM>>.of({});
      if (theStep.shape == FUNC_CALL) {
        clonedStep.setChildStepList(FUNC_CALL_STEPS, []);
        for (StepM childStep in theStep.childStepList(FUNC_CALL_STEPS)) {
          clonedStep
              .childStepList(FUNC_CALL_STEPS)
              .add(await clone(childStep, clonedStep, theFlowchart));
        }
      } else if (theStep.shape == LOOP) {
        clonedStep.setChildStepList(LOOP_STEPS, []);
        for (StepM childStep in theStep.childStepList(LOOP_STEPS)) {
          clonedStep
              .childStepList(LOOP_STEPS)
              .add(await clone(childStep, clonedStep, theFlowchart));
        }
      } else if (theStep.shape == DECISION) {
        clonedStep.childStepLists[TRUE_STEPS] = [];
        for (StepM childStep in theStep.childStepList(TRUE_STEPS)) {
          clonedStep
              .childStepList(TRUE_STEPS)
              .add(await clone(childStep, clonedStep, theFlowchart));
        }
        clonedStep.childStepLists[FALSE_STEPS] = [];
        for (StepM childStep in theStep.childStepList(FALSE_STEPS)) {
          clonedStep
              .childStepList(FALSE_STEPS)
              .add(await clone(childStep, clonedStep, theFlowchart));
        }
      } else if (theStep.shape == ASYNC_FUNC_CALL) {
        clonedStep.childStepLists[SUCCEED_STEPS] = [];
        for (StepM childStep in theStep.childStepList(SUCCEED_STEPS)) {
          clonedStep
              .childStepList(SUCCEED_STEPS)
              .add(await clone(childStep, clonedStep, theFlowchart));
        }
        clonedStep.childStepLists[FAIL_STEPS] = [];
        for (StepM childStep in theStep.childStepList(FAIL_STEPS)) {
          clonedStep
              .childStepList(FAIL_STEPS)
              .add(await clone(childStep, clonedStep, theFlowchart));
        }
      } else if (theStep.shape == SWITCH) {
        theStep.childStepLists.keys
            .where((key) =>
                key != FUNC_CALL_STEPS &&
                key != LOOP_STEPS &&
                key != TRUE_STEPS &&
                key != FALSE_STEPS &&
                key != SUCCEED_STEPS &&
                key != FAIL_STEPS)
            .forEach((key) {
          clonedStep.childStepLists[key] = [];
          theStep.childStepList(key).forEach((childStep) async {
            clonedStep
                .childStepList(key)
                .add(await clone(childStep, clonedStep, theFlowchart));
          });
        });
      }
    } catch (e) {
      fco.logger.e(e.toString());
    }
    return clonedStep;
  }

  static void updateChildrensParentFlowchart(
      StepM theStep, FlowchartM theFlowchart) {
    //recursive
    void update(StepM s) {
      s.parentFlowchart = theFlowchart;
      s.childStepLists.forEach((String key, List<StepM>? theChildList) {
        theChildList?.forEach((child) => update(child));
      });
    }

    update(theStep);
  }

  TextStyle get textStyle => txt.isEmpty || txt == shape
      ? TextStyle(
          fontFamily: 'Roboto',
          fontSize: TTT + 2,
          color: shapeTxtColor,
          //backgroundColor: Color(parentFlowchart.colorValue),
          backgroundColor: shapeFillColor,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          //backgroundColor: Colors.yellow,
          decorationStyle: TextDecorationStyle.wavy,
        )
      : TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
          fontSize: TTT + 2,
          color: shapeTxtColor,
          wordSpacing: 1,
          backgroundColor: shapeFillColor,
        );
}

const String ROOT_STEPS = 'funcSteps';
const String FUNC_CALL_STEPS = 'funcCallSteps';
const String LOOP_STEPS = 'loopSteps';
const String TRUE_STEPS = 'trueSteps';
const String FALSE_STEPS = 'xfalseSteps';
const String SUCCEED_STEPS = 'succeedSteps';
const String FAIL_STEPS = 'xfailSteps';
const String NEW_CASE_STEPS = "XXXX";
const String DEFAULT_CASE = 'default:';

// shapes
const String ACTION = "action";
const String DECISION = "decision";
const String LOOP = "loop";
const String ASYNC_FUNC_CALL = "async function call";
const String AWAIT_FUNC_CALL = "await function call";
const String FUNC_CALL = "function call";
const String SWITCH = "switch";
const String CASE = "case";
//const String CASE = "case-to-be-renamed-by-user";
const String FUNC_BEGIN = "func(params)";
const String FUNC_END = "return";
const String FUNC_RETURN = "return result";
const String STEP_ADDER = "adder";
const String STEP_MOVER = "mover";
const String CASE_ADDER = "case-adder";

double initialStepWidth(String theShape) => _initalStepWidths[theShape]!;

const Map<String, double> _initalStepWidths = {
  ACTION: 41.0,
  FUNC_CALL: 81.0,
  ASYNC_FUNC_CALL: 123.0,
  AWAIT_FUNC_CALL: 140.0,
  LOOP: 29.0,
  DECISION: 56.0,
  SWITCH: 43.0,
  FUNC_RETURN: 82.0,
  FUNC_BEGIN: 60.0,
  FUNC_END: 50.0
};

// const stepIcons = <AdderMenuEnum, String>{
//   AdderMenuEnum.none: "",
//   AdderMenuEnum.video_clip: "images/screencast/video_clip.png",
//   AdderMenuEnum.audio_clip: "images/screencast/audio_clip.png",
//   AdderMenuEnum.text_clip: "images/screencast/text_clip.png",
//   AdderMenuEnum.lines_and_shapes_clip: "images/screencast/lines_and_shapes_clip.png",
//   AdderMenuEnum.freeze_frame_clip: "images/screencast/freeze_frame_clip.png",
//   AdderMenuEnum.video_action: "images/screencast/video_action.png",
//   AdderMenuEnum.audio_action: "images/screencast/audio_action.png",
//   AdderMenuEnum.video_motion_action: "images/screencast/video_motion_action.png",
//   AdderMenuEnum.screen_recording_action: "images/screencast/screen_recording_action.png",
//   AdderMenuEnum.callout_action: "images/screencast/callout_action.png",
//   AdderMenuEnum.touch_callout_action: "images/screencast/touch_callout_action.png",
// };

Map<String, ByteData> iconImages = {};

// // not async, so will load all in parallel ?
// void readAllIconImages() {
//   stepIcons.forEach((en, path) {
//     fco.logger.i(path);
//     Image image = Image(image: AssetImage(path));
//     rootBundle.load(path).then((ByteData imageData) => iconImages[en] = imageData);
//   });
// }

String initialTxt(StepTypeEnum? en) {
  switch (en) {
    case StepTypeEnum.Decision:
      return 'decision';
    case StepTypeEnum.Loop:
      return 'loop';
    case StepTypeEnum.Action:
      return 'action';
    case StepTypeEnum.Switch:
      return 'switch';
//      case CASE:
//        return 'default:';
    case StepTypeEnum.FuncReturn:
      return 'return';
    case StepTypeEnum.AsyncFuncCall:
      return 'async func call';
    case StepTypeEnum.AwaitFuncCall:
      return 'await func call';
    case StepTypeEnum.FuncCall:
      return 'func call';
    case StepTypeEnum.video_clip:
      return 'video clip';
    case StepTypeEnum.audio_clip:
      return 'audio clip';
    case StepTypeEnum.text_clip:
      return 'text clip';
    case StepTypeEnum.lines_and_shapes_clip:
      return 'annotations clip';
    case StepTypeEnum.freeze_frame_clip:
      return 'freeze frame clip';
    case StepTypeEnum.video_action:
      return 'video action';
    case StepTypeEnum.video_motion_action:
      return 'video motion action';
    case StepTypeEnum.callout_action:
      return 'callout action';
    case StepTypeEnum.screen_recording_action:
      return 'screen recording action';
    case StepTypeEnum.touch_callout_action:
      return 'touch callout action';
    case StepTypeEnum.audio_action:
      return 'audio action';
    default:
      return 'UNKNOWN TYPE!';
    //if (en != AdderMenuEnum.none) throw ('get txtOffset - unknown step type!');
  }
}

bool isAScreencastStep(StepTypeEnum en) => [
      StepTypeEnum.video_clip,
      StepTypeEnum.audio_clip,
      StepTypeEnum.lines_and_shapes_clip,
      StepTypeEnum.text_clip,
      StepTypeEnum.freeze_frame_clip,
      StepTypeEnum.audio_action,
      StepTypeEnum.screen_recording_action,
      StepTypeEnum.touch_callout_action,
      StepTypeEnum.video_motion_action,
      StepTypeEnum.callout_action,
      StepTypeEnum.video_action
    ].contains(en);

bool isAClip(int index) => [
      StepTypeEnum.video_clip.index,
      StepTypeEnum.audio_clip.index,
      StepTypeEnum.lines_and_shapes_clip.index,
      StepTypeEnum.text_clip.index,
      StepTypeEnum.freeze_frame_clip.index
    ].contains(index);

// List<String> stepIconNames = AdderMenuEnum.values.map((en) => en.toString()).toList();
//List<String> stepIconPaths = stepIcons.values.toList();

String iconName(StepTypeEnum en) =>
    en.toString().substring('AdderMenuEnum.'.length).replaceAll('_', ' ');

const double ICON_IMAGE_SIZE = 16.0;

Widget iconImage(String path) => SizedBox(
      width: ICON_IMAGE_SIZE,
      height: ICON_IMAGE_SIZE,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
          ),
        ),
      ),
    );
