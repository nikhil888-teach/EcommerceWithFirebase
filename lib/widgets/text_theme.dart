import 'package:flutter/cupertino.dart';

class Text_Style {
  static TextStyle grey_text_Theme(double size, FontWeight fontWeight) {
    return TextStyle(
        color: Color(0xff9B9B9B), fontSize: size, fontWeight: fontWeight);
  }

  static TextStyle black_text_Theme(double size, FontWeight fontWeight) {
    return TextStyle(
        color: Color(0xff222222), fontSize: size, fontWeight: fontWeight);
  }

  static TextStyle white_text_Theme(double size, FontWeight fontWeight) {
    return TextStyle(
        color: Color(0xffFFFFFF), fontSize: size, fontWeight: fontWeight);
  }
}
