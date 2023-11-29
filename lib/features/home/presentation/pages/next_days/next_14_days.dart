import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/core/constants/colors.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/days_controller.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/bottom_list.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/center_card.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/days_list.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/next_day_custom_app_bar.dart';

class NextDays extends StatelessWidget {
  NextDays({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return DecoratedBox(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const NextDayCustomAppBar(),
                    const SizedBox(height: 20),
                    DaysList(),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height / 1.9,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        topLeft: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
                BottomList(),
                Hero(
                  tag: 'Tag',
                  child: Material(
                    color: Colors.transparent,
                    child: CenterCard(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
