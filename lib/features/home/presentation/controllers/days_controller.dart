import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/app/data/remote/models/day_model.dart';
import 'package:weather_app_with_mvvm/core/generated/assets.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app_with_mvvm/utilities/utilities.dart';

class DaysController extends GetxController {
  RxInt currentDay = 0.obs;
  final homeController = Get.put(HomeController());
  late Rx<DaysModel> day;

  DaysController() {
    day = homeController.model.value!.days![0].obs;
  }

  setDay(int index) {
    day.value = homeController.model.value!.days![index];
    currentDay.value = index;
  }

  String getImage(int index) {
    return Utilities.imageMap[homeController.model.value!.days![index].conditions] ?? Assets.imagesNightStatRain;
  }

  String getMonth(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDate(date);
  }

  String getMonthDay(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDay(date);
  }

  String getDate(int index) {
    DateTime date = DateTime.parse(homeController.model.value!.days![index].datetime.toString());
    print(Utilities.formatDate(date));
    return Utilities.formatDate(date);
  }

  String getMinTemp(int index) => '${homeController.model.value!.days![index].tempmin!.toInt().toString()}\u00B0';

  String getMaxTemp(int index) => '${homeController.model.value!.days![index].tempmax!.toInt().toString()}\u00B0';
}
