import 'dart:convert';
import "../models/weather_model.dart";
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = "http://api.weatherapi.com/v1";
    String apiKey = "6cec19cccbee47d7bc9212055231202";
    Uri url = Uri.parse(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no");
    http.Response response = await http.get(url);

    // To convert the data to JSON notation
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
