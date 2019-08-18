import 'package:flutter/material.dart';

class AppThemeState with ChangeNotifier {
  Color _color;
  // AppThemeState(this._color);
  Color get color => _color;

  setColor(Color color) {
    _color = color;
    print(_color);
    notifyListeners();
  }
}
