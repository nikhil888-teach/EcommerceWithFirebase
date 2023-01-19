import 'package:flutter/material.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          "Shope",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ));
  }
}
