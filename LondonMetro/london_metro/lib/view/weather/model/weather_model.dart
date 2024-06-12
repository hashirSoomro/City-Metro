import 'package:intl/intl.dart';

class Weather_Data {
  final Temperature temperature;
  final List<WeatherInfo> weather;
  final String day;
  final String date;

  Weather_Data({
    required this.temperature,
    required this.weather,
    required this.day,
    required this.date,
  });

  factory Weather_Data.fromJson(Map<String, dynamic> json) {
    return Weather_Data(
      temperature: Temperature.fromJson(json['main']['temp']),
      weather: List<WeatherInfo>.from(
        json['weather'].map(
          (weather) => WeatherInfo.fromJson(weather),
        ),
      ),
      day: DateFormat('EEEE').format(DateTime.now()),
      date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
    );
  }
}

class WeatherData {
  final String name;
  final Temperature temperature;

  final int humidity;
  final Wind wind;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int seaLevel;
  final List<WeatherInfo> weather;
  // i have alreadt create a mode her according to my requirement you can also create mode according to your requiremnet
  // if you need like my model all the source code are is in description. you can follow we me.

  WeatherData({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.seaLevel,
    required this.weather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      temperature: Temperature.fromJson(json['main']['temp']),
      humidity: json['main']['humidity'],
      wind: Wind.fromJson(json['wind']),
      maxTemperature: (json['main']['temp_max'] - 273.15), // Kelvin to Celsius
      minTemperature: (json['main']['temp_min'] - 273.15), // Kelvin to Celsius
      pressure: json['main']['pressure'],
      seaLevel: json['main']['sea_level'] ?? 0,
      weather: List<WeatherInfo>.from(
        json['weather'].map(
          (weather) => WeatherInfo.fromJson(weather),
        ),
      ),
    );
  }
}

class WeatherInfo {
  final String main;

  WeatherInfo({
    required this.main,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      main: json['main'],
    );
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json) {
    return Temperature(
      current: (json - 273.15), // Kelvin to Celsius
    );
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}
