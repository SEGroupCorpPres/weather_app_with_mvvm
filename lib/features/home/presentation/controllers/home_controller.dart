import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/app/data/remote/models/hour_model.dart';
import 'package:weather_app_with_mvvm/app/data/remote/models/weather_model.dart';
import 'package:weather_app_with_mvvm/app/data/repositories/home_repository.dart';
import 'package:weather_app_with_mvvm/core/generated/assets.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/pages/home_screen.dart';
import 'package:weather_app_with_mvvm/utilities/utilities.dart';

class HomeController extends GetxController {
  Rx<WeatherModel?> model = Rx<WeatherModel?>(null);
  Rx<HoursModel?> hours = Rx<HoursModel?>(null);
  RxInt currentIndex = 0.obs;
  RxBool animator = false.obs;

  int getCurrentIndex() => currentIndex.value;

  bool compareIndex(int index) => index == currentIndex.value;

  String getHour(int index) => Utilities.formatTimeWithoutAMPM(model.value!.days![0].hours![index].datetime.toString());

  String getImage(int index) => Utilities.imageMap[model.value!.days![0].hours![index].conditions.toString()] ?? Assets.imagesNightStatRain;

  String getAddress() => '${model.value!.address.toString()}, \n ${model.value!.timezone.toString()}';

  String getCondition() => hours.value!.conditions.toString();

  String getCurrentTemp() => hours.value!.temp!.toInt().toString();

  String getFeelLike() => hours.value!.feelslike.toString();

  String getCloudOver() => hours.value!.cloudcover.toString();

  String getWindSpeed() => hours.value!.windspeed.toString();

  String getHumidity() => hours.value!.humidity.toString();

  getData() {
    HomeRepository.hitApi().then((value) {
      model.value = WeatherModel.fromJson(value);
      for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
          // print(model.value!.days![0].hours![i].datetime!);
        if (Utilities.checkTime(model.value!.days![0].hours![i].datetime!)) {
          hours.value = model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
      Get.to(const HomeScreen());
    });
  }

  setHour(int index) {
    Timer(const Duration(milliseconds: 100), () => animator.value = true);
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(const Duration(milliseconds: 100), () => animator.value = false);
  }
}
