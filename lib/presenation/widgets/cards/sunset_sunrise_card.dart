import 'package:flutter/material.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/assets_manager.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';
import '../../resources/values_manger.dart';
import '../cardWidget.dart';

class SunsetSunriseCard extends StatefulWidget {
  final bool isLight;
  final bool isCollapsed;

  const SunsetSunriseCard({Key? key, required this.isLight, required this.isCollapsed})
      : super(key: key);

  @override
  State<SunsetSunriseCard> createState() => _SunsetSunriseCardState();
}

class _SunsetSunriseCardState extends State<SunsetSunriseCard> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    var textStyle = AppColors.collapsedMediumTextStyle(context, widget.isCollapsed);

    return CardWidget(
      isLight: widget.isLight,
      isCollapsed: widget.isCollapsed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(AppStrings.sunrise, style: textStyle),
              Text(cubit.currentWeatherModel!.forecastWeather!.forecast[0].astro!.sunrise.toString(), style: textStyle),
              Image.asset(ImageAssets.sunrise, height: AppSize.s100)
            ],
          ),
          Column(
            children: [
              Text(AppStrings.sunset, style: textStyle),
              Text(cubit.currentWeatherModel!.forecastWeather!.forecast[0].astro!.sunset.toString(), style: textStyle),
              Image.asset(ImageAssets.sunset, height: AppSize.s100)
            ],
          ),
        ],
      ),
    );
  }
}
