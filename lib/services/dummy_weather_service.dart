import 'dart:convert';

Future<Map<String, dynamic>> fetchDummyWeather() async {
  // Simulating a delay like an actual API call
  await Future.delayed(const Duration(seconds: 1));

  // Dummy JSON data
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

  // Return the decoded dummy data
  return jsonDecode(dummyWeatherData);
}
