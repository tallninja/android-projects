// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_data_model.dart';
import 'package:weatherapp/screens/city_screen.dart';
import 'package:weatherapp/services/networking_service.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/utils/constants.dart';

class LocationScreen extends StatefulWidget {
  WeatherData weatherData;

  LocationScreen({required this.weatherData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String city;
  late int temperature;
  late int weatherId;

  void getCityWeather(cityName) async {
    WeatherData weatherData = await fetchWeatherDataString(cityName: cityName);
    setState(() {
      city = weatherData.city;
      temperature = weatherData.temperature.toInt();
      weatherId = weatherData.weatherId;
    });
  }

  void updateUI() {
    setState(() {
      city = widget.weatherData.city;
      temperature = widget.weatherData.temperature.toInt();
      weatherId = widget.weatherData.weatherId;
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'images/location_background.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      updateUI();
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        getCityWeather(typedName);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text('$temperature°', style: kTempTextStyle),
                    Text(WeatherModel.getWeatherIcon(weatherId),
                        style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "${WeatherModel.getMessage(temperature)} in $city !",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
