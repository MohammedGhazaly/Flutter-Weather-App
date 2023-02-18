import 'package:flutter/material.dart';

class WeatherModel {
  // String date;
  DateTime date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  // Named Constructor
  // WeatherModel.fromJson(dynamic data) {
  //   var jsonData = data["forecast"]["forecastday"][0]["day"];
  //   date = data["location"]["localtime"];

  //   avgTemp = jsonData["avgtemp_c"];
  //   maxTemp = jsonData["maxtemp_c"];
  //   minTemp = jsonData["mintemp_c"];
  //   weatherStateName = jsonData["condition"]["text"];
  // }

  // Factory Constructor
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData;
    try {
      jsonData = data["forecast"]["forecastday"][0]["day"];
    } catch (e) {
      return WeatherModel(
          date: DateTime.now(),
          avgTemp: 0,
          maxTemp: 0,
          minTemp: 0,
          weatherStateName: "City not found");
    }

    // date = data["location"]["localtime"];
    // avgTemp = jsonData["avgtemp_c"];
    // maxTemp = jsonData["maxtemp_c"];
    // minTemp = jsonData["mintemp_c"];
    // weatherStateName = jsonData["condition"]["text"];
    return WeatherModel(
        date: DateTime.parse(data["current"]["last_updated"]),
        avgTemp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }
  String getImage() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'P Cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.blue;
    }
  }
}
