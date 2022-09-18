import 'package:flutter/material.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/values_manger.dart';

import '../resources/app_colors.dart';

class CardWidget extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;
  final Widget? widget;

  const CardWidget({Key? key, required this.isLight, required this.isCollapsed, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    int ? isDay =cubit.currentWeatherModel!.currentWeather!.isDay;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s20),
        child: Container(
          padding: const EdgeInsets.all(AppSize.s20),
          width: double.infinity,
          color: isCollapsed ? isLight ? Colors.red : AppColors.darkGrey :
          isDay == 0? AppColors.nightCard  : AppColors.dayCard,
          child: widget ,

        ),
      ),
    );
  }
}
