import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

class Style {
  static ThemeData themeData(bool value, BuildContext context) {
    return ThemeData(
      fontFamily: google_fonts.GoogleFonts.roboto().fontFamily,
      scaffoldBackgroundColor: value ? Colors.black : Colors.white,
      textTheme: TextTheme(
          bodyMedium: TextStyle(color: value ? Colors.white : Colors.black)),
      appBarTheme: AppBarTheme(
        color: value ? Colors.black : Colors.white,
      ),
    );
  }
}
