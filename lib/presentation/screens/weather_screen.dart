import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/additional_info_item.dart';
import 'package:weather_app/presentation/widgets/dynamic_icon_widget.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast_item.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetched());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App - Warsaw',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<WeatherBloc>().add(WeatherFetched());
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherFailure) {
              return Center(
                child: Text(state.error),
              );
            }

            if (state is! WeatherSuccess) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            final data = state.weatherModel;

            final currentTemp = data.currentTemp;
            final currentSky = data.currentSky;
            final currentPressure = data.currentPressure;
            final currentWindSpeed = data.currentWindSpeed;
            final currentHumidity = data.currentHumidity;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // main card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '$currentTemp°C',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                DynamicIconWidget(
                                  iconName: currentSky.toString(),
                                  size: 54,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  currentSky,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // hourly forecast cards
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // SizedBox(
                  //   height: 120,
                  //   child: ListView.builder(
                  //     itemCount: 5,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       final hourlyForecast = data['list'][index + 1];
                  //       // final hourlyForecast = data.hourlyForecast;
                  //       final hourlySky =
                  //           data['list'][index + 1]['weather'][0]['main'];
                  //       // final hourlySky = data.hourlySky;
                  //       final hourlyTemp =
                  //           '${hourlyForecast['main']['temp']}°C';
                  //       // final hourlyTemp = data.hourlyTemp;
                  //       final time = DateTime.parse(hourlyForecast['dt_txt']);
                  //       // final time = data.time;
                  //       return HourlyForecastItem(
                  //         time: DateFormat.Hm().format(time),
                  //         icon: DynamicIconWidget(
                  //           iconName: hourlySky.toString(),
                  //           size: 30,
                  //         ),
                  //         temperature: hourlyTemp,
                  //       );
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  // additional information
                  const Text(
                    'Additional Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        icon: WeatherIcons.humidity,
                        label: 'Humidity',
                        value: '$currentHumidity %',
                      ),
                      AdditionalInfoItem(
                        icon: WeatherIcons.strong_wind,
                        label: 'Wind Speed',
                        value: '$currentWindSpeed m/s',
                      ),
                      AdditionalInfoItem(
                        icon: WeatherIcons.barometer,
                        label: 'Pressure',
                        value: '$currentPressure hPa',
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
