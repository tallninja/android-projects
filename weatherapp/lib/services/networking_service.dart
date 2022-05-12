import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_data_model.dart';

Future<WeatherData> fetchWeatherData({
  required double lat,
  required double lng,
}) async {
  http.Response? response;
  const String apiKey = 'f178737c0dad0fc5a53d9576648eb221';

  try {
    Uri uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&units=metric&appid=$apiKey',
    );
    response = await http.get(uri);
  } catch (e) {
    print(e);
  }

  Map responseData = jsonDecode(response!.body);
  return WeatherData(
    weatherId: responseData['weather'][0]['id'],
    temperature: responseData['main']['temp'],
    city: responseData['name'],
  );
}

Future<WeatherData> fetchWeatherDataString({
  required String cityName,
}) async {
  http.Response? response;
  const String apiKey = 'f178737c0dad0fc5a53d9576648eb221';

  try {
    Uri uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey',
    );
    response = await http.get(uri);
  } catch (e) {
    print(e);
  }

  Map responseData = jsonDecode(response!.body);
  return WeatherData(
    weatherId: responseData['weather'][0]['id'],
    temperature: responseData['main']['temp'],
    city: responseData['name'],
  );
}
