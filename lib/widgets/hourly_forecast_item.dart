import 'package:flutter/material.dart';
import 'package:weather_app/widgets/dynamic_icon_widget.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  final String time;
  final DynamicIconWidget icon;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            icon,
            const SizedBox(height: 8),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}
