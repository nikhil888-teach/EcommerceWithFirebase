import 'package:flutter/material.dart';

class MyShopePage extends StatefulWidget {
  const MyShopePage({Key? key}) : super(key: key);

  @override
  State<MyShopePage> createState() => _MyShopePageState();
}

class _MyShopePageState extends State<MyShopePage> {
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
