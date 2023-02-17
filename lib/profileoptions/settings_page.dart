import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({Key? key}) : super(key: key);

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController nPassword = TextEditingController();
  TextEditingController rPassword = TextEditingController();
  bool checkSales = true;
  bool checkArr = false;
  bool checkStaus = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text("Settings",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold)),
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
                    Constants.black_text, 14, FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Textformfield_style.textField(fname, Constants.full_name),
              const SizedBox(
                height: 8,
              ),
              Textformfield_style.textField(email, Constants.EMAIL),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.PASSWORD,
                    style: Text_Style.text_Theme(
                        Constants.black_text, 14, FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34),
                                topRight: Radius.circular(34))),
                        backgroundColor: Color(Constants.white_text),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                                        FontWeight.bold),
                                  ),
                                ),
                                Textformfield_style.textField(
                                    cPassword, Constants.old_pass),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(Constants.FORGOT_PASSWORD,
                                        style: Text_Style.text_Theme(
                                            Constants.grey_text,
                                            14,
                                            FontWeight.normal)),
                                  ),
                                ),
                                Textformfield_style.textField(
                                    nPassword, Constants.new_pass),
                                Textformfield_style.textField(
                                    rPassword, Constants.repeat_pass),
                                SizedBox(
                                  height: 15,
                                ),
                                Button_Style.button_Theme(Constants.save_pass)
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      Constants.change,
                      style: Text_Style.text_Theme(
                          Constants.red_text, 14, FontWeight.w600),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Textformfield_style.textField(
                    cPassword, Constants.PASSWORD),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                Constants.notification,
                style: Text_Style.text_Theme(
                    Constants.black_text, 14, FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.sales,
                    style: Text_Style.text_Theme(
                        Constants.black_text, 14, FontWeight.normal),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: checkSales,
                    onChanged: (value) {
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
                        Constants.black_text, 14, FontWeight.normal),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: checkArr,
                    onChanged: (value) {
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
                        Constants.black_text, 14, FontWeight.normal),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: checkStaus,
                    onChanged: (value) {
                      setState(() {
                        checkStaus = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
