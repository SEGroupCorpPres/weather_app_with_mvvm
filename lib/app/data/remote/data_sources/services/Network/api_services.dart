import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app_with_mvvm/app/data/remote/data_sources/app_exceptions.dart';
import 'package:weather_app_with_mvvm/app/data/remote/data_sources/services/Network/base_api_services.dart';

class ApiServices extends BaseApiServices {
  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataExceptions('Error while communication ${response.statusCode}');
    }
  }

  @override
  Future getApi(String url) async {
    var jsonData;
    try {
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    } on SocketException {
      throw NetworkExceptions('No Internet');
    }
    return jsonData;
  }
}
