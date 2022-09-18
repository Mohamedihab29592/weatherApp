import 'package:flutter/material.dart';
import 'package:weather_app/app/themes/text_theme.dart';
import 'package:weather_app/app/themes/widgets/app_bar_theme.dart';
import 'package:weather_app/app/themes/widgets/icon_theme.dart';

import '../../presenation/resources/app_colors.dart';

class AppThemes {
  static ThemeData appTheme({required bool isLight}) {
    return ThemeData(
      brightness: isLight ? Brightness.light : Brightness.dark,
      appBarTheme: AppBarThemes.appBarTheme(isLight: isLight),
      textTheme: AppTextThemes.textTheme(isLight: isLight),
      iconTheme: AppIconThemes.iconTheme(isLight: isLight),
    );
  }
}
