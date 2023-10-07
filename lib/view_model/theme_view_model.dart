import 'package:flutter/material.dart';
import 'package:snap_textify/model/theme_model.dart';
import 'package:snap_textify/utils/theme_preference.dart';

class ThemeViewModel with ChangeNotifier {
  ThemeData _themeData = ThemeModel().lightTheme;

  ThemeData get themeData => _themeData;

  ThemeViewModel() {
    loadThemeMode();
  }

  void toggleTheme() async {
    _themeData =
    _themeData == ThemeModel().lightTheme ? ThemeModel().darkTheme : ThemeModel().lightTheme;
    notifyListeners();
    await ThemePreferences.setThemeMode(_themeData == ThemeModel().darkTheme);
  }

  Future<void> loadThemeMode() async {
    final isDarkMode = await ThemePreferences.getThemeMode();
    _themeData = isDarkMode ? ThemeModel().darkTheme : ThemeModel().lightTheme;
    notifyListeners();
  }

  void setSwitchState(bool isDarkMode) {
    _themeData = isDarkMode ? ThemeModel().darkTheme : ThemeModel().lightTheme;
    notifyListeners();
  }
}
