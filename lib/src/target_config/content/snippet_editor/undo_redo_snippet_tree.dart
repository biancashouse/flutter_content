// import 'dart:collection';
//
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/snippet_state.dart';
//
// class SnippetTreeUR {
//   final Queue<SnippetState> undoQ = Queue<SnippetState>();
//   final Queue<SnippetState> redoQ = Queue<SnippetState>();
//
//   SnippetTreeUR();
//
//   void clear() {
//     undoQ.clear();
//     redoQ.clear();
//   }
//
//   void createUndo(SnippetState snippetState) {
//     SnippetTreeController clonedTreeC = snippetState.treeC.clone();
//     undoQ.addFirst(snippetState.copyWith(treeC: clonedTreeC));
//     redoQ.clear();
//   }
//
//   SnippetState? undo(SnippetState snippetState, {bool skipRedo = false}) {
//     if (undoQ.isNotEmpty) {
//       if (!skipRedo) {
//         redoQ.addFirst(snippetState);
//       }
//       SnippetState result = undoQ.removeFirst();
//       return result;
//     }
//     return null;
//   }
//
//   SnippetState? redo(SnippetState snippetState, {bool skipUndo = false}) {
//     if (redoQ.isNotEmpty) {
//       if (!skipUndo) {
//         undoQ.addFirst(snippetState);
//       }
//       return redoQ.removeFirst();
//     }
//     return null;
//   }
// }
