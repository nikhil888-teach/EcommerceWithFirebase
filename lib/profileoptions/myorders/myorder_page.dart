import 'package:ecommerce/profileoptions/myorders/tabs/cancelled/cancelled_page.dart';
import 'package:ecommerce/profileoptions/myorders/tabs/delivered/delivered_page.dart';
import 'package:ecommerce/profileoptions/myorders/tabs/processing/process_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            title: Text("My Orders",
                style: Text_Style.text_Theme(
                    Constants.black_text, 18, FontWeight.bold, context)),
          ),
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TabBar(
                      labelPadding: EdgeInsets.symmetric(vertical: 7),
                      indicator: BoxDecoration(
                        color:
                            themeChange.darkTheme ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      unselectedLabelColor: themeChange.darkTheme
                          ? Colors.white
                          : Color(0xff222222),
                      unselectedLabelStyle: TextStyle(
                          color: themeChange.darkTheme
                              ? Colors.white
                              : Color(Constants.black_text),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      labelColor: themeChange.darkTheme
                          ? Colors.black
                          : Color(Constants.white_text),
                      labelStyle: TextStyle(
                          color: themeChange.darkTheme
                              ? Colors.white
                              : Color(Constants.black_text),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      tabs: [
                        Text(Constants.processing),
                        Text(Constants.delivered),
                        Text(Constants.cancelled)
                      ]),
                ),
              ),
              Expanded(
                  child: TabBarView(
                      children: [MyProcess(), MyDelivered(), MyCancelled()]))
            ],
          ),
        ),
      ),
    );
  }
}
