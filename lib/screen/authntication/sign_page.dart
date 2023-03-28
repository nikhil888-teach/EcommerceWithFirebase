import 'dart:io';

import 'package:ecommerce/screen/authntication/login_page.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MySignInPage extends StatefulWidget {
  const MySignInPage({Key? key}) : super(key: key);

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;
  XFile? file;
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
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
                            style: Text_Style.text_Theme(Constants.black_text,
                                34, FontWeight.bold, context)),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ClipOval(
                            child: Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipOval(
                                  child: file == null
                                      ? InkWell(
                                          onTap: () async {
                                            var image =
                                                await imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (!mounted) return;
                                            setState(() {
                                              file = image;
                                            });
                                          },
                                          child: const SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Icon(
                                              CupertinoIcons.profile_circled,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                        )
                                      : Image.file(
                                          File(file!.path),
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
                              signUpAndAddData(
                                  name.text.trim(),
                                  email.text.trim(),
                                  password.text.trim(),
                                  file!);
                              name.clear();
                              email.clear();
                              password.clear();
                              file = null;
                            },
                            child: loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  )
                                : Button_Style.button_Theme(Constants.SIGNUP)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Center(
                              child: Text(Constants.OR_SIGN_WITH_SOCIAL,
                                  style: Text_Style.text_Theme(
                                      Constants.black_text,
                                      14,
                                      FontWeight.normal,
                                      context))),
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
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  void signUpAndAddData(
      String name, String email, String password, XFile file) {
    setState(() {
      loading = true;
    });
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      var id = await value.user!.uid;
      Reference reference =
          FirebaseStorage.instance.ref("User/" + id + "Profile");
      UploadTask uploadTask = reference.putFile(File(file.path));
      Future.value(uploadTask).then((value) async {
        var imageLink = await reference.getDownloadURL();
        DatabaseReference databaseReference =
            FirebaseDatabase.instance.ref(Constants.dUser).child(id);
        databaseReference.set({
          Constants.demail: email,
          Constants.dProimage: imageLink,
          Constants.duname: name,
        }).then((value) {
          setState(() {
            loading = false;
          });
          Scaffold_msg.toastMessage(context, "Sign up successfully");
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
      });
    }).catchError((onError) {
      setState(() {
        loading = false;
      });
      Scaffold_msg.toastMessage(context, onError);
    });
  }
}
