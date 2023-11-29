import 'package:flutter/material.dart';
import 'package:weather_app_with_mvvm/app/data/remote/data_sources/services/splash_screen/splash_screen_service.dart';
import 'package:weather_app_with_mvvm/core/constants/colors.dart';
import 'package:weather_app_with_mvvm/core/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreenServices.getApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(Assets.imagesNightStatRain),
        ),
      ),
    );
  }
}
