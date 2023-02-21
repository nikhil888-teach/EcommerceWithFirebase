import 'package:ecommerce/profileoptions/myorders/tabs/cancelled/cancelled_page.dart';
import 'package:ecommerce/profileoptions/myorders/tabs/delivered/delivered_page.dart';
import 'package:ecommerce/profileoptions/myorders/tabs/processing/process_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            centerTitle: true,
            leading: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            title: Text("My Orders",
                style: Text_Style.text_Theme(
                    Constants.black_text, 18, FontWeight.bold)),
          ),
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TabBar(
                      labelPadding: EdgeInsets.symmetric(vertical: 10),
                      indicator: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      unselectedLabelColor: Color(0xff222222),
                      unselectedLabelStyle: Text_Style.text_Theme(
                          Constants.black_text, 16, FontWeight.normal),
                      labelColor: Color(Constants.white_text),
                      labelStyle: Text_Style.text_Theme(
                          Constants.black_text, 16, FontWeight.bold),
                      tabs: [
                        Text(Constants.delivered),
                        Text(Constants.processing),
                        Text(Constants.cancelled)
                      ]),
                ),
              ),
              Expanded(
                  child: TabBarView(
                      children: [MyDelivered(), MyProcess(), MyCancelled()]))
            ],
          ),
        ),
      ),
    );
  }
}
