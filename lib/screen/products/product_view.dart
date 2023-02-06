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

  String? selectedsize;
  int? selectedindexcolor;
  Map color = {0: "White", 1: "Black", 2: "Pink", 3: "Blue", 4: "Grey"};
  var displaycolor = {
    0xfff5f5f5,
    0xff000000,
    0xffFFC0CB,
    0xff0000FF,
    0xff808080
  };
  String? selectedcolor;
  @override
  void initState() {
    selectedsize = "Size";
    selectedcolor = "Color";
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.white),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(34),
                                      topRight: Radius.circular(34))),
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(),
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Container(
                                          width: 60,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Select size",
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            18,
                                            FontWeight.bold),
                                      ),
                                      Wrap(
                                        spacing: 20,
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            size.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: OutlinedButton(
                                                        onPressed: () {
                                                          if (!mounted) return;
                                                          setState(() {
                                                            selectedsize = size
                                                                .entries
                                                                .elementAt(
                                                                    index)
                                                                .value;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          size.entries
                                                              .elementAt(index)
                                                              .value,
                                                          style: Text_Style
                                                              .text_Theme(
                                                                  Constants
                                                                      .black_text,
                                                                  14,
                                                                  FontWeight
                                                                      .w500),
                                                        )),
                                                  ),
                                                )),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedsize!,
                                  style: Text_Style.text_Theme(
                                      Constants.black_text,
                                      18,
                                      FontWeight.normal),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.white),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(34),
                                      topRight: Radius.circular(34))),
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(),
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Container(
                                          width: 60,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Select color",
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            18,
                                            FontWeight.bold),
                                      ),
                                      Wrap(
                                        spacing: 20,
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            color.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: OutlinedButton(
                                                        onPressed: () {
                                                          if (!mounted) return;
                                                          setState(() {
                                                            selectedcolor =
                                                                color.entries
                                                                    .elementAt(
                                                                        index)
                                                                    .value;
                                                            selectedindexcolor =
                                                                color.entries
                                                                    .elementAt(
                                                                        index)
                                                                    .key;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 5),
                                                              child: Icon(
                                                                Icons.circle,
                                                                color: Color(
                                                                    displaycolor
                                                                        .elementAt(
                                                                            index)),
                                                              ),
                                                            ),
                                                            Text(
                                                              color.entries
                                                                  .elementAt(
                                                                      index)
                                                                  .value,
                                                              style: Text_Style
                                                                  .text_Theme(
                                                                      Constants
                                                                          .black_text,
                                                                      14,
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                )),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.30,

                            // color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.circle,
                                        color: selectedindexcolor == null
                                            ? Colors.transparent
                                            : Color(displaycolor.elementAt(
                                                selectedindexcolor!)),
                                      ),
                                    ),
                                    Text(
                                      selectedcolor!,
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          18,
                                          FontWeight.normal),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
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
                                size: 24,
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
