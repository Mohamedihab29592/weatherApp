import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';
import 'package:weather_app/presenation/resources/assets_manager.dart';
import 'package:weather_app/presenation/resources/values_manger.dart';

import '../resources/app_colors.dart';
import 'cardWidget.dart';
import 'cards/widgets/rain_probability_item.dart';

class TodayTempList extends StatefulWidget {
  final bool isLight;
  final bool isCollapsed;

  const TodayTempList({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  State<TodayTempList> createState() => _TodayTempListState();
}

class _TodayTempListState extends State<TodayTempList> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    Widget _buildListItem(int index) {
      String time = cubit
          .currentWeatherModel!.forecastWeather!.forecast[0].hours![index].time
          .toString();

      String hours = DateFormat('h a').format(DateTime.parse(time.toString()));
      return Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          children: [
            Text(
              hours,
              style: AppColors.collapsedMediumTextStyle(
                  context, widget.isCollapsed),
            ),
            SizedBox(
              height: AppSize.s40,
              child: Row(
                children: [
                  if (cubit.currentWeatherModel!.forecastWeather!.forecast[0]
                          .hours![index].icon ==
                      "//cdn.weatherapi.com/weather/64x64/night/113.png")
                    Image.asset(
                      ImageAssets.moon,
                      height: AppSize.s20,
                    )
                  else
                    Image.network(
                      'https:${cubit.currentWeatherModel!.forecastWeather!.forecast[0].hours![index].icon}',
                    ),
                ],
              ),
            ),
            Text(
              "${cubit.currentWeatherModel!.forecastWeather!.forecast[0].hours![index].tempC}${AppStrings.symbolDegree}",
              style: const TextStyle(color: AppColors.white),
            ),
            const SizedBox(height: AppSize.s10),
            RainProbabilityItem(
              rainProbability: cubit.currentWeatherModel!.forecastWeather!
                  .forecast[0].hours![index].hourlyWillItRain!,
              isCollapsed: widget.isCollapsed,
            ),
          ],
        ),
      );
    }

    return CardWidget(
      isLight: widget.isLight,
      isCollapsed: widget.isCollapsed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: AppSize.s120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => _buildListItem(index),
                  itemCount: cubit.currentWeatherModel!.forecastWeather!
                      .forecast[0].hours!.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
