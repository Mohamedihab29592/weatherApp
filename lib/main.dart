import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presenation/cubit/app_cubit.dart';
import 'bloc_observer.dart';

import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';
import 'data/network/dio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit()..getCurrentWeather(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: "WeatherApp",
        themeMode: ThemeMode.system,
        theme: AppThemes.appTheme(isLight: true),
        darkTheme: AppThemes.appTheme(isLight: false),
        initialRoute: Routes.initialRoute,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

