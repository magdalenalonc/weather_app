import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class DynamicIconWidget extends StatelessWidget {
  const DynamicIconWidget({
    super.key,
    required this.iconName,
    required this.size,
  });

  final String iconName;
  final double size;

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'Thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'Drizzle':
        return WeatherIcons.showers;
      case 'Rain':
        return WeatherIcons.rain;
      case 'Snow':
        return WeatherIcons.snow;
      case 'Fog':
        return WeatherIcons.fog;
      case 'Clear':
        return WeatherIcons.day_sunny;
      case 'Clouds':
        return WeatherIcons.cloud;
      default:
        return WeatherIcons.na;
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData = _getIconData(iconName);
    return Icon(
      iconData,
      size: size,
    );
  }
}
