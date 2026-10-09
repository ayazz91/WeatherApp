import 'package:flutter/material.dart';
import 'package:weatherapp/colorsTheme/AppColors/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(54.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, color: Colors.white, size: 20),
                  Text('Almaty, Kazakhstan', style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
