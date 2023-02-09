import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyCheckOut extends StatefulWidget {
  const MyCheckOut({Key? key}) : super(key: key);

  @override
  State<MyCheckOut> createState() => _MyCheckOutState();
}

class _MyCheckOutState extends State<MyCheckOut> {
  Map delivery = {
    0: "https://assets.turbologo.com/blog/en/2019/12/19084817/Fedex-logo.png",
    1: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR82GXLwWsRJ2TOxiWUdGCbvZqMbgAnImv8mQ&usqp=CAU",
    2: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWfao3ZxlQTc-WFo_DOKeFiaN0QL6XkmGmWg&usqp=CAU"
  };

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
          title: Text("Checkout",
              style: Text_Style.text_Theme(
                  Constants.black_text, 18, FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        Constants.shipping_address,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.bold),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jane Doe",
                                  style: Text_Style.text_Theme(
                                      Constants.black_text,
                                      14,
                                      FontWeight.w600),
                                ),
                                Text(
                                  Constants.change,
                                  style: Text_Style.text_Theme(
                                      Constants.red_text, 14, FontWeight.w600),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "3 Newbridge Court",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    14,
                                    FontWeight.normal),
                              ),
                            ),
                            Text("Chino Hills, CA 91709, United States",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    14,
                                    FontWeight.normal))
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                //Payment
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15, right: 20),
                        child: Text(
                          Constants.payment,
                          style: Text_Style.text_Theme(
                              Constants.black_text, 16, FontWeight.bold),
                        ),
                      ),
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.paypal_outlined,
                          color: Colors.blue,
                        ),
                      ))
                    ],
                  ),
                ),

                //Delivery Methods
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, right: 20),
                      child: Text(
                        Constants.delivery_method,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: delivery.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            focusColor: Colors.black,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network(
                                    delivery.entries.elementAt(index).value,
                                    height: 50,
                                    width: 100,
                                  ),
                                  Text(
                                    "2-3 days",
                                    style: Text_Style.text_Theme(
                                        Constants.grey_text,
                                        12,
                                        FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
