// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/models/location_model.dart';
import 'package:weatherapp/models/weather_data_model.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/location_service.dart';
import 'package:weatherapp/services/networking_service.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    () async {
      Location location = await getLocation();
      WeatherData weatherData = await fetchWeatherData(
        lat: location.latitude,
        lng: location.longitude,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            weatherData: weatherData,
          ),
        ),
      );
    }();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitFadingCircle(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
