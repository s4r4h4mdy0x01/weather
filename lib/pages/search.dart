import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubit/cubit_weather/weather_cubit.dart';
import 'package:weather/models/mode.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/services/services_weather.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City '),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onChanged: (data) {
              cityName = data;
            },
            onFieldSubmitted: (data) async {
              // print(data);
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!);
                    BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search),
                ),
                hintText: 'Enter a City',
                labelText: 'Search',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
          ),
        ),
      ),
    );
  }
}

//WeatherModel? weatherData;
