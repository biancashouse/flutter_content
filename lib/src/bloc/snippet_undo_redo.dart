// import 'dart:collection';
//
// import 'package:flutter_content/flutter_content.dart';
//
// class SnippetUndoRedoStack {
//   final CAPIBloC capiBloc;
//
//   Queue<EncodedSnippetJson> undoQ = Queue<EncodedSnippetJson>();
//   Queue<EncodedSnippetJson> redoQ = Queue<EncodedSnippetJson>();
//
//   SnippetUndoRedoStack(this.capiBloc);
//
//   void clear() {
//     undoQ.clear();
//     redoQ.clear();
//   }
//
//   void _pushUndo(EncodedSnippetJson theESJ) {
//     // fco.logi('num steps: ${theF.steps.length}');
//     undoQ.addFirst(theESJ);
//   }
//
//   void _pushRedo(EncodedSnippetJson theESJ) {
//     redoQ.addFirst(theESJ);
//   }
//
//   EncodedSnippetJson? _popUndo() {
//     if (undoQ.isNotEmpty) {
//       EncodedSnippetJson poppedF = undoQ.removeFirst();
//       // fco.logi('num steps: ${poppedF.steps.length}');
//       return poppedF;
//     } else {
//       return null;
//     }
//   }
//
//   EncodedSnippetJson? _popRedo() {
//     if (redoQ.isNotEmpty) {
//       return redoQ.removeFirst();
//     } else {
//       return null;
//     }
//   }
//
//   void createUndo({required SnippetRootNode? snippet}) {
//     if (snippet == null) return;
//     // _pushUndo(pushClone ? snippet.cleanClone() : snippet);
//     // _pushUndo(snippet.toJson());
//     // redoQ.clear();
//     // fco.logi('undoQ: ${undoQs.length}');
//     // fco.logi('redoQ: ${redoQs.length}');
//     fco.cacheAndSaveANewSnippetVersion(
//       snippetName: snippet.name,
//       rootNode: snippet,
//     );
//   }
//
//   // // for the case where created an undo, but user clicked cancel x
//   // void removeLastUndo() {
//   //   _popUndo();
//   // }
//
//   SnippetRootNode? undo({bool skipRedo = false}) {
//     EncodedSnippetJson? restored;
//     if (undoQ.isNotEmpty) {
//       EncodedSnippetJson? esj = capiBloc.state.snippetBeingEdited?.rootNode.toJson();
//       if (esj != null && !skipRedo) _pushRedo(esj);
//       restored = _popUndo();
//       // fco.logi('num steps after undo: ${App.userBloc.state.clipboard(id).steps.length}');
//       // fco.logi('undoQ: ${undoQs.length}');
//       // fco.logi('redoQ: ${redoQs.length}');
//       return restored != null ? SnippetRootNodeMapper.fromJson(restored) : null;
//     }
//     return null;
//   }
//
//   // void removeLastUndoQuietly() async {
//   //   if (undoQs.isNotEmpty)
//   //     _popUndo();
//   // }
//
//   SnippetRootNode? redo() {
//     EncodedSnippetJson? redid;
//     if (redoQ.isNotEmpty) {
//       EncodedSnippetJson? esj = capiBloc.state.snippetBeingEdited?.rootNode.toJson();
//       if (esj != null) _pushUndo(esj);
//       redid = _popRedo();
//       // fco.logi('undoQ: ${undoQs.length}');
//       // fco.logi('redoQ: ${redoQs.length}');
//       return redid != null ? SnippetRootNodeMapper.fromJson(redid) : null;
//     }
//     return null;
//   }
// }
