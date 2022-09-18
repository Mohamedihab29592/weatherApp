import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/resources/app_strings.dart';
import 'package:weather_app/presenation/resources/assets_manager.dart';
import 'package:weather_app/presenation/widgets/appBar/widgets/text/datetime_now_text.dart';
import 'package:weather_app/presenation/widgets/appBar/widgets/text/high_low_text.dart';

import '../../../../app/themes/text_theme.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/values_manger.dart';

class CurrentTemperatureWidget extends StatefulWidget {
  final bool isLight;
  final bool isCollapsed;
  const CurrentTemperatureWidget({Key? key, required this.isLight, required this.isCollapsed}) : super(key: key);

  @override
  State<CurrentTemperatureWidget> createState() => _CurrentTemperatureWidgetState();
}

class _CurrentTemperatureWidgetState extends State<CurrentTemperatureWidget> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Row(
      children: [
        Text(
          '${cubit.currentWeatherModel!.currentWeather!.tempC}${AppStrings.symbolDegree}',
          style: widget.isCollapsed
              ? AppTextThemes.textTheme(isLight: widget.isLight).bodyLarge
              : AppTextThemes.textTheme(isLight: widget.isLight).bodyLarge!.copyWith(color:AppColors.white),
        ),
        const Spacer(flex: AppSize.s1),
        widget.isCollapsed
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HighLowText(isCollapsed: widget.isCollapsed),
          DateTimeNowText(isCollapsed: widget.isCollapsed),
        ])
            : Container(),
        const Spacer(flex: AppSize.s3),
        if(cubit.currentWeatherModel!.currentWeather!.isDay ==1)
        Lottie.asset(JsonAssets.sunLJson, height: AppSize.s80),
        if(cubit.currentWeatherModel!.currentWeather!.isDay ==0)
          Lottie.asset(JsonAssets.moonJson, height: AppSize.s80)




      ],
    );
  }
}
