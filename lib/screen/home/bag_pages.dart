import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      )),
                )
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50, left: 14, bottom: 25),
                      child: Text(
                        "My Bag",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.15,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 25),
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
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.69,
                                  height: 105,
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Pullover",
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              height: 25,
                                              width: 30,
                                              child: PopupMenuButton(
                                                icon: const Icon(
                                                  Icons.more_vert,
                                                  color: Colors.grey,
                                                ),
                                                itemBuilder: (context) => [
                                                  const PopupMenuItem(
                                                      child: Text(
                                                          "Add to favorities")),
                                                  const PopupMenuItem(
                                                      child: Text(
                                                          "Delete from the list"))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, top: 0),
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Color: ",
                                              style: TextStyle(
                                                  color: Color(0xff9B9B9B),
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Text(
                                                "Black",
                                                style: const TextStyle(
                                                    color: Color(0xff222222),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Text(
                                              "Size: ",
                                              style: const TextStyle(
                                                  color: Color(0xff9B9B9B),
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Text(
                                                "L",
                                                style: const TextStyle(
                                                    color: Color(0xff222222),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                              ClipOval(
                                                child: DecoratedBox(
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black,
                                                          blurRadius: 8,
                                                          spreadRadius: 4,
                                                          offset: Offset(0, 10),
                                                        ),
                                                      ]),
                                                  child: Container(
                                                    height: 36,
                                                    width: 36,
                                                    color: Colors.white,
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          CupertinoIcons.minus,
                                                          size: 20,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: const Text(
                                                  "1",
                                                  style: TextStyle(
                                                      color: Color(0xff222222),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              ClipOval(
                                                child: DecoratedBox(
                                                  decoration:
                                                      const BoxDecoration(
                                                          boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black,
                                                          blurRadius: 8,
                                                          spreadRadius: 4,
                                                          offset: Offset(0, 10),
                                                        ),
                                                      ]),
                                                  child: Container(
                                                    height: 36,
                                                    width: 36,
                                                    color: Colors.white,
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          CupertinoIcons.plus,
                                                          size: 20,
                                                        )),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              "51\$",
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Amount:",
                            style: TextStyle(
                                color: Color(0xff9B9B9B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "124\$",
                            style: TextStyle(
                                color: Color(0xff222222),
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Center(
                                child: Text(
                                  "CHECK OUT",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
