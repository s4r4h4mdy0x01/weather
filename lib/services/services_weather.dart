import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/mode.dart';

class ServicesWeather {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String key = 'f8b36435b6474443b8392726222812&q';
  WeatherModel? weather;
  Future<WeatherModel?> getweather({required String cityName}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '$baseUrl/forecast.json?key=$key&q=$cityName&days=1&aqi=no&alerts=no'));
      Map<String, dynamic> dataOfApi = jsonDecode(response.body);

       weather = WeatherModel.formJson(dataOfApi);
    } catch (e) {
      print(e);
    }
    return weather;
  }

}
