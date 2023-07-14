import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/mode.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/services/services_weather.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  String? cityName;
  VoidCallback? updateUi;
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
              ServicesWeather service = ServicesWeather();
              WeatherModel? weather =
                  await service.getweather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    ServicesWeather service = ServicesWeather();
                    WeatherModel? weather =
                        await service.getweather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

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
