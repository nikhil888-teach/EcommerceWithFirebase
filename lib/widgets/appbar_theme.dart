import 'package:flutter/material.dart';

class AppBar_Style {
  static AppBar appbarTheme(String title, double size) {
    {
      return AppBar(
          backgroundColor: Colors.white,
          title: Text(
            title,
            // style: Text_Style.text_Theme(
            //     Constants.black_text, 20, FontWeight.bold)),
          ));
    }
  }
}
