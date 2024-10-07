import 'package:flutter/material.dart';

IconData getWeatherIcon(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Icons.wb_sunny;
    case 'partly cloudy':
      return Icons.wb_cloudy;
    case 'cloudy':
      return Icons.cloud;
    case 'overcast':
      return Icons.cloud;
    case 'mist':
      return Icons.blur_on;
    case 'patchy snow possible':
      return Icons.ac_unit;
    case 'patchy sleet possible':
      return Icons.snowmobile;
    case 'thundery outbreaks possible':
      return Icons.flash_on;
    case 'blowing snow':
    case 'blizzard':
      return Icons.ac_unit;
    case 'fog':
    case 'freezing fog':
      return Icons.blur_on;
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'patchy light rain':
    case 'patchy rain possible':
      return Icons.beach_access;
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'patchy heavy snow':
      return Icons.ac_unit;
    case 'ice pellets':
      return Icons.ac_unit;
    case 'light rain shower':
    case 'moderate or heavy rain shower':
      return Icons.beach_access;
    case 'light sleet showers':
      return Icons.snowmobile;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Icons.flash_on;
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Icons.flash_on;
    default:
      return Icons.error;
  }
}