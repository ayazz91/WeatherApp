import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

Future<Map<String, dynamic>> getWeather() async {
  try {
    final response = await dio.get(
      'https://api.open-meteo.com/v1/forecast',
      queryParameters: {
        'latitude': 43.24,
        'longitude': 76.92,
        'current': 'temperature_2m,relative_humidity_2m,wind_speed_10m',
        'hourly': 'temperature_2m',
        'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
        'forecast_days': 7,
        'timezone': 'Asia/Almaty',
      },
    );

    return Map<String, dynamic>.from(response.data);
  } on DioException catch (e) {
    debugPrint('Ошибка запроса: ${e.message}');
    rethrow;
  }
}
