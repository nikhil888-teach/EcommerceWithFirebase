import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const THEMESTATUS = "THEMESTATUS";
  static const NEWPRODUCTS = "NEWPRODUCTS";
  static const TOPPRODUCTS = "TOPPRODUCTS";
  setTopProducts(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(TOPPRODUCTS, value);
  }

  Future<bool> getTopProducts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(TOPPRODUCTS) ?? true;
  }

  setNewProducts(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(NEWPRODUCTS, value);
  }

  Future<bool> getNewProducts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(NEWPRODUCTS) ?? true;
  }

  setDarkTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEMESTATUS, value);
  }

  Future<bool> getDarkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEMESTATUS) ?? false;
  }
}
