import 'package:climate_app/temperature_page.dart';
import 'package:climate_app/location.dart';
import 'package:climate_app/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    Location currentPosition = Location();
    await currentPosition.getCurrentPosition();

    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${currentPosition.latitude}&lon=${currentPosition.longitude}&appid=apiKey&units=metric';

    Weather currrentWeather = Weather(url);
    var weatherData = await currrentWeather.getWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage(weather: weatherData);
        },
      ),
    );
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
