import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      Text(Constants.LOGIN,
                          style: Text_Style.text_Theme(Constants.black_text, 34,
                              FontWeight.bold, context)),
                      const SizedBox(
                        height: 74,
                      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(Constants.FORGOT_PASSWORD,
                              style: Text_Style.text_Theme(Constants.black_text,
                                  14, FontWeight.normal, context)),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.red,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text.trim(),
                                    password: password.text.trim())
                                .then((value) {
                              Scaffold_msg.toastMessage(
                                  context, "Sign in successfully");
                              setState(() {
                                loading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyMainPage(),
                                  ));
                            }).catchError((onError) {
                              setState(() {
                                loading = false;
                              });
                              Scaffold_msg.toastMessage(context, onError);
                            });
                          },
                          child: loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                )
                              : Button_Style.button_Theme(Constants.LOGIN)),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        Constants.OR_SIGN_WITH_SOCIAL,
                        style: Text_Style.text_Theme(Constants.black_text, 14,
                            FontWeight.normal, context),
                      )),
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
