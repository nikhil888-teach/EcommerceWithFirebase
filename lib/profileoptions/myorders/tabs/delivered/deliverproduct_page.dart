import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyDeliveredProduct extends StatefulWidget {
  const MyDeliveredProduct({super.key});

  @override
  State<MyDeliveredProduct> createState() => _MyDeliveredProductState();
}

class _MyDeliveredProductState extends State<MyDeliveredProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text("Order Details",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(Constants.orderNo,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.bold)),
                    Text("102003",
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.bold))
                  ],
                ),
                Text("05-12-2019",
                    style: Text_Style.text_Theme(
                        Constants.grey_text, 16, FontWeight.normal))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  Text(Constants.trackingNo,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 16, FontWeight.normal)),
                  Text("IW3475453455",
                      style: Text_Style.text_Theme(
                          Constants.black_text, 16, FontWeight.w500))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("3",
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.normal)),
                    Text(Constants.item,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.normal)),
                  ],
                ),
                Text(
                  Constants.delivered,
                  style: Text_Style.text_Theme(
                      Constants.green_text, 14, FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
