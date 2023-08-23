import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit_weather/weather_cubit.dart';
import 'package:weather/cubit/cubit_weather/weather_state.dart';
import 'package:weather/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/services/services_weather.dart';

void main() {
  runApp(
    BlocProvider(
        create: (BuildContext context) {
          return WeatherCubit(WeatherInit(), ServicesWeather());
        },
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel ==
                null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor(),
      ),
      home: HomePage(),
    );
  }
}
