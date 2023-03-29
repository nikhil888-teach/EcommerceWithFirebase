import 'package:flutter/material.dart';

class Textformfield_style {
  static Card textField(TextEditingController textEditingController,
      String hintText, TextInputType textInputType) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'cannot be blank' : null,
        controller: textEditingController,
        autocorrect: true,
        keyboardType: textInputType,
        enableSuggestions: true,
        enabled: true,
        enableInteractiveSelection: true,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
