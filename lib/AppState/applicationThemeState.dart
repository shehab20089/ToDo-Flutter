import 'package:flutter/material.dart';

class AppThemeState with ChangeNotifier {
  Color _color;
  double _value;

  // AppThemeState(this._color);
  Color get color => _color;
  double get value => _value;
  setColor(Color color) {
    _color = color;
    print(_color);
    notifyListeners();
  }

  setValue(double value) {
    _value = value;

    notifyListeners();
  }
}
