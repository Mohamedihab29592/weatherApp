import 'package:flutter/material.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';

import '../../../../resources/app_colors.dart';

class FeelsLikeText extends StatelessWidget {
  const FeelsLikeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit =AppCubit.get(context);
    return Text(
      ' ${AppStrings.feelsLike} ${cubit.currentWeatherModel!.currentWeather!.feelsLike}${AppStrings.symbolDegree}',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
    );
  }
}
