import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyCheckOut extends StatefulWidget {
  const MyCheckOut({Key? key}) : super(key: key);

  @override
  State<MyCheckOut> createState() => _MyCheckOutState();
}

class _MyCheckOutState extends State<MyCheckOut> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: Text("Checkout",
              style: Text_Style.text_Theme(
                  Constants.black_text, 18, FontWeight.bold)),
        ),
      ),
    );
  }
}
