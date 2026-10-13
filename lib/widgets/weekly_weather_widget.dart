import 'package:flutter/material.dart';

class WeeklyWeatherWidget extends StatelessWidget {
  const WeeklyWeatherWidget({
    super.key,
    required this.days,
    required this.temperatureMax,
    required this.temperatureMin,
  });

  final List<dynamic> days;
  final List<dynamic> temperatureMax;
  final List<dynamic> temperatureMin;

  @override
  Widget build(BuildContext context) {
    final count = [
      days.length,
      temperatureMax.length,
      temperatureMin.length,
    ].reduce((a, b) => a < b ? a : b);

    if (count == 0) {
      return const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          'Загружаем прогноз...',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return SizedBox(
      height: 270,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: count,
        itemBuilder: (context, index) {
          final date = DateTime.parse(days[index]);
          final dayName = index == 0
              ? 'Сегодня'
              : ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'][date.weekday - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    dayName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: const Icon(Icons.wb_sunny, color: Colors.amber, size: 22),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 35,
                    child: Text(
                      '${temperatureMax[index]}°',
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 35,
                    child: Text(
                      '${temperatureMin[index]}°',
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
