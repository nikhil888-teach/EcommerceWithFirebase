import 'package:ecommerce/screen/aftercheckout/add_address_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class MyShippingAddress extends StatefulWidget {
  const MyShippingAddress({Key? key}) : super(key: key);

  @override
  State<MyShippingAddress> createState() => _MyShippingAddressState();
}

class _MyShippingAddressState extends State<MyShippingAddress> {
  bool? checkaddress = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Constants.shipping_address,
            style: Text_Style.text_Theme(
                Constants.black_text, 16, FontWeight.bold, context),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAddressPage(),
                ));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseDatabase.instance
                .ref(Constants.dUser)
                .child(FirebaseAuth.instance.currentUser!.uid)
                .child(Constants.dAddress)
                .onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              } else {
                if (snapshot.data!.snapshot.value == null) {
                  return Center(
                      child: Lottie.asset(
                    "assets/image/empty_box.json",
                  ));
                } else {
                  Map<dynamic, dynamic> id =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  for (var element in id.values) {
                    list.add(element);
                  }

                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          child: Text(
                                            list[index][Constants.dfname]
                                                .toString(),
                                            style: Text_Style.text_Theme(
                                                Constants.black_text,
                                                14,
                                                FontWeight.w600,
                                                context),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyAddressPage(
                                                          id: list[index][
                                                                  Constants
                                                                      .daddressId]
                                                              .toString()),
                                                ));
                                          },
                                          child: Text(
                                            Constants.edit,
                                            style: Text_Style.text_Theme(
                                                Constants.red_text,
                                                14,
                                                FontWeight.w600,
                                                context),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        list[index][Constants.dSAddress]
                                            .toString(),
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            14,
                                            FontWeight.normal,
                                            context),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              list[index][Constants.dCity]
                                                      .toString() +
                                                  ", " +
                                                  list[index][Constants.dState]
                                                      .toString() +
                                                  " " +
                                                  list[index][Constants.dZcode]
                                                      .toString() +
                                                  ", " +
                                                  list[index]
                                                          [Constants.dCountry]
                                                      .toString(),
                                              style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  14,
                                                  FontWeight.normal,
                                                  context)),
                                          InkWell(
                                              onTap: () {
                                                FirebaseDatabase.instance
                                                    .ref(Constants.dUser)
                                                    .child(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .child(Constants.dAddress)
                                                    .child(list[index][Constants
                                                            .daddressId]
                                                        .toString())
                                                    .remove();
                                              },
                                              child: Icon(Icons.delete))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
              }
            }),
      ),
    );
  }
}
