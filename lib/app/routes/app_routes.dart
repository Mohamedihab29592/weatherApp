import 'package:flutter/material.dart';
import 'package:weather_app/presenation/screens/search.dart';

import '../../presenation/resources/app_strings.dart';
import '../../presenation/screens/home_page.dart';
import '../../presenation/screens/splash/splash_view.dart';

class Routes {
  static const String initialRoute = '/initialRoute';
  static const String searchRoute = '/search';
  static const String splashRoute = "/";

}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (context) =>const Search());

        default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>  const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
