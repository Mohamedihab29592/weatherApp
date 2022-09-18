import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presenation/cubit/app_state.dart';
import 'package:weather_app/presenation/resources/values_manger.dart';


import '../../../app/themes/system_overlay_style.dart';
import '../../cubit/app_cubit.dart';
import '../../resources/app_colors.dart';
import 'widgets/text/locationText.dart';
import 'mainWidget.dart';

// ignore: must_be_immutable
class WeatherAppBar extends StatelessWidget {
  bool isCollapsed;
  bool isLight;

  WeatherAppBar({super.key, required this.isCollapsed, required this.isLight});
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    int? isDay =cubit.currentWeatherModel!.currentWeather!.isDay;

    return BlocBuilder<AppCubit,AppState>(
      builder: (context,state) {
        return  SliverAppBar(
          collapsedHeight: AppSize.s200,
          expandedHeight:AppSize.s400,
          pinned: true,
          systemOverlayStyle: _setSystemOverlayStyle(),
          backgroundColor: _setBackgroundColor(),
          title: _buildTitleWidget(),
          flexibleSpace: _buildFlexibleSpaceBar(isDay!),
          iconTheme: _setIconTheme(context),
        );
      },
    );
  }

  SystemUiOverlayStyle _setSystemOverlayStyle() {
    return isCollapsed
        ? isLight
        ? AppSystemUiOverlayStyle.light
        : AppSystemUiOverlayStyle.dark
        : AppSystemUiOverlayStyle.dark;
  }

  Color _setBackgroundColor() {
    return AppColors.black;
  }

  LocationText? _buildTitleWidget() {
    return isCollapsed ? LocationText(isCollapsed: isCollapsed) : null;
  }

  FlexibleSpaceBar _buildFlexibleSpaceBar(int isDay) {
    return FlexibleSpaceBar(

      expandedTitleScale: AppSize.s1_2,
      collapseMode: CollapseMode.none,
      titlePadding: EdgeInsets.only(
          top: isCollapsed ? AppSize.s0 : AppSize.s50, right: AppSize.s20, left: AppSize.s20),
      title: MainWidget(isLight: isLight, isCollapsed: isCollapsed),


      background: isDay ==0 ? Container(color:AppColors.night ) :Container(color:AppColors.day ),
    );
  }


  IconThemeData _setIconTheme(BuildContext context) {
    return !isCollapsed
        ? Theme.of(context).iconTheme.copyWith(color: Colors.white)
        : Theme.of(context).iconTheme;
  }
}
