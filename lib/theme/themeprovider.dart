import 'package:ecommerce/theme/themepreference.dart';
import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  bool _darkTheme = false;
  bool _newProducts = true;
  bool _topProducts = true;
  bool get newProducts => _newProducts;
  set newProducts(bool value) {
    _newProducts = value;
    themePreference.setNewProducts(value);
    notifyListeners();
  }

  bool get topProducts => _topProducts;
  set topProducts(bool value) {
    _topProducts = value;
    themePreference.setTopProducts(value);
    notifyListeners();
  }

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    themePreference.setDarkTheme(value);
    notifyListeners();
  }
}
