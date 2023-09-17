import 'package:climate_app/search_page.dart';
import 'package:climate_app/weather.dart';
import 'package:flutter/material.dart';
import 'design.dart';
import 'location.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.weather});

  var weather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String temperature = '';
  String icon = '';

  void weatherInfo(info) {
    temperature = info["main"]["temp"].toString().split('.')[0];
    icon = info["weather"][0]["icon"];
  }

  @override
  void initState() {
    weatherInfo(widget.weather);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/location_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      Location location = Location();
                      await location.getCurrentPosition();
                      String url =
                          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=apiKey&units=metric';
                      Weather currentWeather = Weather(url);
                      var weatherData = await currentWeather.getWeather();
                      setState(
                        () {
                          weatherInfo(weatherData);
                        },
                      );
                    },
                    icon: Icon(Icons.near_me, color: Colors.blue, size: 75.0),
                  ),
                  IconButton(
                    onPressed: () async {
                      var city = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) {
                            return SearchPage();
                          },
                        ),
                      );
                      String url =
                          "https://api.openweathermap.org/data/2.5/weather?q=${city.toString()}&appid=apiKey&units=metric";
                      Weather currentWeather = Weather(url);
                      var weatherData = await currentWeather.getWeather();
                      setState(
                        () {
                          weatherInfo(weatherData);
                        },
                      );
                    },
                    icon: Icon(Icons.location_city,
                        color: Colors.blue, size: 75.0),
                  ),
                ],
              ),
              SizedBox(height: 150.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                  Image.network(
                      'https://openweathermap.org/img/wn/$icon@2x.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}