import 'package:ecommerce/screen/authntication/login_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';

import '../home/main_page.dart';

class MySignInPage extends StatefulWidget {
  const MySignInPage({Key? key}) : super(key: key);

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      Text(Constants.SIGNUP,
                          style: Text_Style.text_Theme(Constants.black_text, 34,
                              FontWeight.bold, context)),
                      const SizedBox(
                        height: 74,
                      ),
                      Textformfield_style.textField(name, Constants.NAME),
                      const SizedBox(
                        height: 8,
                      ),
                      Textformfield_style.textField(email, Constants.EMAIL),
                      const SizedBox(
                        height: 8,
                      ),
                      Textformfield_style.textField(
                          password, Constants.PASSWORD),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyLoginPage(),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(Constants.ALREADY_ACCOUNT,
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    14,
                                    FontWeight.normal,
                                    context)),
                            const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyMainPage(),
                                ));
                          },
                          child: Button_Style.button_Theme(Constants.SIGNUP)),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      const Center(child: Text(Constants.OR_SIGN_WITH_SOCIAL)),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 34),
                            child: Image.asset(
                              "assets/image/google.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
