import 'package:ecommerce/profileoptions/myorders/tabs/delivered/deliverproduct_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyDelivered extends StatefulWidget {
  const MyDelivered({super.key});

  @override
  State<MyDelivered> createState() => _MyDeliveredState();
}

class _MyDeliveredState extends State<MyDelivered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
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
                          Text(Constants.quantity,
                              style: Text_Style.text_Theme(
                                  Constants.grey_text, 16, FontWeight.normal)),
                          Text("3",
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 16, FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
                          Text(Constants.total_amount,
                              style: Text_Style.text_Theme(
                                  Constants.grey_text, 16, FontWeight.normal)),
                          Text("\$112",
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 16, FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color(Constants.black_text)),
                                        borderRadius:
                                            BorderRadius.circular(24)))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyDeliveredProduct(),
                              ));
                            },
                            child: Text(
                              Constants.detail,
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 13, FontWeight.w600),
                            )),
                        Text(
                          Constants.delivered,
                          style: Text_Style.text_Theme(
                              Constants.green_text, 14, FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
