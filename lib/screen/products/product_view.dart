import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({Key? key}) : super(key: key);

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  Map size = {0: "XS", 1: "S", 2: "M", 3: "L", 4: "XL"};
  String? selectedsize = "XS";
  List color = <String>["White", "Black", "Pink", "Blue", "Grey"];
  String? selectedcolor = "Black";
  bool showbottomdialog = false;
  @override
  void initState() {
    showbottomdialog = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text("Short dress",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: Icon(
              Icons.share,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Hero(
                  tag: UniqueKey(),
                  child: Image.network(
                    "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade300,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            setState(() {
                              showbottomdialog = true;
                            });
                          },
                          child: Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.30,
                            // color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "size",
                                  style: Text_Style.text_Theme(
                                      Constants.black_text,
                                      18,
                                      FontWeight.normal),
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.35,
                          color: Colors.yellow,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(29)),
                          child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                CupertinoIcons.heart,
                                color: Colors.grey,
                                size: 28,
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Evening Dress",
                            style: TextStyle(
                                color: Color(0xff222222),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$19.99",
                            style: TextStyle(
                                color: Color(0xff222222),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
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
                      padding: const EdgeInsets.only(bottom: 16, top: 8),
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.yellow,
                            ),
                          Text(
                            "(10)",
                            style: const TextStyle(
                                color: Color(0xff9B9B9B),
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    Text(
                        "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                        style: Text_Style.text_Theme(
                            Constants.grey_text, 14, FontWeight.normal)),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 12),
                      child: Text("You can also like this",
                          style: Text_Style.text_Theme(
                              Constants.black_text, 18, FontWeight.bold)),
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
                                            decoration:
                                                const BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 0),
                                                  blurRadius: 5),
                                            ]),
                                            child: Image.network(
                                              "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                              fit: BoxFit.fill,
                                              color: Colors.grey.shade300,
                                              colorBlendMode:
                                                  BlendMode.multiply,
                                              scale: 4,
                                            )),
                                        Positioned(
                                          left: 8,
                                          top: 8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(29)),
                                            child: Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Text(Constants.NEW,
                                                  style: Text_Style.text_Theme(
                                                      Constants.white_text,
                                                      11,
                                                      FontWeight.bold)),
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
                                                    BorderRadius.circular(29)),
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
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Row(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              const Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.yellow,
                                              ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2, bottom: 0),
                                              child: Text(
                                                "(10)",
                                                style: Text_Style.text_Theme(
                                                    Constants.grey_text,
                                                    10,
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
                                        child: Text(
                                          "Evening Dress",
                                          style: Text_Style.text_Theme(
                                              Constants.black_text,
                                              16,
                                              FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 4),
                                            child: Text(
                                              "15\$",
                                              style: Text_Style.text_Theme(
                                                  Constants.grey_text,
                                                  14,
                                                  FontWeight.bold),
                                            ),
                                          ),
                                          Text("12\$",
                                              style: Text_Style.text_Theme(
                                                  Constants.red_text,
                                                  14,
                                                  FontWeight.bold)),
                                        ],
                                      ),
                                    ],
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
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
            onTap: () {},
            child: Container(
                height: 48,
                child: Button_Style.button_Theme(Constants.add_cart))),
      ),
    ));
  }
}
