import 'package:flutter/material.dart';

class AppTextThemes {
  static TextTheme textTheme({required bool isLight}) {
    return TextTheme(
      titleMedium:
          TextStyle(color: isLight ? Colors.black : Colors.white, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: isLight ? Colors.black : Colors.white, fontSize:12),
      bodyLarge: TextStyle(
          color: isLight ? Colors.black : Colors.white, fontSize: 60, fontWeight: FontWeight.w100),
      bodyMedium:
          TextStyle(color: isLight ? Colors.black : Colors.white, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: isLight ? Colors.black : Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
    );
  }
}
