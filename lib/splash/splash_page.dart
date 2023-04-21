import 'dart:async';

import 'package:ecommerce/nointernet/nointernet_page.dart';
import 'package:ecommerce/screen/authntication/sign_page.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({super.key});

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer(Duration(seconds: 3), () {
      var user = FirebaseAuth.instance.currentUser;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => user == null ? MySignInPage() : MyMainPage(),
          ));
    });
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/image/logo.png",
                scale: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
