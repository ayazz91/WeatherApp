import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/AppPages/map_page.dart';
import 'package:weatherapp/Screens/AppPages/settings_page.dart';
import 'package:weatherapp/Screens/AppPages/splash_screen.dart';
import 'package:weatherapp/Screens/AppPages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const SplashScreen(),

      routes: {
        '/map_page' : (context) => const MapPage(),
        '/weather_page': (context) => const WeatherPage(), 
        '/settings_page': (context) => const SettingsPage() 
      },
    );
  }
}
