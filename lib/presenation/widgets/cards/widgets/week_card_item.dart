import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/widgets/cards/widgets/rain_probability_item.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';
import '../../../resources/values_manger.dart';


class WeekCardItem extends StatelessWidget {
  const WeekCardItem({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
    required this.day,
    required this.rainProbability,
    required this.dayWeatherImg,
    required this.nightWeatherImg,
    required this.highTemp,
    required this.lowTemp,
    required this.index,
  }) : super(key: key);

  final bool isLight;
  final bool isCollapsed;
  final String day;
  final int rainProbability;
  final String dayWeatherImg;
  final String nightWeatherImg;
  final double highTemp;
  final double lowTemp;
  final int index;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit =AppCubit.get(context);
    var customTextStyle = AppColors.collapsedMediumTextStyle(context, isCollapsed);
    String day = cubit
        .currentWeatherModel!.forecastWeather!.forecast[index].date.toString();
    String dayFormmatted = DateFormat('EEEE').format(DateTime.parse(day.toString()));

    SizedBox _buildDayItem() => SizedBox(width: AppSize.s90, child: Text(dayFormmatted, style: customTextStyle));

    Row _buildDayNightWeatherItem() {
      return Row(
        children: [
          Image.asset(dayWeatherImg, height: AppSize.s18),
          const SizedBox(width: AppSize.s8),
          Image.asset(nightWeatherImg, height:  AppSize.s18),
        ],
      );
    }

    Row _buildHighLowTempItem() {
      return Row(
        children: [
          Text('$highTemp${AppStrings.symbolDegree}', style: customTextStyle),
          const SizedBox(width: AppSize.s15),
          Text('$lowTemp${AppStrings.symbolDegree}', style: customTextStyle)
        ],
      );
    }

    return Padding(
      padding:const EdgeInsets.only(bottom:AppSize.s10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildDayItem(),
          const Spacer(flex: AppSize.s2),
          RainProbabilityItem(rainProbability: rainProbability, isCollapsed: isCollapsed),
          const Spacer(),
          _buildDayNightWeatherItem(),
          const Spacer(),
          _buildHighLowTempItem(),
        ],
      ),
    );
  }
}
