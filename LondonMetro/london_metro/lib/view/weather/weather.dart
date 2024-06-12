import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import '../../adMobHelper/adMobHelper.dart';
import '../AllWidgets/appBar.dart';
import '../global-constants.dart';
import '../home/widget/drawer.dart';
import 'services/weatherServices.dart';
import 'widget/weatherTile.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({super.key});

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  late Future<List<Map<String, dynamic>>> forecast;
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    forecast = WeatherServices().fetchFiveDayForecast();
    _wf.currentWeatherByCityName(cityName).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(
          heading: "Heading3",
        ),
      ),
      body: _buildUI(),
      bottomNavigationBar: SizedBox(
        child: AdWidget(
          ad: AdMobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 92,
        width: MediaQuery.of(context).size.width * 1.1,
      ),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Color(0xFF018FD7),
      ));
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Column(
        children: [
          _Header(),
          SizedBox(
            height: Get.height / 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 66),
                child: Text(
                  "Daily",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF252525),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: Get.width / 12.5),
                child: Row(
                  children: [
                    Text(
                      "F",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF252525),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 7.5,
                    ),
                    Text(
                      "C",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF252525),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(child: WeatherForecast())
        ],
      ),
    );
  }

  Widget _Header() {
    DateTime now = _weather!.date!;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF018FD7),
                    ),
                  ),
                ),
              ),
              Text(
                _weather?.weatherDescription.toString().capitalize ?? "",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    height: 0.7,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3F403F),
                  ),
                ),
              ),
              Text(
                "${DateFormat("EEEE").format(now)}, ${DateFormat("dd-MM-yyyy").format(now)}",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF3F403F),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 2,
          ),
          Image.network(
            "https://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png",
            height: 120,
            width: 120,
          ),
        ],
      ),
    );
    //return Text(_weather?.areaName ?? "");
  }
}

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<List<Map<String, dynamic>>> forecast;

  @override
  void initState() {
    super.initState();
    forecast = WeatherServices().fetchFiveDayForecast();
  }

  String getDayOfWeek(String date) {
    DateTime dateTime = DateTime.parse(date);
    return [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ][dateTime.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: forecast,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Color(0xFF018FD7),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final dayForecast = snapshot.data![index];
              final iconUrl =
                  'https://openweathermap.org/img/wn/${dayForecast['icon']}@2x.png';
              return WeatherTile(
                icon: iconUrl,
                day: getDayOfWeek(dayForecast['date']),
                weatherType: dayForecast['weatherType'],
                tempF: dayForecast['avgTempF'].toStringAsFixed(1),
                tempC: dayForecast['avgTempC'].toStringAsFixed(1),
              );
            },
          );
        }
      },
    );
  }
}
