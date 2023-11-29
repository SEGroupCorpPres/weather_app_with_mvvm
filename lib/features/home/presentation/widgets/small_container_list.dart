import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/core/generated/assets.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/days_controller.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/small_container.dart';

class SmallContainerList extends StatelessWidget {
  SmallContainerList({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => SmallContainer(
            text: '${controller.day.value.precipprob.toInt().toString()}%',
            image: Assets.imagesHeavyRain,
            color: Colors.white38,
            textColor: Colors.white,
          ),
        ),
        Obx(
          () => SmallContainer(
            text: '${controller.day.value.windspeed.toInt().toString()}km/h',
            image: Assets.imagesWind,
            color: Colors.white38,
            textColor: Colors.white,
          ),
        ),
        Obx(
          () => SmallContainer(
            text: '${controller.day.value.humidity.toInt().toString()}%',
            image: Assets.imagesSun,
            color: Colors.white38,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
