import 'package:flutter/material.dart';

class AppColors {
  /// scaffold background colors
  static const Color mainColor =  Color(0xFF7CB2F2);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color blue = Colors.blue;

  /// card colors
  static Color dividerLightGrey = Colors.grey.shade300;
  static Color dividerDarkGrey = Colors.grey.shade600;
  static Color darkGrey = Colors.grey.shade900;
  static Color lightGey = Colors.grey;

  /// time of day background colors
  static const Color day = Color(0xFF7CB2F2);
  static const Color dayCard = Color(0xFF91c1f2);
  static const Color night = Color(0xFF3D4472);
  static const Color nightCard = Color(0xFF626689);

  /// collapsing appBar colors
  static TextStyle collapsedSmallTextStyle(BuildContext context, bool isCollapsed) {
    return TextStyle(
        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
        color: !isCollapsed ? Colors.white : Theme.of(context).textTheme.bodySmall?.color);
  }

  static TextStyle collapsedMediumTextStyle(BuildContext context, bool isCollapsed) {
    return TextStyle(
        color: !isCollapsed ? Colors.white : Theme.of(context).textTheme.bodyMedium?.color);
  }

  static Color collapsedBlackWhiteIconColor(BuildContext context, bool isCollapsed) {
    return !isCollapsed ? Colors.white : Theme.of(context).iconTheme.color!;
  }

  static Color collapsedGreyCyanIconColor(BuildContext context, bool isCollapsed) {
    return !isCollapsed ? Colors.white : Colors.cyan.shade200;
  }

  ///Drawer colors
  static const Color backGroundDrawer =  Color(0xFF313946);
  static const Color groundDrawer =  Color(0xFF4f5762);
}
