import 'package:flutter/material.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({
    super.key,
    required this.hours,
    required this.temperatures,
  });
  final List<dynamic> hours;
  final List<dynamic> temperatures;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 16),
          child: Text(
            'Почасовой прогноз',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 21, right: 21),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(hours.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Text(
                        hours[index].toString().split('T').last,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(Icons.wb_sunny, color: Colors.white),
                      Text(
                        '${temperatures[index]}°C',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
