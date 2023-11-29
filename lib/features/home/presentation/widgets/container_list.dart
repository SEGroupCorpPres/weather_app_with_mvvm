import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/core/generated/assets.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/widgets/small_container.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () {
              return SmallContainer(
                text: '${controller.getCloudOver()}%',
                image: Assets.imagesHeavyRain,
                color: Colors.black54,
                textColor: Colors.white,
              );
            },
          ),
          Obx(
                () {
              return SmallContainer(
                text: '${controller.getWindSpeed()}km/h',
                image: Assets.imagesWind,
                color: Colors.black54,
                textColor: Colors.white,
              );
            },
          ),
          Obx(
                () {
              return SmallContainer(
                text: '${controller.getHumidity()}%',
                image: Assets.imagesSun,
                color: Colors.black54,
                textColor: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }
}
