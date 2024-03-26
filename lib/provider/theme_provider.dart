import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
