import 'package:flutter/material.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';
import 'package:weather_app/presenation/resources/values_manger.dart';

import '../../resources/app_colors.dart';
import '../cardWidget.dart';

class TodayCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const TodayCard({Key? key, required this.isLight, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyMediumTextStyle = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Column(
        children: [
          Text(AppStrings.todayTemp, style: bodyMediumTextStyle),
          const SizedBox(height: AppSize.s4),
          Text(AppStrings.todayTemp,
              style: bodyMediumTextStyle),
        ],
      ),
    );
  }
}
