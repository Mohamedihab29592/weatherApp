import 'package:flutter/material.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/values_manger.dart';
import 'package:weather_app/presenation/widgets/cards/info_card/widgets/info_widget.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';
import '../../../resources/assets_manager.dart';
import '../../cardWidget.dart';

class InfoCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const InfoCard({Key? key, required this.isLight, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InfoWidget(
            isLight: isLight,
            isCollapsed: isCollapsed,
            image: ImageAssets.sun,
            title: AppStrings.uvIndex,
            subtitle: "${cubit.currentWeatherModel!.currentWeather!.uv}",

          ),
          _buildDivider(),
          InfoWidget(
            isLight: isLight,
            isCollapsed: isCollapsed,
            image: ImageAssets.wind,
            title: AppStrings.wind,
            subtitle:"${cubit.currentWeatherModel!.currentWeather!.uv} ${AppStrings.speed}"
          ),
          _buildDivider(),
          InfoWidget(
            isLight: isLight,
            isCollapsed: isCollapsed,
            image: ImageAssets.humidity,
            title: AppStrings.humidity,
            subtitle: "${cubit.currentWeatherModel!.currentWeather!.humidity}${AppStrings.percent}",
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
        height: AppSize.s100,
        width: isLight ? AppSize.s0_5 : AppSize.s0_25,
        color: isLight ? AppColors.dividerLightGrey : AppColors.dividerDarkGrey);
  }
}
