import 'dart:collection';

class SnippetUndoRedoStack {
  final Queue<String> _undoQ = Queue<String>();
  final Queue<String> _redoQ = Queue<String>();

  bool get canUndo => _undoQ.isNotEmpty;
  bool get canRedo => _redoQ.isNotEmpty;
  int get undoCount => _undoQ.length;
  int get redoCount => _redoQ.length;

  void clear() {
    _undoQ.clear();
    _redoQ.clear();
  }

  /// Call before every mutating tree operation.
  /// Pushes [json] onto the undo stack and clears the redo stack.
  void pushForUndo(String json) {
    _undoQ.addFirst(json);
    _redoQ.clear();
  }

  /// Returns the JSON to restore, or null if nothing to undo.
  /// [currentJson] is pushed onto the redo stack so it can be re-applied.
  String? undo(String currentJson) {
    if (_undoQ.isEmpty) return null;
    _redoQ.addFirst(currentJson);
    return _undoQ.removeFirst();
  }

  /// Returns the JSON to restore, or null if nothing to redo.
  /// [currentJson] is pushed back onto the undo stack.
  String? redo(String currentJson) {
    if (_redoQ.isEmpty) return null;
    _undoQ.addFirst(currentJson);
    return _redoQ.removeFirst();
  }
}
