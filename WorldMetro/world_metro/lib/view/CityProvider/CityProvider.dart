import 'package:flutter/material.dart';

class CityProvider extends ChangeNotifier {
  String _selectedCity = "Dubai";
  String get selectedCity => _selectedCity;

  List<String> _cities = [
    "Dubai",
    "Paris",
    "Istanbul",
    "London",
    "Guangzhou",
    "HongKong",
    "Beijing",
    "Seoul",
    "NewYork"
  ];
  List get Cities => _cities;
  selectCity(city) {
    _selectedCity = city;
  }
}
