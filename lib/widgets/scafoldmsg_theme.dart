import 'package:flutter/material.dart';

class Scaffold_msg {
  static ScaffoldMessengerState toastMessage(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }
}
