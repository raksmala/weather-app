import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // Uncomment this when using the actual API

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: WeatherColorScheme.colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: WeatherColorScheme.appBarColor,
          titleTextStyle: TextStyle(
            color: WeatherColorScheme.appBarTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: WeatherColorScheme.backgroundColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: WeatherColorScheme.textColor),
          bodyMedium: TextStyle(color: WeatherColorScheme.textColor),
          bodySmall: TextStyle(color: WeatherColorScheme.textColor),
        ),
      ),
      home: const MyWeatherHomePage(),
    );
  }
}

class WeatherColorScheme {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.lightBlue, // Seed color for the color scheme
    brightness: Brightness.light, // Light mode
  );

  // You can also define specific colors if needed
  static Color appBarColor = colorScheme.primary; // Use primary color for AppBar
  static Color appBarTextColor = colorScheme.onPrimary; // Text color on the AppBar

  static Color backgroundColor = colorScheme.surface; // Background color
  static Color textColor = colorScheme.onSurface; // Text color on the background
  static Color surfaceColor = colorScheme.surface; // Surface color
  static Color errorColor = colorScheme.error; // Error color
  static Color onErrorColor = colorScheme.onError; // Text color for error
}

class MyWeatherHomePage extends StatelessWidget {
  final String apiKey = '156f06c3597c4f228c595552240410';
  final String location = 'Jakarta';

  const MyWeatherHomePage({super.key});

  Future<Map<String, dynamic>> fetchWeather() async {
    // In the future, you can uncomment the original fetchWeather and package:http/http.dart

    // For now, call the dummyFetchWeather to return mock data
    return await dummyFetchWeather();

    // final url = 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location';

    // final response = await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   return jsonDecode(response.body);
    // } else {
    //   throw Exception('Failed to load weather data');
    // }
  }

  Future<Map<String, dynamic>> dummyFetchWeather() async {
    // Simulating a delay similar to an actual API call
    await Future.delayed(const Duration(seconds: 1));

    // Dummy JSON data (the data you provided)
    const dummyWeatherData = '''
  {
    "location": {
      "name": "Jakarta",
      "region": "Jakarta Raya",
      "country": "Indonesia",
      "lat": -6.2146,
      "lon": 106.8451,
      "tz_id": "Asia/Jakarta",
      "localtime_epoch": 1728274653,
      "localtime": "2024-10-07 11:17"
    },
    "current": {
      "last_updated_epoch": 1728274500,
      "last_updated": "2024-10-07 11:15",
      "temp_c": 31.5,
      "temp_f": 88.6,
      "is_day": 1,
      "condition": {
        "text": "Sunny",
        "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
        "code": 1000
      },
      "wind_mph": 3.4,
      "wind_kph": 5.4,
      "wind_degree": 64,
      "wind_dir": "ENE",
      "pressure_mb": 1012.0,
      "pressure_in": 29.9,
      "precip_mm": 0.0,
      "precip_in": 0.0,
      "humidity": 54,
      "cloud": 9,
      "feelslike_c": 34.8,
      "feelslike_f": 94.6,
      "windchill_c": 31.5,
      "windchill_f": 88.6,
      "heatindex_c": 34.8,
      "heatindex_f": 94.6,
      "dewpoint_c": 21.1,
      "dewpoint_f": 70.0,
      "vis_km": 10.0,
      "vis_miles": 6.0,
      "uv": 9.0,
      "gust_mph": 3.9,
      "gust_kph": 6.2
    }
  }
  ''';

    // Returning the decoded dummy data
    return jsonDecode(dummyWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
          child: FutureBuilder<Map<String, dynamic>>(
              future: fetchWeather(),
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  var weatherData = snapshot.data;
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
                      Text(
                        'Location: $locationName',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Temperature: ${tempCelcius.toString()}°C',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Condition: $condition',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                } else {
                  return const Text('Failed to load data');
                }
              })),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
