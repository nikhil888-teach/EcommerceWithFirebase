import 'package:flutter/material.dart';

class Textformfield_style {
  static Card textField(
      TextEditingController textEditingController, String hintText) {
    return Card(
      elevation: 2,
      child: TextFormField(
        controller: textEditingController,
        autocorrect: true,
        enableSuggestions: true,
        enabled: true,
        enableInteractiveSelection: true,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}