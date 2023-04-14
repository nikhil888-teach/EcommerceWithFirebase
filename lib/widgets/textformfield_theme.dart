import 'package:flutter/material.dart';
import 'package:username_validator/username_validator.dart';

class Textformfield_style {
  static Card textField(TextEditingController textEditingController,
      String hintText, TextInputType textInputType,
      {bool isName = false}) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: TextFormField(
        controller: textEditingController,
        autocorrect: true,
        validator: (value) {
          if (!UValidator.validateThis(
                  pattern: RegPattern.strict, username: value!) &&
              isName) {
            print(textEditingController.value);
            return 'Invalid username';
          }
          return null;
        },
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
