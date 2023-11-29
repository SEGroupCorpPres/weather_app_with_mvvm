import 'package:weather_app_with_mvvm/app/data/remote/data_sources/services/Network/api_services.dart';
import 'package:weather_app_with_mvvm/core/constants/app_url.dart';

class HomeRepository {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}
