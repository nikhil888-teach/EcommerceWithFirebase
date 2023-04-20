import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyNoInternetPage extends StatefulWidget {
  const MyNoInternetPage({super.key});

  @override
  State<MyNoInternetPage> createState() => _MyNoInternetPageState();
}

class _MyNoInternetPageState extends State<MyNoInternetPage> {
  StreamSubscription? connection;
  bool isoffline = false;
  void checkInternetConnection() async {
    connection = await Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        if (!mounted) return;
        setState(() {
          isoffline = true;
        });
      } else if (event == ConnectivityResult.mobile) {
        if (!mounted) return;
        setState(() {
          isoffline = false;
        });
      } else if (event == ConnectivityResult.wifi) {
        if (!mounted) return;
        setState(() {
          isoffline = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        "assets/image/nointernet.png",
                        scale: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        Constants.noInternet,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 34, FontWeight.bold, context),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        Constants.noInternetMsg,
                        style: Text_Style.text_Theme(Constants.black_text, 15,
                            FontWeight.normal, context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                    onTap: () async {},
                    child: Button_Style.button_Theme(Constants.try_again)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
