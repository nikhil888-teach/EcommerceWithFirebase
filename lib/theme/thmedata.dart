import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

class Style {
  static ThemeData themeData(bool value, BuildContext context) {
    return ThemeData(
      switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all(Colors.grey),
          thumbColor: MaterialStateProperty.all(Colors.white)),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor:
                MaterialStateProperty.all(value ? Colors.white : Colors.black)),
      ),
      tabBarTheme: TabBarTheme(
        labelPadding: EdgeInsets.symmetric(vertical: 14),
        indicatorColor: Color(0xffDB3022),
        unselectedLabelColor: value ? Colors.white : Colors.black,
        unselectedLabelStyle: Text_Style.text_Theme(
            Constants.black_text, 16, FontWeight.normal, context),
        labelColor: value ? Colors.white : Colors.black,
        labelStyle: Text_Style.text_Theme(
            Constants.black_text, 16, FontWeight.bold, context),
      ),
      iconTheme: IconThemeData(color: value ? Colors.black : Colors.black),
      fontFamily: google_fonts.GoogleFonts.roboto().fontFamily,
      scaffoldBackgroundColor: value ? Colors.black : Colors.white,
      primaryTextTheme: TextTheme(
          labelMedium: TextStyle(
        color: value ? Colors.white : Colors.black,
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(color: value ? Colors.black : Colors.white),
                  borderRadius: BorderRadius.circular(24))))),
      cardTheme: CardTheme(color: value ? Colors.grey.shade900 : Colors.white),
      listTileTheme: ListTileThemeData(
          tileColor: value ? Color(0xff191919) : Colors.white),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: value ? Colors.black : Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
              color: value ? Colors.white : Colors.red,
              fontSize: 10,
              fontWeight: FontWeight.normal),
          selectedIconTheme:
              IconThemeData(color: value ? Colors.white : Colors.red),
          selectedItemColor: value ? Colors.white : Color(0xffDB3022),
          backgroundColor: value ? Color(0xff171717) : Colors.white),
      appBarTheme: AppBarTheme(
          color: value ? Colors.black : Colors.white,
          iconTheme: IconThemeData(color: value ? Colors.white : Colors.black)),
    );
  }
}
