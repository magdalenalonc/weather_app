import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';

class WeatherRepository {
  WeatherRepository(this.weatherDataProvider);

  final WeatherDataProvider weatherDataProvider;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Warsaw';

      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
