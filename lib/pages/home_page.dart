import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubit/cubit_weather/weather_cubit.dart';
import 'package:weather/cubit/cubit_weather/weather_state.dart';
import 'package:weather/models/mode.dart';
import 'package:weather/pages/search.dart';
import 'package:weather/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return CodeSuccess(weatherData:state.weatherModel );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Something went wrong please try again'),
            );
          } else {
            return const Center(
              child: Text("There is no weather 🌍 start searching now 🔎"),
            );
          }
        },
      ),
    );
  }
}

class CodeSuccess extends StatelessWidget {
  const CodeSuccess({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getColor(),
          weatherData!.getColor()[300]!,
          weatherData!.getColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName!,
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'updated at ${weatherData!.date} ',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(weatherData!.icon),
                Text(
                  '${weatherData!.temp.toInt()}',
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp  ${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'MinTemp ${weatherData!.minTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${weatherData!.stateName}',
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 5,
            ),
          ]),
    );
  }
}
