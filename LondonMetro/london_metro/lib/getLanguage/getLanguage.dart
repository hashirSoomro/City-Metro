import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = "English";
  String get selectedLanguage => _selectedLanguage;
  updateLanguage(newValue) {
    _selectedLanguage = newValue;
    Get.updateLocale(Locale(_selectedLanguage));

    notifyListeners();
  }
}
