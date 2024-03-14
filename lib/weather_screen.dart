import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          // main card
          const Placeholder(
            fallbackHeight: 250,
          ),
          const SizedBox(height: 20),
          // weather forecast cards
          const Placeholder(
            fallbackHeight: 150,
          ),
          const SizedBox(height: 20),
          // additional information
          const Placeholder(
            fallbackHeight: 150,
          ),
        ],
      ),
    );
  }
}
