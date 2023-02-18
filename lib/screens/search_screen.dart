import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import "../services/weather_service.dart";
import "../models/weather_model.dart";

class SearchPage extends StatelessWidget {
  // SearchPage({super.key});
  // the error say that it can take a null value so we add ?
  SearchPage(this.updateUI);
  VoidCallback? updateUI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for a city"),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          onSubmitted: (data) async {
            WeatherService service = WeatherService();
            WeatherModel weather = await service.getWeather(cityName: data);
            // علشان نعمل اكسيس للاوبجكت اللي اتكون في البروفايدر
            // اللي اسمه ويذير بنعمل السطر ده
            // كده هيديك اكسيس علي الاوبجكت اللي اتكون في الماين
            Provider.of<WeatherProvider>(context, listen: false).weatherData =
                weather;
            Provider.of<WeatherProvider>(context, listen: false).cityName =
                data;
            // The old solution, lifting the state up (DON'T USE)
            // updateUI!();
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              suffixIcon:
                  GestureDetector(onTap: () {}, child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: "Enter a city",
              label: Text("Search")),
        ),
      )),
    );
  }
}

// Global Variable(Anyone can access this)

