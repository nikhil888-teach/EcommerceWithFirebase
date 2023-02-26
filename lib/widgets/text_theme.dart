import 'package:ecommerce/theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Text_Style {
  static TextStyle text_Theme(
      int color, double size, FontWeight fontWeight, BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return TextStyle(
        color: themeChange.darkTheme ? Colors.white : Color(color),
        fontSize: size,
        fontWeight: fontWeight);
  }
}
