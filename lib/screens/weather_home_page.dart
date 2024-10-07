import 'package:flutter/material.dart';
// import '../services/weather_service.dart'; // Uncomment to use the real weather data
import '../services/dummy_weather_service.dart';
import '../widgets/weather_info.dart';

class MyWeatherHomePage extends StatelessWidget {
  const MyWeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          // future: fetchWeather(), // Uncomment to use the real weather data
          future: fetchDummyWeather(),
          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return WeatherInfo(weatherData: snapshot.data); // Use the custom widget
            } else {
              return const Text('Failed to load data');
            }
          },
        ),
      ),
    );
  }
}
