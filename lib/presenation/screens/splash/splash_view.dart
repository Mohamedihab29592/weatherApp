import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app/routes/app_routes.dart';
import '../../resources/assets_manager.dart';
import '../../resources/constats_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.initialRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(flex: 2, child: Lottie.asset(JsonAssets.splashLogo)),
          Expanded(flex: 1, child: Lottie.asset(JsonAssets.stringLoading)),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
