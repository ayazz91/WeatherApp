import 'package:flutter/material.dart';
import 'package:weatherapp/colorsTheme/AppColors/colors.dart';
import 'package:weatherapp/repository/Services/weather_service.dart';
import 'package:weatherapp/widgets/dayli_weather_widget.dart';
import 'package:weatherapp/widgets/weekly_weather_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> hours = [];
  List<dynamic> temperatures = [];
  List<dynamic> temperatureMax = [];
  List<dynamic> temperatureMin = [];
  List<dynamic> days = [];

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    try {
      final result = await getWeather();

      final daily = Map<String, dynamic>.from(result['daily']);

      debugPrint('DAILY DATA: $daily');

      final loadedDays = List<dynamic>.from(daily['time'] ?? []);
      final loadedMax = List<dynamic>.from(daily['temperature_2m_max'] ?? []);
      final loadedMin = List<dynamic>.from(daily['temperature_2m_min'] ?? []);

      debugPrint('LOADED DAYS: ${loadedDays.length}');
      debugPrint('LOADED MAX: ${loadedMax.length}');
      debugPrint('LOADED MIN: ${loadedMin.length}');

      if (!mounted) return;

      setState(() {
        days = loadedDays;
        temperatureMax = loadedMax;
        temperatureMin = loadedMin;

        hours = List<dynamic>.from(result['hourly']['time']).take(24).toList();

        temperatures = List<dynamic>.from(
          result['hourly']['temperature_2m'],
        ).take(24).toList();
      });
    } catch (e, stackTrace) {
      debugPrint('WEATHER ERROR: $e');
      debugPrintStack(stackTrace: stackTrace);
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
                  hours.isNotEmpty && temperatures.isNotEmpty
                      ? Text(
                          '${temperatures[0]}°C',
                          style: TextStyle(fontSize: 48, color: Colors.white),
                        )
                      : CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
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

                  temperatureMax.isNotEmpty && temperatureMin.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '↑ ${temperatureMax[0]}°C',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '↓ ${temperatureMin[0]}°C',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(height: 20),
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

              Padding(
                padding: const EdgeInsets.only(top: 12, left: 25, right: 25),
                child: Container(
                  width: double.infinity,
                  height: 330,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Прогноз на 7 дней',
                          style: TextStyle(fontSize: 20),
                        ),

                        WeeklyWeatherWidget(
                          days: days,
                          temperatureMax: temperatureMax,
                          temperatureMin: temperatureMin,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
