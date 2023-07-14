import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/mode.dart';
import 'package:weather/pages/search.dart';
import 'package:weather/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(
                              updateUi: updateUi,
                            )));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? const Center(
              child: Text("There is no weather 🌍 start searching now 🔎"),
            )
          : Container(
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
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          const  TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'updated at ${weatherData!.date}',
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
                      weatherData!.stateName,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ]),
            ),
    );
  }
}
