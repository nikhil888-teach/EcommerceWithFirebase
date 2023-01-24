import 'package:ecommerce/screen/authntication/sign_page.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

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
        fontFamily: google_fonts.GoogleFonts.roboto().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: const MyMainPage(),
    );
  }
}
