import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

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
        elevation: 1,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text("Order Details",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold, context)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(Constants.orderNo,
                          style: Text_Style.text_Theme(Constants.black_text, 16,
                              FontWeight.bold, context)),
                      Text("102003",
                          style: Text_Style.text_Theme(Constants.black_text, 16,
                              FontWeight.bold, context))
                    ],
                  ),
                  Text("05-12-2019",
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 16, FontWeight.normal, context))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  children: [
                    Text(Constants.trackingNo,
                        style: Text_Style.text_Theme(Constants.grey_text, 16,
                            FontWeight.normal, context)),
                    Text("IW3475453455",
                        style: Text_Style.text_Theme(
                            Constants.black_text, 16, FontWeight.w500, context))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("3",
                          style: Text_Style.text_Theme(Constants.black_text, 16,
                              FontWeight.normal, context)),
                      Text(Constants.item,
                          style: Text_Style.text_Theme(Constants.black_text, 16,
                              FontWeight.normal, context)),
                    ],
                  ),
                  Text(Constants.delivered,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Card(
                        child: Row(
                          children: [
                            Ink(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 5),
                                ]),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4)),
                                  child: Image.network(
                                    "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                    fit: BoxFit.fill,
                                    color: Colors.grey.shade300,
                                    colorBlendMode: BlendMode.multiply,
                                    height: 105,
                                    width: 105,
                                  ),
                                )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Pullover",
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            16,
                                            FontWeight.bold,
                                            context),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 7, top: 7),
                                      child: Row(
                                        children: [
                                          Text(
                                            Constants.color,
                                            style: Text_Style.text_Theme(
                                                Constants.grey_text,
                                                13,
                                                FontWeight.normal,
                                                context),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: Text(
                                              "Black",
                                              style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  13,
                                                  FontWeight.normal,
                                                  context),
                                            ),
                                          ),
                                          Text(
                                            Constants.size,
                                            style: Text_Style.text_Theme(
                                                Constants.grey_text,
                                                13,
                                                FontWeight.normal,
                                                context),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: Text(
                                              "L",
                                              style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  13,
                                                  FontWeight.normal,
                                                  context),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              Constants.unit,
                                              style: Text_Style.text_Theme(
                                                  Constants.grey_text,
                                                  13,
                                                  FontWeight.normal,
                                                  context),
                                            ),
                                            Text(
                                              "1",
                                              style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  14,
                                                  FontWeight.bold,
                                                  context),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              "51\$",
                                              style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  20,
                                                  FontWeight.bold,
                                                  context),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                Constants.ord_info,
                style: Text_Style.text_Theme(
                    Constants.black_text, 14, FontWeight.w600, context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.shipp_add,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 14, FontWeight.w200, context),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        softWrap: true,
                        "3 Newbridge Court ,Chino Hills, CA 91709, United States",
                        style: Text_Style.text_Theme(Constants.black_text, 14,
                            FontWeight.normal, context),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.pay_meth,
                    style: Text_Style.text_Theme(
                        Constants.grey_text, 14, FontWeight.w200, context),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.del_method,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 14, FontWeight.w200, context),
                    ),
                    Text(
                      softWrap: true,
                      "FedEx, 3 days, 15\$",
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal, context),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.discount,
                    style: Text_Style.text_Theme(
                        Constants.grey_text, 14, FontWeight.w200, context),
                  ),
                  Text(
                    softWrap: true,
                    "10%, Personal promo code",
                    style: Text_Style.text_Theme(
                        Constants.black_text, 14, FontWeight.normal, context),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.total_amount,
                      style: Text_Style.text_Theme(
                          Constants.grey_text, 14, FontWeight.w200, context),
                    ),
                    Text(
                      softWrap: true,
                      "133\$",
                      style: Text_Style.text_Theme(
                          Constants.black_text, 14, FontWeight.normal, context),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyDeliveredProduct(),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Text(
                          Constants.reorder,
                          style: Text_Style.text_Theme(Constants.black_text, 17,
                              FontWeight.w600, context),
                        ),
                      )),
                  Button_Style.button_Theme(Constants.lea_feed)
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
