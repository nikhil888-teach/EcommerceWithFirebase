import 'package:ecommerce/screen/authntication/login_page.dart';
import 'package:ecommerce/screen/authntication/sign_page.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySignInPage(),
    );
  }
}
