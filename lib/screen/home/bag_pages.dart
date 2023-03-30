import 'package:ecommerce/screen/aftercheckout/steppercheckout_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:lottie/lottie.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  int total = 0;

  @override
  void initState() {
    totalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(Constants.My_Bag,
            style: Text_Style.text_Theme(
                Constants.black_text, 20, FontWeight.bold, context)),
      ),
      body: total == 0
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Center(
                      child: Lottie.asset(
                    "assets/image/emptycart.json",
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Your Cart is Empty",
                      style: Text_Style.text_Theme(
                          Constants.black_text, 20, FontWeight.bold, context),
                    ),
                  ),
                  Text(
                    "Looks like you have not added anything to you cart. Go ahead & explore top categories",
                    textAlign: TextAlign.center,
                    style: Text_Style.text_Theme(
                        Constants.black_text, 14, FontWeight.normal, context),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 1.6,
                            child: FirebaseAnimatedList(
                                query: FirebaseDatabase.instance
                                    .ref(Constants.dUser)
                                    .child(
                                        FirebaseAuth.instance.currentUser!.uid)
                                    .child(Constants.dAddToCart),
                                defaultChild: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                ),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder:
                                    (context, snapshot, animation, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 25),
                                    child: Card(
                                      child: Row(
                                        children: [
                                          Ink(
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
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
                                                  snapshot
                                                      .child(Constants.dimages)
                                                      .value
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
                                              padding: const EdgeInsets.only(
                                                  left: 15),
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
                                                          snapshot
                                                              .child(Constants
                                                                  .dPname)
                                                              .value
                                                              .toString(),
                                                          style: Text_Style
                                                              .text_Theme(
                                                                  Constants
                                                                      .black_text,
                                                                  16,
                                                                  FontWeight
                                                                      .bold,
                                                                  context),
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          width: 30,
                                                          child:
                                                              PopupMenuButton(
                                                            icon: const Icon(
                                                              Icons.more_vert,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            itemBuilder:
                                                                (context) => [
                                                              PopupMenuItem(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () {},
                                                                child: Text(
                                                                    Constants
                                                                        .ADD_FAVORITE),
                                                              )),
                                                              PopupMenuItem(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () {
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
                                                                      .child(snapshot
                                                                          .key
                                                                          .toString())
                                                                      .remove();
                                                                  totalPrice();

                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    Constants
                                                                        .delete_list),
                                                              ))
                                                            ],
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
                                                        snapshot
                                                                    .child(Constants
                                                                        .dColor)
                                                                    .value ==
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
                                                                    child: Text(
                                                                      snapshot
                                                                          .child(
                                                                              Constants.dColor)
                                                                          .value
                                                                          .toString(),
                                                                      style: Text_Style.text_Theme(
                                                                          Constants
                                                                              .black_text,
                                                                          13,
                                                                          FontWeight
                                                                              .normal,
                                                                          context),
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
                                                            snapshot
                                                                        .child(Constants
                                                                            .dSize)
                                                                        .value ==
                                                                    null
                                                                ? "Free size"
                                                                : snapshot
                                                                    .child(Constants
                                                                        .dSize)
                                                                    .value
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
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          int quantity = int.parse(snapshot
                                                                              .child(Constants.dQuantity)
                                                                              .value
                                                                              .toString());
                                                                          int price = int.parse(snapshot
                                                                              .child(Constants.dSPrice)
                                                                              .value
                                                                              .toString());
                                                                          decrementQuantity(
                                                                              quantity,
                                                                              price,
                                                                              snapshot.key.toString());
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          CupertinoIcons
                                                                              .minus,
                                                                          size:
                                                                              20,
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
                                                              snapshot
                                                                  .child(Constants
                                                                      .dQuantity)
                                                                  .value
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
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          int quantity = int.parse(snapshot
                                                                              .child(Constants.dQuantity)
                                                                              .value
                                                                              .toString());

                                                                          int price = int.parse(snapshot
                                                                              .child(Constants.dSPrice)
                                                                              .value
                                                                              .toString());
                                                                          incrementQuantity(
                                                                              quantity,
                                                                              price,
                                                                              snapshot.key.toString());
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          CupertinoIcons
                                                                              .plus,
                                                                          size:
                                                                              20,
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
                                                            snapshot
                                                                    .child(Constants
                                                                        .dSPrice)
                                                                    .value
                                                                    .toString() +
                                                                "\$",
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
                                }),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
      bottomNavigationBar: total == 0
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
                          total.toString() + "\$",
                          style: Text_Style.text_Theme(Constants.black_text, 18,
                              FontWeight.w900, context),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyStepperCheckOutPage(),
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
