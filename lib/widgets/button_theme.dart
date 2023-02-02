import 'package:flutter/material.dart';

class Button_Style {
  static Container button_Theme(String name) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
