import 'package:weather/models/mode.dart';

abstract class WeatherState {}

class WeatherInit extends WeatherState {}

class WeatherLoadind extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccess({ required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
