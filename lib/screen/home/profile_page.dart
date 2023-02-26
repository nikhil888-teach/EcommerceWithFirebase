import 'package:ecommerce/profileoptions/myorders/myorder_page.dart';
import 'package:ecommerce/profileoptions/settings_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  Map map = {
    0: "My orders",
    1: "Shipping addresses",
    2: "Payment methods",
    3: "Promocodes",
    4: "My reviews",
    5: "Settings"
  };
  List pages = [
    MyOrderPage(),
    MySettingPage(),
    MySettingPage(),
    MySettingPage(),
    MySettingPage(),
    MySettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 18),
                      child: Text(
                        Constants.my_profile,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 34, FontWeight.bold, context),
                      ),
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.red,
                            child: ClipOval(
                                child: Image.network(
                                    'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Matilda Brown",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    18,
                                    FontWeight.bold,
                                    context),
                              ),
                              Text(
                                "matildabrown@mail.com",
                                style: Text_Style.text_Theme(
                                    Constants.grey_text,
                                    14,
                                    FontWeight.normal,
                                    context),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: map.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => pages[index],
                              ));
                            },
                            title: Text(
                              map.entries.elementAt(index).value,
                              style: Text_Style.text_Theme(Constants.black_text,
                                  20, FontWeight.w500, context),
                            ),
                            trailing: const Icon(
                              CupertinoIcons.forward,
                              color: Color(0xff9B9B9B),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
