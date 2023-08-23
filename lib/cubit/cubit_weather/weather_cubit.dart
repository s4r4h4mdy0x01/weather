import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit_weather/weather_state.dart';
import 'package:weather/models/mode.dart';
import 'package:weather/services/services_weather.dart';

class WeatherCubit extends Cubit<WeatherState> {
  ServicesWeather servicesWeather;
  WeatherModel? weatherModel;
  String? cityName;
  WeatherCubit(super.WeatherInit, this.servicesWeather);
  void getWeather({required String cityName}) async {
    emit(WeatherLoadind());
    try {
      weatherModel = await servicesWeather.getweather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
