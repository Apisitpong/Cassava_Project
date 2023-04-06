import 'package:cassava_proj/services/dark_theme_prefs.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }
}