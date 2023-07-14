import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String stateName;
  String icon;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.stateName,
    required this.icon,
  });

  factory WeatherModel.formJson(data) {
    var jsonDataBaseToTemp = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
        date: data["location"]["localtime"],
        temp: jsonDataBaseToTemp["avgtemp_c"],
        maxTemp: jsonDataBaseToTemp["maxtemp_c"],
        minTemp: jsonDataBaseToTemp["mintemp_c"],
        stateName: jsonDataBaseToTemp["condition"]["text"],
        icon: jsonDataBaseToTemp["condition"]["icon"]);
  }
  @override
  String toString() {
    
    return 'date $date  , temp = $temp , maxTemp = $maxTemp , minTemp = $minTemp ,stateName = $stateName, icon = $icon';
  }

  MaterialColor getColor() {
    if (maxTemp >= 40) {
      return Colors.brown;
    } else if (maxTemp <= 30 && maxTemp >= 20) {
      return Colors.cyan;
    } else {
      return Colors.deepOrange;
    }
  }
}
