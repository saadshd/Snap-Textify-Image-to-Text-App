import 'package:flutter/material.dart';
import 'package:snap_textify/res/app_color.dart';

class ThemeModel {
  ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      brightness: Brightness.light
    ),
    useMaterial3: true,
  );

  ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.primaryColor,
        brightness: Brightness.dark
    ),
    useMaterial3: true,
  );
}