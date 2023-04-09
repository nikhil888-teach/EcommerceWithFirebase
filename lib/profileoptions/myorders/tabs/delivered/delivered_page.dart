import 'package:ecommerce/profileoptions/myorders/tabs/delivered/deliverproduct_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class MyDelivered extends StatefulWidget {
  const MyDelivered({super.key});

  @override
  State<MyDelivered> createState() => _MyDeliveredState();
}

class _MyDeliveredState extends State<MyDelivered> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseDatabase.instance.ref(Constants.dorder).onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else {
              Map<dynamic, dynamic> data =
                  snapshot.data!.snapshot.value as dynamic;
              List<dynamic> list = [];
              list.clear();
              for (var element in data.values) {
                if (element[Constants.dstatus] == Constants.dAccepted &&
                    element[Constants.dUserid] ==
                        FirebaseAuth.instance.currentUser!.uid) {
                  list.add(element);
                }
              }
              list.sort(
                  (a, b) => b[Constants.dodate].compareTo(a[Constants.dodate]));
              if (list.length <= 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Lottie.asset("assets/image/process_order.json",
                              height: 300)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "No order in Delivered",
                          style: Text_Style.text_Theme(Constants.black_text, 20,
                              FontWeight.bold, context),
                        ),
                      ),
                      Text(
                        "Looks like you have not added anything to you cart. Go ahead & explore top categories",
                        textAlign: TextAlign.center,
                        style: Text_Style.text_Theme(Constants.black_text, 14,
                            FontWeight.normal, context),
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var dateTime = DateFormat('dd-MM-yyyy');
                    DateTime? time =
                        DateTime.tryParse(list[index][Constants.dodate]);
                    var formateDate = dateTime.format(time!);
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
                                            Constants.black_text,
                                            16,
                                            FontWeight.bold,
                                            context)),
                                    Text(
                                        list[index][Constants.dorderno]
                                            .toString(),
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            15,
                                            FontWeight.bold,
                                            context))
                                  ],
                                ),
                                Text(formateDate.toString(),
                                    style: Text_Style.text_Theme(
                                        Constants.grey_text,
                                        15,
                                        FontWeight.normal,
                                        context))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Row(
                                children: [
                                  Text(Constants.trackingNo,
                                      style: Text_Style.text_Theme(
                                          Constants.grey_text,
                                          15,
                                          FontWeight.normal,
                                          context)),
                                  Text(
                                      list[index][Constants.dtrackNum]
                                          .toString(),
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          15,
                                          FontWeight.w500,
                                          context))
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
                                            Constants.grey_text,
                                            15,
                                            FontWeight.normal,
                                            context)),
                                    Text(
                                        list[index][Constants.dTotalProduct]
                                            .toString(),
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            15,
                                            FontWeight.bold,
                                            context))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(Constants.total_amount,
                                        style: Text_Style.text_Theme(
                                            Constants.grey_text,
                                            15,
                                            FontWeight.normal,
                                            context)),
                                    Text(
                                        "\$" +
                                            list[index][Constants.dtotal]
                                                .toString(),
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            15,
                                            FontWeight.bold,
                                            context))
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                      style: ButtonStyle(
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  color: themeChange.darkTheme
                                                      ? Colors.white
                                                      : Colors.grey))),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              MyDeliveredProduct(
                                            orderNo: list[index]
                                                    [Constants.dorderno]
                                                .toString(),
                                            orderKey: list[index]
                                                    [Constants.dokey]
                                                .toString(),
                                            date: formateDate.toString(),
                                            address: list[index]
                                                [Constants.dShipAddress],
                                            payment: list[index]
                                                [Constants.dPayment],
                                            trackNo: list[index]
                                                [Constants.dtrackNum],
                                            totalProducts: list[index]
                                                    [Constants.dTotalProduct]
                                                .toString(),
                                            total: list[index]
                                                [Constants.dtotamt],
                                          ),
                                        ));
                                      },
                                      child: Text(
                                        Constants.detail,
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            15,
                                            FontWeight.w600,
                                            context),
                                      )),
                                  Text(
                                    Constants.delivered,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
          }),
    );
  }
}
