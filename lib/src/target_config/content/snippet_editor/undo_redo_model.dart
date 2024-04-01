// import 'dart:collection';
//
// import 'package:flutter_content/flutter_content.dart';
//
//
// class ModelUR {
//   Queue<JSON> undoQ = Queue<JSON>();
//   Queue<JSON> redoQ = Queue<JSON>();
//
//   ModelUR();
//
//   void clear() {
//     undoQ.clear();
//     redoQ.clear();
//   }
//
//   void createUndo(CAPIModel model) {
//     undoQ.addFirst(model.toJson());
//     redoQ.clear();
//   }
//
//   CAPIModel? undo(CAPIModel current, {bool skipRedo = false}) {
//     if (undoQ.isNotEmpty) {
//       if (!skipRedo) {
//         redoQ.addFirst(current.toJson());
//       }
//       JSON restoredJSON = undoQ.removeFirst();
//       CAPIModel restoredModel = CAPIModel.fromJson(restoredJSON);
//       return restoredModel;
//     }
//     return null;
//   }
//
//   CAPIModel? redo(CAPIModel current, {bool skipRedo = false}) {
//     if (undoQ.isNotEmpty) {
//       if (!skipRedo) {
//         redoQ.addFirst(current.toJson());
//       }
//       JSON restoredJSON = undoQ.removeFirst();
//       CAPIModel restoredModel = CAPIModel.fromJson(restoredJSON);
//       return restoredModel;
//     }
//     return null;
//   }
// }
