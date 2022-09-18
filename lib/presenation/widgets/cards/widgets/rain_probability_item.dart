import 'package:flutter/material.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/values_manger.dart';

class RainProbabilityItem extends StatelessWidget {
  const RainProbabilityItem(
      {Key? key, required this.rainProbability, required this.isCollapsed, })
      : super(key: key);

  final bool isCollapsed;
  final int rainProbability;

  @override
  Widget build(BuildContext context) {

     var customTextStyle =  AppColors.collapsedMediumTextStyle(context, isCollapsed);

    var customIconColor = AppColors.collapsedGreyCyanIconColor(context, isCollapsed);

    return Row(
      children: [
        Icon(Icons.water_drop, color: customIconColor, size: AppSize.s13),
        const SizedBox(width: AppSize.s3_0),
        Text('$rainProbability${AppStrings.percent}', style: customTextStyle)
      ],
    );
  }
}
