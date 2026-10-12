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
        'timezone': 'Asia/Almaty',
      },
    );
    final data = response.data;
    final temperature = data['current']['temperature_2m'].toString();

    debugPrint(response.data['hourly']['time'].toString());
    debugPrint(response.data['hourly']['temperature_2m'].toString()); 

    return data;
  } on DioException catch (e) {
    debugPrint('Ошибка запроса: ${e.message}');

    if (e.response != null) {
      debugPrint('Статус код: ${e.response?.statusCode}');
      debugPrint('Ответ: ${e.response?.data}');
    }
    rethrow; // Проброс исключения дальше, чтобы его можно было обработать в вызывающем коде
  }
}
