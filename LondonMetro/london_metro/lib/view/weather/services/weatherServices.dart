import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../global-constants.dart';

class WeatherServices {
  Future<List<Map<String, dynamic>>> fetchFiveDayForecast() async {
    final url = api_url;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Map<String, dynamic>> dailyForecasts = [];

      // Group the forecasts by day
      Map<String, List<dynamic>> forecastsByDay = {};
      for (var item in data['list']) {
        String date = item['dt_txt'].split(' ')[0];
        if (forecastsByDay[date] == null) {
          forecastsByDay[date] = [];
        }
        forecastsByDay[date]!.add(item);
      }
      // Calculate the average temperature for each day
      forecastsByDay.forEach((date, forecasts) {
        double tempSum = 0;
        forecasts.forEach((forecast) {
          tempSum += forecast['main']['temp'];
        });
        double avgTemp = tempSum / forecasts.length;

        dailyForecasts.add({
          'date': date,
          'avgTempC': avgTemp,
          'avgTempF': avgTemp * 9 / 5 + 32, // Convert to Fahrenheit
          'weatherType': forecasts[0]['weather'][0]['description'],
          'icon': forecasts[0]['weather'][0]['icon'],
        });
      });

      // Return only the next 5 days
      return dailyForecasts.take(6).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
