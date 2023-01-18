import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

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
                      Text("Login",
                          style: google_fonts.GoogleFonts.roboto(
                              fontSize: 34, fontWeight: FontWeight.bold)),
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
                              hintText: "Email",
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
                              hintText: "Password",
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
                          Text(
                            "Forgot your password",
                            style: google_fonts.GoogleFonts.roboto(
                              fontSize: 14,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.red,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: google_fonts.GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      const Center(
                          child: Text("Or sign up with Social account")),
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
