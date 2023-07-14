import 'package:flutter/material.dart';
import 'package:weather/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (BuildContext context) {
          return WeatherProvider();
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
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getColor(),
      ),
      home: HomePage(),
    );
  }
}
