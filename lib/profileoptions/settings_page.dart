import 'package:ecommerce/screen/authntication/login_page.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screen/authntication/forgot_pass.dart';
import '../widgets/scafoldmsg_theme.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({Key? key}) : super(key: key);

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController nPasswordController = TextEditingController();
  TextEditingController rPasswordController = TextEditingController();
  bool checkSales = true;
  bool checkArr = false;
  bool checkStaus = false;
  User? user;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    user = await FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid);
    databaseReference.once().then((value) {
      fnameController.text =
          value.snapshot.child(Constants.duname).value.toString();
      emailController.text =
          value.snapshot.child(Constants.demail).value.toString();
    });

    return WillPopScope(
      onWillPop: () {
        if (fnameController.text.isNotEmpty) {
          databaseReference.update({Constants.duname: fnameController.text});
        }
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyMainPage(),
            ));
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text("Settings",
              style: Text_Style.text_Theme(
                  Constants.black_text, 18, FontWeight.bold, context)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.pers_info,
                  style: Text_Style.text_Theme(
                      Constants.black_text, 14, FontWeight.w600, context),
                ),
                const SizedBox(
                  height: 8,
                ),
                Textformfield_style.textField(fnameController,
                    Constants.full_name, TextInputType.visiblePassword),
                const SizedBox(
                  height: 8,
                ),
                Textformfield_style.textField(emailController, Constants.EMAIL,
                    TextInputType.visiblePassword),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.PASSWORD,
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.w600, context),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(34),
                                  topRight: Radius.circular(34))),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: 15,
                                  left: 15,
                                  right: 15,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      width: 60,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      Constants.pass_change,
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          18,
                                          FontWeight.bold,
                                          context),
                                    ),
                                  ),
                                  Textformfield_style.textField(
                                      cPasswordController,
                                      Constants.old_pass,
                                      TextInputType.visiblePassword),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MyForgotPass(),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(Constants.FORGOT_PASSWORD,
                                            style: Text_Style.text_Theme(
                                                Constants.grey_text,
                                                14,
                                                FontWeight.normal,
                                                context)),
                                      ),
                                    ),
                                  ),
                                  Textformfield_style.textField(
                                      nPasswordController,
                                      Constants.new_pass,
                                      TextInputType.visiblePassword),
                                  Textformfield_style.textField(
                                      rPasswordController,
                                      Constants.repeat_pass,
                                      TextInputType.visiblePassword),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _changePassword(cPasswordController.text,
                                          rPasswordController.text);
                                    },
                                    child: Button_Style.button_Theme(
                                        Constants.save_pass),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        Constants.change,
                        style: TextStyle(
                            color: Color(Constants.red_text),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Textformfield_style.textField(cPasswordController,
                      Constants.PASSWORD, TextInputType.visiblePassword),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  Constants.notification,
                  style: Text_Style.text_Theme(
                      Constants.black_text, 14, FontWeight.w600, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.sales,
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal, context),
                    ),
                    Switch(
                      activeColor: Colors.green,
                      value: checkSales,
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          checkSales = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.new_arr,
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal, context),
                    ),
                    Switch(
                      activeColor: Colors.green,
                      value: checkArr,
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          checkArr = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.delivery_status,
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal, context),
                    ),
                    Switch(
                      activeColor: Colors.green,
                      value: checkStaus,
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          checkStaus = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.darktheme,
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal, context),
                    ),
                    Switch(
                      activeColor: Colors.green,
                      value: themeChange.darkTheme,
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          themeChange.darkTheme = value;
                          themeChange.themePreference.setDarkTheme(value);
                        });
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _signOut();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Constants.LOGIN_OUT,
                          style: Text_Style.text_Theme(Constants.black_text, 20,
                              FontWeight.w600, context),
                        ),
                        Icon(
                          Icons.logout,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _changePassword(String currentPassword, String newPassword) {
    Navigator.pop(context);
    final cred = EmailAuthProvider.credential(
        email: user?.email ?? '', password: currentPassword);

    user?.reauthenticateWithCredential(cred).then((value) {
      user?.updatePassword(newPassword).then((_) {
        Scaffold_msg.toastMessage(context, "Chnaged Successfully");
      }).catchError((error) {
        Scaffold_msg.toastMessage(context, error.toString());
        //Error, show something
      });
    }).catchError((err) {
      Scaffold_msg.toastMessage(context, err.toString());
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => print(user));

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MyLoginPage(),
        ),
        (Route<dynamic> route) => false);
  }
}
