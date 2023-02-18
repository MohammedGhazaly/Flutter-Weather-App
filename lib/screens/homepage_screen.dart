import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import "./search_screen.dart";

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUI() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (contxt) {
                  return SearchPage(updateUI);
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text("Weather App"),
      ),
      body: weatherData == null
          ? Center(
              // ignore: prefer_const_literals_to_create_immutables
              // mainAxisSize: MainAxisSize.min بتخليك تاخد مساحه علي اد المحتوي
              // علشان كده عامل سنتر بالسينتر ويدجيت

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "there is no weather data 😞",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Start searching now 🔎",
                      style: TextStyle(fontSize: 24),
                    )
                  ]),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
                Colors.orange[50]!
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName
                          .toString(),
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    // ${weatherData!.date.day}
                    Text(
                        "Updated at: ${weatherData!.date.hour}:${weatherData!.date.minute}",
                        style: TextStyle(fontSize: 22)),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          weatherData!.avgTemp.toInt().toString(),
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text("Max Temp : ${weatherData!.maxTemp.toInt()}",
                                style: TextStyle(fontSize: 18)),
                            Text("Min Temp : ${weatherData!.minTemp.toInt()}",
                                style: TextStyle(fontSize: 18)),
                          ],
                        )
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(weatherData?.weatherStateName ?? "",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    Spacer(
                      flex: 5,
                    ),
                  ]),
            ),
    );
  }
}
