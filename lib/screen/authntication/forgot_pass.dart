import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyForgotPass extends StatefulWidget {
  const MyForgotPass({Key? key}) : super(key: key);

  @override
  State<MyForgotPass> createState() => _MyForgotPassState();
}

class _MyForgotPassState extends State<MyForgotPass> {
  TextEditingController email = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('form is invalid');
    }
  }

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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 34,
                        ),
                        Text(Constants.FORGOT_PASSWORD2,
                            style: Text_Style.text_Theme(Constants.black_text,
                                34, FontWeight.bold, context)),
                        const SizedBox(
                          height: 74,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Textformfield_style.textField(
                            email, Constants.EMAIL, TextInputType.emailAddress),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        GestureDetector(
                            onTap: () {
                              validateAndSave();
                              if (email.text.isEmpty) {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(const SnackBar(
                                      content:
                                          Text("Please fill all the field")));
                              } else {
                                setState(() {
                                  loading = true;
                                });

                                FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                        email: email.text.trim())
                                    .then((value) {
                                  Scaffold_msg.toastMessage(
                                      context, "Sent Request Successfully");
                                  setState(() {
                                    loading = false;
                                  });
                                  Navigator.pop(context);
                                }).catchError((onError) {
                                  setState(() {
                                    loading = false;
                                  });
                                  Scaffold_msg.toastMessage(
                                      context, onError.toString());
                                });
                              }
                            },
                            child: loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  )
                                : Button_Style.button_Theme(
                                    Constants.SEND_REQUEST)),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
