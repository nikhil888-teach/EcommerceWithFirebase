import 'package:ecommerce/functions/cartcount.dart';
import 'package:ecommerce/screen/aftercheckout/steppercheckout_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lottie/lottie.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  int total = 0;
  int? productLength;
  DataSnapshot? snapshotData;

  @override
  void initState() {
    totalPrice();
    super.initState();
  }

  String? orderid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Constants.My_Bag,
            style: Text_Style.text_Theme(
                Constants.black_text, 20, FontWeight.bold, context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: StreamBuilder(
                        stream: FirebaseDatabase.instance
                            .ref(Constants.dUser)
                            .child(FirebaseAuth.instance.currentUser!.uid)
                            .onValue,
                        builder:
                            (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          } else if (!snapshot.data!.snapshot
                              .hasChild(Constants.dAddToCart)) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 25),
                              child: Column(
                                children: [
                                  Center(
                                      child: Lottie.asset(
                                    "assets/image/emptycart.json",
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      "Your Cart is Empty",
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          20,
                                          FontWeight.bold,
                                          context),
                                    ),
                                  ),
                                  Text(
                                    "Looks like you have not added anything to you cart. Go ahead & explore top categories",
                                    textAlign: TextAlign.center,
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        14,
                                        FontWeight.normal,
                                        context),
                                  )
                                ],
                              ),
                            );
                          }
                          Map<dynamic, dynamic> map = snapshot.data!.snapshot
                              .child(Constants.dAddToCart)
                              .value as dynamic;
                          List<dynamic> list = [];
                          list.clear();
                          for (var element in map.values) {
                            list.add(element);
                          }
                          productLength = list.length;
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 25),
                                  child: Card(
                                    child: Row(
                                      children: [
                                        Ink(
                                            decoration:
                                                const BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 0),
                                                  blurRadius: 5),
                                            ]),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4),
                                                      bottomLeft:
                                                          Radius.circular(4)),
                                              child: Image.network(
                                                list[index][Constants.dimages]
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                color: Colors.grey.shade300,
                                                colorBlendMode:
                                                    BlendMode.multiply,
                                                height: 105,
                                                width: 105,
                                              ),
                                            )),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        list[index][Constants
                                                                .dPname]
                                                            .toString(),
                                                        style: Text_Style
                                                            .text_Theme(
                                                                Constants
                                                                    .black_text,
                                                                16,
                                                                FontWeight.bold,
                                                                context),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 16),
                                                        child: Container(
                                                          height: 25,
                                                          width: 30,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            onPressed: () {
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref(Constants
                                                                      .dUser)
                                                                  .child(FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid)
                                                                  .child(Constants
                                                                      .dAddToCart)
                                                                  .child(list[index]
                                                                          [
                                                                          Constants
                                                                              .dcheckId]
                                                                      .toString())
                                                                  .remove();

                                                              if (!mounted)
                                                                return;
                                                              setState(() {
                                                                getTotalCart();
                                                              });
                                                              totalPrice();
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15, top: 0),
                                                  child: Row(
                                                    children: [
                                                      list[index][Constants
                                                                  .dColor] ==
                                                              null
                                                          ? Container()
                                                          : Row(
                                                              children: [
                                                                Text(
                                                                  Constants
                                                                      .color,
                                                                  style: Text_Style.text_Theme(
                                                                      Constants
                                                                          .grey_text,
                                                                      13,
                                                                      FontWeight
                                                                          .normal,
                                                                      context),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          15),
                                                                  child: Icon(
                                                                    Icons
                                                                        .circle,
                                                                    size: 20,
                                                                    color: Color(list[
                                                                            index]
                                                                        [
                                                                        Constants
                                                                            .dColor]),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                      Text(
                                                        Constants.size,
                                                        style: Text_Style
                                                            .text_Theme(
                                                                Constants
                                                                    .grey_text,
                                                                13,
                                                                FontWeight
                                                                    .normal,
                                                                context),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 15),
                                                        child: Text(
                                                          list[index][Constants
                                                                      .dSize] ==
                                                                  null
                                                              ? "Free size"
                                                              : list[index][
                                                                      Constants
                                                                          .dSize]
                                                                  .toString(),
                                                          style: Text_Style
                                                              .text_Theme(
                                                                  Constants
                                                                      .black_text,
                                                                  13,
                                                                  FontWeight
                                                                      .normal,
                                                                  context),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ClipOval(
                                                          child: DecoratedBox(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black,
                                                                    blurRadius:
                                                                        8,
                                                                    spreadRadius:
                                                                        4,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            10),
                                                                  ),
                                                                ]),
                                                            child: Container(
                                                              height: 36,
                                                              width: 36,
                                                              color:
                                                                  Colors.white,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    int quantity =
                                                                        int.parse(
                                                                            list[index][Constants.dQuantity].toString());
                                                                    int price = int.parse(list[index]
                                                                            [
                                                                            Constants.dSPrice]
                                                                        .toString());
                                                                    decrementQuantity(
                                                                        quantity,
                                                                        price,
                                                                        list[index][Constants.dcheckId]
                                                                            .toString());
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    CupertinoIcons
                                                                        .minus,
                                                                    size: 20,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            list[index][Constants
                                                                    .dQuantity]
                                                                .toString(),
                                                            style: Text_Style
                                                                .text_Theme(
                                                                    Constants
                                                                        .black_text,
                                                                    14,
                                                                    FontWeight
                                                                        .bold,
                                                                    context),
                                                          ),
                                                        ),
                                                        ClipOval(
                                                          child: DecoratedBox(
                                                            decoration:
                                                                const BoxDecoration(
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black,
                                                                    blurRadius:
                                                                        8,
                                                                    spreadRadius:
                                                                        4,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            10),
                                                                  ),
                                                                ]),
                                                            child: Container(
                                                              height: 36,
                                                              width: 36,
                                                              color:
                                                                  Colors.white,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    int quantity =
                                                                        int.parse(
                                                                            list[index][Constants.dQuantity].toString());

                                                                    int price = int.parse(list[index]
                                                                            [
                                                                            Constants.dSPrice]
                                                                        .toString());
                                                                    incrementQuantity(
                                                                        quantity,
                                                                        price,
                                                                        list[index][Constants.dcheckId]
                                                                            .toString());
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    CupertinoIcons
                                                                        .plus,
                                                                    size: 20,
                                                                  )),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                        child: Text(
                                                          "₹" +
                                                              list[index][Constants
                                                                      .dSPrice]
                                                                  .toString(),
                                                          style: Text_Style
                                                              .text_Theme(
                                                                  Constants
                                                                      .black_text,
                                                                  20,
                                                                  FontWeight
                                                                      .bold,
                                                                  context),
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }),
                  )
                ]),
              ]),
        ),
      ),
      bottomSheet: total == 0
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Constants.total_amount,
                          style: Text_Style.text_Theme(Constants.grey_text, 14,
                              FontWeight.w500, context),
                        ),
                        Text(
                          "₹" + total.toString(),
                          style: Text_Style.text_Theme(Constants.black_text, 18,
                              FontWeight.w900, context),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyStepperCheckOutPage(
                                id: orderid.toString(),
                                total: total,
                                productLength: productLength!),
                          ));
                        },
                        child: Button_Style.button_Theme(Constants.check_out)),
                  ),
                ],
              ),
            ),
    ));
  }

  void totalPrice() {
    total = 0;
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(Constants.dAddToCart);
    databaseReference.orderByKey().once().then((value) {
      if (!mounted) return;

      setState(() {
        if (value.snapshot.children.isEmpty) {
          total = 0;
          print(total);
        }
        value.snapshot.children.forEach((element) {
          if (!mounted) return;
          total += int.parse(element.child(Constants.dtotamt).value.toString());
        });
      });
    });
  }

  void decrementQuantity(int quantity, int price, String key) {
    if (quantity > 1) {
      quantity--;
      FirebaseDatabase.instance
          .ref(Constants.dUser)
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(Constants.dAddToCart)
          .child(key)
          .update({
        Constants.dQuantity: quantity,
        Constants.dtotamt: quantity * price
      });
      totalPrice();
    } else {
      totalPrice();
    }
  }

  void incrementQuantity(int quantity, int price, String key) {
    quantity++;
    FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(Constants.dAddToCart)
        .child(key)
        .update({
      Constants.dQuantity: quantity,
      Constants.dtotamt: quantity * price
    });
    totalPrice();
  }
}
