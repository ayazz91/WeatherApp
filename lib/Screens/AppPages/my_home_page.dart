import 'package:flutter/material.dart';
import 'package:weatherapp/colorsTheme/AppColors/colors.dart';
import 'package:weatherapp/repository/Services/weather_service.dart';
import 'package:weatherapp/widgets/dayli_weather_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List<dynamic> hours = [];
  List<dynamic> temperatures = [];

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    try {
      final result = await getWeather();

      setState(() {
        hours = (result['hourly']['time'] as List).take(24).toList();
        temperatures =
            (result['hourly']['temperature_2m'] as List).take(24).toList();
      });
    } catch (e) {
      debugPrint('Не удалось получить погоду: $e');
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [linearFirst, linearSecond, linearThird],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 54, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    Text(
                      'Almaty, Kazakhstan',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny, color: Colors.white, size: 60),
                  Text(
                    '24°C',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ясно',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    'Ощущается как 26°C',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '↑ 27°C',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '↓ 15°C',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 25, right: 25),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: DailyWeatherWidget(
                    hours: hours,
                    temperatures: temperatures,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
