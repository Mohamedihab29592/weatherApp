import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presenation/screens/splash/splash_view.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../widgets/homeBuilder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is GetCurrentWeatherSuccess|| state is GetOtherWeatherSuccess,
            builder: (context) => const HomeBuilder(),
            fallback: (context) {
              return const Center(child: SplashView());
            });
      },
    );
  }
}
