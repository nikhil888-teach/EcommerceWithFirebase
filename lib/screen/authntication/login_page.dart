import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
                      Text(Constants.LOGIN,
                          style:
                              Text_Style.black_text_Theme(34, FontWeight.bold)),
                      const SizedBox(
                        height: 74,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        elevation: 2,
                        child: TextFormField(
                          autocorrect: true,
                          enableSuggestions: true,
                          enabled: true,
                          enableInteractiveSelection: true,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                              hintText: Constants.EMAIL,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        elevation: 2,
                        child: TextFormField(
                          autocorrect: true,
                          enableSuggestions: true,
                          enabled: true,
                          enableInteractiveSelection: true,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.grey,
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: Constants.PASSWORD,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(Constants.FORGOT_PASSWORD,
                              style: Text_Style.black_text_Theme(
                                  14, FontWeight.normal)),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyMainPage(),
                                ));
                          },
                          child: Button_Style.button_Theme(Constants.LOGIN)),
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
