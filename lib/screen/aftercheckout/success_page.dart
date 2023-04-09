import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MySuccessPage extends StatefulWidget {
  const MySuccessPage({Key? key}) : super(key: key);

  @override
  State<MySuccessPage> createState() => _MySuccessPageState();
}

class _MySuccessPageState extends State<MySuccessPage> {
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
                        "assets/image/success.png",
                        scale: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        Constants.success,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 34, FontWeight.bold, context),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        Constants.succ_text,
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
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyMainPage(
                              currentIndex: 0,
                            ),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    child: Button_Style.button_Theme(Constants.conti_shop)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
