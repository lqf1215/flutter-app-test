import 'dart:convert';

import 'package:app_test/services/kv_service.dart';
import 'package:app_test/utils/app_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalDataController extends GetxController {
  String selectedLanguageCode = 'en',
      selectedCountryCode = 'US',
      selectedLanguageName = 'English';
  int selectedLanguageIndex = 1;
  int selectedTheme = 0;
  String selectedThemeName = "system";
  List<Map<String, dynamic>> allLanguages = alLanguages;
  List<String> themeList = ["system", "light", "dark"];
  ThemeMode currentTheme = ThemeMode.system;

  initialize() {
    Get.updateLocale(Locale(selectedLanguageCode, selectedCountryCode));
    Get.changeThemeMode(currentTheme);
  }

  changeLanguage(int index) {
    selectedCountryCode = alLanguages[index][KvConstants.countryCode];
    selectedLanguageCode = alLanguages[index][KvConstants.languageCode];
    selectedLanguageName = alLanguages[index][KvConstants.languageName];
    KVService().setStringPrefValue(
        key: KvConstants.languageCode, value: selectedLanguageCode);
    KVService().setStringPrefValue(
        key: KvConstants.countryCode, value: selectedCountryCode);
    KVService().setStringPrefValue(
        key: KvConstants.languageName, value: selectedLanguageName);
    Get.updateLocale(Locale(selectedLanguageCode, selectedCountryCode));
    update();
    Get.back();
  }

  void switchTheme(int index) {
    if (index == 0) {
      currentTheme = ThemeMode.system;
      selectedTheme = 0;
      selectedThemeName = "system";
    } else if (index == 1) {
      currentTheme = ThemeMode.light;
      selectedTheme = 1;
      selectedThemeName = "light";
    } else {
      currentTheme = ThemeMode.dark;
      selectedTheme = 2;
      selectedThemeName = "dark";
    }
    KVService()
        .setStringPrefValue(key: KvConstants.theme, value: selectedThemeName);
    Get.changeThemeMode(currentTheme);
    update();
    Get.back();
  }

  bool isDarkTheme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  loadLanguageSettings() async {
    selectedLanguageCode = (KVService()
        .getStringPrefValue(key: KvConstants.languageCode, returnValue: "en"));
    selectedCountryCode = (KVService()
        .getStringPrefValue(key: KvConstants.countryCode, returnValue: "US"));
    selectedLanguageName = (KVService().getStringPrefValue(
        key: KvConstants.languageName, returnValue: "English"));
  }

  loadThemeSettings() async {
    selectedThemeName = (KVService()
        .getStringPrefValue(key: KvConstants.theme, returnValue: "system"));
    if (selectedThemeName == "system") {
      currentTheme = ThemeMode.system;
      selectedTheme = 0;
    } else if (selectedThemeName == "light") {
      currentTheme = ThemeMode.light;
      selectedTheme = 1;
    } else {
      currentTheme = ThemeMode.dark;
      selectedTheme = 2;
    }
  }
}
