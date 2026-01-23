import 'package:flutter/material.dart';

class FocusChangeNotifier with ChangeNotifier {
  FocusNode? _focusNode;

  FocusNode? get value => _focusNode;

  set value(FocusNode? val) {
    _focusNode = val;
    notifyListeners();
  }
}
