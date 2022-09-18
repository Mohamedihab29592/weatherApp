import 'package:flutter/material.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';

import '../../../../cubit/app_cubit.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/values_manger.dart';

class HighLowText extends StatelessWidget {
  const HighLowText({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return Text(
      '${cubit.currentWeatherModel!.forecastWeather!.forecast[0].day!.maxTempC}${AppStrings.symbolDegree} / ${cubit.currentWeatherModel!.forecastWeather!.forecast[0].day!.minTempC}${AppStrings.symbolDegree}',
      style: !isCollapsed
          ? Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white)
          : Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: AppSize.s12 * AppSize.s1_2),
    );
  }
}
