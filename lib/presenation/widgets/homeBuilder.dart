import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'package:weather_app/presenation/cubit/app_state.dart';
import 'package:weather_app/presenation/resources/media_query_values.dart';
import 'package:weather_app/presenation/widgets/todayTempList.dart';


import '../../app/routes/app_routes.dart';
import '../resources/app_colors.dart';
import '../resources/values_manger.dart';
import 'appBar/appWeather.dart';

import 'cards/info_card/info_card.dart';
import 'cards/sunset_sunrise_card.dart';
import 'cards/today_card.dart';
import 'cards/week_card.dart';
import 'myDrawer.dart';

class HomeBuilder extends StatefulWidget {
  const HomeBuilder({Key? key}) : super(key: key);

  @override
  State<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  late ScrollController _scrollController;
  bool _appBarCollapsed = false;




  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
    ..addListener(() {
      if (isCollapsed() && !_appBarCollapsed) {
        setState(() => _appBarCollapsed = true);
      } else if (!isCollapsed() && _appBarCollapsed) {
        setState(() => _appBarCollapsed = false);
      }
    });


  }

  bool isCollapsed() =>
      _scrollController.hasClients && _scrollController.offset > (ScrollValue.s230 - kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isLight = context.brightness == Brightness.light;
    AppCubit cubit = AppCubit.get(context);
    int ? isDay = cubit.currentWeatherModel!.currentWeather!.isDay;

     List<Widget> widgetList =[
Padding(
  padding: const EdgeInsets.all(AppPadding.p20),
  child:   Column(
    children: [
      TodayTempList(isLight: isLight, isCollapsed:_appBarCollapsed,),
      TodayCard(isLight: isLight, isCollapsed: _appBarCollapsed),
      WeekCard(isLight: isLight, isCollapsed: _appBarCollapsed),
      SunsetSunriseCard(isLight: isLight, isCollapsed: _appBarCollapsed),
      InfoCard(isLight: isLight, isCollapsed: _appBarCollapsed),

    ],


  ),
),
     ];
   return  Scaffold(
     backgroundColor: _appBarCollapsed
         ? isLight
         ? AppColors.nightCard
         : AppColors.black :
     isDay == 0 ? AppColors.night
         : AppColors.day,
     body: CustomScrollView(
       controller: _scrollController,
       slivers: [
         WeatherAppBar(isCollapsed: _appBarCollapsed, isLight: isLight),
         SliverList(delegate: SliverChildListDelegate(widgetList))
       ],
       scrollBehavior:
       // ignore: deprecated_member_use
       const ScrollBehavior(androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
     ),
     drawer: const MyDrawer(),
   );




  }
}
