import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const THEMESTATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEMESTATUS, value);
  }

  Future<bool> getDarkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEMESTATUS) ?? false;
  }
}
