import 'package:flutter/material.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/assets_manager.dart';
import 'package:weather_app/presenation/widgets/cards/widgets/week_card_item.dart';

import '../cardWidget.dart';

class WeekCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;
  final String dayWeatherImg;
  final String nightWeatherImg;

  const WeekCard({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
    this.dayWeatherImg = ImageAssets.sun,
    this.nightWeatherImg = ImageAssets.moon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit =AppCubit.get(context);
    WeekCardItem _buildWeekCardItem(int index) {
      return WeekCardItem(
        index: index,
        isLight: isLight,
        isCollapsed: isCollapsed,
        day: cubit.currentWeatherModel!.forecastWeather!.forecast[index].date!,
        rainProbability: cubit.currentWeatherModel!.forecastWeather!.forecast[index].day!.dailyWillItRain!,
        dayWeatherImg: dayWeatherImg,
        nightWeatherImg: nightWeatherImg,
        highTemp: cubit.currentWeatherModel!.forecastWeather!.forecast[index].day!.maxTempC!,
        lowTemp: cubit.currentWeatherModel!.forecastWeather!.forecast[index].day!.minTempC!,
      );
    }

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => _buildWeekCardItem(index),
            itemCount:cubit.currentWeatherModel!.forecastWeather!.forecast.length,
          ),

        ],
      ),
    );
  }
}
