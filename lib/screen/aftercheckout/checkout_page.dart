import 'package:ecommerce/screen/aftercheckout/add_address_page.dart';
import 'package:ecommerce/screen/aftercheckout/success_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeChange = Provider.of<ThemeProvider>(context);
    return SafeArea(
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
          title: Text("Checkout",
              style: Text_Style.text_Theme(
                  Constants.black_text, 18, FontWeight.bold, context)),
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
                            Constants.black_text, 16, FontWeight.bold, context),
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
                                      FontWeight.w600,
                                      context),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => MyAddressPage(),
                                    ));
                                  },
                                  child: Text(Constants.change,
                                      style: TextStyle(
                                          color: Color(Constants.red_text),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
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
                                    FontWeight.normal,
                                    context),
                              ),
                            ),
                            Text("Chino Hills, CA 91709, United States",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    14,
                                    FontWeight.normal,
                                    context))
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
                          style: Text_Style.text_Theme(Constants.black_text, 16,
                              FontWeight.bold, context),
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
                            Constants.black_text, 16, FontWeight.bold, context),
                      ),
                    ),
                    Container(
                      height: 80,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: delivery.length,
                        itemBuilder: (context, index) {
                          return Ink(
                            decoration: BoxDecoration(
                                color: themeChange.darkTheme
                                    ? Colors.black
                                    : Colors.white),
                            child: InkWell(
                              onTap: () {},
                              splashColor: Colors.red.shade100,
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
                                          FontWeight.normal,
                                          context),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),

                //order totaldetail
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Constants.order,
                            style: Text_Style.text_Theme(Constants.grey_text,
                                14, FontWeight.normal, context),
                          ),
                          Text(
                            "₹112",
                            style: Text_Style.text_Theme(Constants.black_text,
                                16, FontWeight.bold, context),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Constants.delivery,
                              style: Text_Style.text_Theme(Constants.grey_text,
                                  14, FontWeight.normal, context),
                            ),
                            Text(
                              "₹15",
                              style: Text_Style.text_Theme(Constants.black_text,
                                  16, FontWeight.bold, context),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Constants.summary,
                            style: Text_Style.text_Theme(Constants.grey_text,
                                16, FontWeight.w500, context),
                          ),
                          Text(
                            "₹127",
                            style: Text_Style.text_Theme(Constants.black_text,
                                16, FontWeight.bold, context),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MySuccessPage(),
                            ));
                      },
                      child: Button_Style.button_Theme(Constants.submit)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
