import 'package:flutter/material.dart';

class SignUpDetails014Provider extends ChangeNotifier {
  bool _selected = false;
  bool _enabled = true;

  bool get selected => _selected;

  void toggleSelection() {
    _enabled = !_enabled;
    _selected = !_selected;
    notifyListeners();
  }
}
