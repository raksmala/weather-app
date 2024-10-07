import 'package:flutter/material.dart';
import 'package:weather_app/theme.dart';
import '../utils/weather_icons.dart';

class WeatherInfo extends StatelessWidget {
  final Map<String, dynamic>? weatherData;

  const WeatherInfo({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    var tempCelcius = weatherData?['current']?['temp_c'] ?? 'N/A';
    var condition = weatherData?['current']?['condition']?['text'] ?? 'Unknown';
    var locationName = weatherData?['location']?['name'] ?? 'Unknown';
    var conditionIconUrl = weatherData?['current']?['condition']?['icon'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (conditionIconUrl != null)
          Image.network(
            'http:$conditionIconUrl',
            width: 64,
            height: 64,
            fit: BoxFit.contain,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.my_location,
              color: WeatherColorScheme.iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              'Location: $locationName',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thermostat,
              color: WeatherColorScheme.iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              'Temperature: ${tempCelcius.toString()}°C',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              getWeatherIcon(condition),
              color: WeatherColorScheme.iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              'Condition: $condition',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
