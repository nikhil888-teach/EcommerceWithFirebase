import 'package:ecommerce/screen/products/product_view.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Stack(fit: StackFit.expand, children: [
                Image.asset(
                  "assets/image/homebanner.png",
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 40,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        Constants.FASHION,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        Constants.SALE,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Button_Style.button_Theme(
                                    Constants.CHECK))),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              Constants.NEW,
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, right: 15),
                              child: Text("View all"),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          Constants.you_never_before,
                          style: TextStyle(
                              color: Color(0xff9B9B9B),
                              fontSize: 11,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 22, right: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyProductPage(),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          Ink(
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(0, 0),
                                                        blurRadius: 5),
                                                  ]),
                                              child: Hero(
                                                tag: UniqueKey(),
                                                child: Image.network(
                                                  "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                                  fit: BoxFit.fill,
                                                  color: Colors.grey.shade300,
                                                  colorBlendMode:
                                                      BlendMode.multiply,
                                                  scale: 4,
                                                ),
                                              )),
                                          Positioned(
                                            left: 8,
                                            top: 8,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29)),
                                              child: const Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Text(Constants.NEW,
                                                    style: TextStyle(
                                                      color: Color(0xffFFFFFF),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29)),
                                              child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Icon(
                                                    CupertinoIcons.heart,
                                                    color: Colors.grey,
                                                    size: 14,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 7),
                                            child: Row(
                                              children: [
                                                for (int i = 0; i < 5; i++)
                                                  const Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Colors.yellow,
                                                  ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2, bottom: 8),
                                                  child: Text(
                                                    "(10)",
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff9B9B9B),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "Dorothy Perkins",
                                            style: const TextStyle(
                                                color: Color(0xff9B9B9B),
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, bottom: 3),
                                            child: const Text(
                                              "Evening Dress",
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4),
                                                child: Text(
                                                  "15\$",
                                                  style: const TextStyle(
                                                      color: Color(0xff9B9B9B),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Text(
                                                "12\$",
                                                style: TextStyle(
                                                    color: Color(0xffDB3022),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
