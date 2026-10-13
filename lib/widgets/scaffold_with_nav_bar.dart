import 'package:flutter/material.dart';
import 'package:glass_bottom_navigation_bar/glass_bottom_navigation_bar.dart';
import 'package:weatherapp/Screens/AppPages/map_page.dart';
import 'package:weatherapp/Screens/AppPages/my_home_page.dart';
import 'package:weatherapp/Screens/AppPages/settings_page.dart';
import 'package:weatherapp/Screens/AppPages/weather_page.dart';

class MainShellNav extends StatefulWidget {
  const MainShellNav({super.key});

  @override
  State<MainShellNav> createState() => _MainShellNavState();
}

class _MainShellNavState extends State<MainShellNav> {
  int _currentIndex = 0;

  final _pages = const [
    MyHomePage(),
    WeatherPage(),
    MapPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // контент уходит под стеклянную панель
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: GlassBottomNavigationBar(
          height: 70,
          margin: EdgeInsets.only(top: 15, left: 12, right: 12),
          currentIndex: _currentIndex,
          enableHapticFeedback: false,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItemData(
              icon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItemData(
              icon: const Icon(Icons.cloud),
              label: 'Weather',
            ),
            BottomNavigationBarItemData(
              icon: const Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItemData(
              icon: const Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}