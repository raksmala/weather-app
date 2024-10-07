import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '156f06c3597c4f228c595552240410'; // Replace with your actual API key
const String location = 'Jakarta';

Future<Map<String, dynamic>> fetchWeather() async {
  const url = 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
