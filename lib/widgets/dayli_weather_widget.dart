
import 'package:flutter/material.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                Text('Now'),
                Icon(Icons.wb_sunny, color: Colors.white,),
                Text('24°C'),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: [
                Text('16:00'),
                Icon(Icons.cloud, color: Colors.white,),
                Text('22°C'),
              ],
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}