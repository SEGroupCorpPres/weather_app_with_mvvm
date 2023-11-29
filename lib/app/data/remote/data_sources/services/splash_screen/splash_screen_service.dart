import 'package:get/get.dart';
import 'package:weather_app_with_mvvm/features/home/presentation/controllers/home_controller.dart';

class SplashScreenServices{
  static void getApiData(){
    final controller = Get.put(HomeController());
    controller.getData();
  }
}