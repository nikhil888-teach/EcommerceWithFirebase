import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class MyProductPage extends StatefulWidget {
  MyProductPage(
      {Key? key,
      required this.name,
      required this.brand,
      required this.price,
      required this.decription,
      required this.images,
      required this.category,
      required this.subCategory,
      required this.color,
      required this.size,
      required this.id})
      : super(key: key);
  final String category;
  final String subCategory;
  final List images;
  final String name;
  final String brand;
  final int price;
  final String decription;
  final bool color;
  final bool size;
  final String id;

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  Map size = {0: "XS", 1: "S", 2: "M", 3: "L", 4: "XL"};

  String? selectedsize;
  int? selectedindexcolor;
  int selectedImageIndex = 0;
  Map color = {0: "White", 1: "Black", 2: "Pink", 3: "Blue", 4: "Grey"};
  var displaycolor = {
    0xfff5f5f5,
    0xff000000,
    0xffFFC0CB,
    0xff0000FF,
    0xff808080
  };
  String? userId;
  String? selectedcolor;
  bool loading = false;
  @override
  void initState() {
    selectedsize = "Size";
    // _pageController = PageController(initialPage: 0);
    selectedcolor = "Color";
    userId = FirebaseAuth.instance.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(widget.name,
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold, context)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: Icon(
              Icons.share,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.60,
                    child: PageView.builder(
                      // controller: _pageController,
                      onPageChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          selectedImageIndex = value;
                        });
                      },
                      itemCount: widget.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, imageIndex) {
                        return Hero(
                          tag: UniqueKey(),
                          child: InteractiveViewer(
                            panEnabled: true,
                            child: Image.network(
                              widget.images[imageIndex],
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade300,
                              colorBlendMode: BlendMode.multiply,
                            ),
                          ),
                        );
                      },
                    ),
                  )),
              Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 3,
                  // padding: EdgeInsets.symmetric(vertical: 5),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, dotIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ClipOval(
                          child: Container(
                        height: 8,
                        width: selectedImageIndex == dotIndex ? 12 : 8,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: CircleAvatar(
                            backgroundColor: selectedImageIndex == dotIndex
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      )),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.size
                            ? OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(34),
                                            topRight: Radius.circular(34))),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        decoration: BoxDecoration(),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                  FontWeight.bold,
                                                  context),
                                            ),
                                            Wrap(
                                              spacing: 20,
                                              direction: Axis.horizontal,
                                              children: List.generate(
                                                  size.length,
                                                  (index) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 15),
                                                        child: OutlinedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .white)),
                                                            onPressed: () {
                                                              if (!mounted)
                                                                return;
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
                                                                    .elementAt(
                                                                        index)
                                                                    .value,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500))),
                                                      )),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedsize!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Free Size",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                )),
                        widget.color
                            ? OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(34),
                                            topRight: Radius.circular(34))),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        decoration: BoxDecoration(),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Text(
                                                "Select color",
                                                style: Text_Style.text_Theme(
                                                    Constants.black_text,
                                                    18,
                                                    FontWeight.bold,
                                                    context),
                                              ),
                                            ),
                                            Wrap(
                                              spacing: 20,
                                              direction: Axis.horizontal,
                                              children: List.generate(
                                                  color.length,
                                                  (index) => Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            14,
                                                        width: 100,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10),
                                                          child: OutlinedButton(
                                                              style: ButtonStyle(
                                                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24),
                                                                      side: BorderSide(
                                                                          color: Colors
                                                                              .white))),
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .white)),
                                                              onPressed: () {
                                                                if (!mounted)
                                                                  return;
                                                                setState(() {
                                                                  selectedcolor = color
                                                                      .entries
                                                                      .elementAt(
                                                                          index)
                                                                      .value;
                                                                  selectedindexcolor = color
                                                                      .entries
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
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            5),
                                                                    child: Icon(
                                                                      Icons
                                                                          .circle,
                                                                      color: Color(
                                                                          displaycolor
                                                                              .elementAt(index)),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                      color
                                                                          .entries
                                                                          .elementAt(
                                                                              index)
                                                                          .value,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500)),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  // color: Colors.black,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.circle,
                                              color: selectedindexcolor == null
                                                  ? Colors.transparent
                                                  : Color(
                                                      displaycolor.elementAt(
                                                          selectedindexcolor!)),
                                            ),
                                          ),
                                          Text(selectedcolor!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(29)),
                          child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.white,
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
                          Text(
                            widget.name,
                            style: Text_Style.text_Theme(
                                0xff222222, 24, FontWeight.bold, context),
                          ),
                          Text(
                            "\$" + widget.price.toString(),
                            style: Text_Style.text_Theme(
                                0xff222222, 24, FontWeight.bold, context),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.brand,
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
                    Text(widget.decription,
                        style: Text_Style.text_Theme(Constants.grey_text, 14,
                            FontWeight.normal, context)),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 12),
                      child: Text("You can also like this",
                          style: Text_Style.text_Theme(Constants.black_text, 18,
                              FontWeight.bold, context)),
                    ),
                    Container(
                        height: 300,
                        child: StreamBuilder(
                            stream: FirebaseDatabase.instance
                                .ref(Constants.dProducts)
                                .onValue,
                            builder: (context,
                                AsyncSnapshot<DatabaseEvent> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                );
                              }

                              Map<dynamic, dynamic> data =
                                  snapshot.data!.snapshot.value as dynamic;
                              List<dynamic> list = [];
                              list.clear();
                              for (var element in data.values) {
                                if (element['Type'] == widget.subCategory &&
                                    element['Gender'] == widget.category) {
                                  list.add(element);
                                }
                              }
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: list.length,
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.only(top: 22, right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MyProductPage(
                                          category: widget.category,
                                          subCategory: widget.subCategory,
                                          color: list[index][Constants.dColor],
                                          size: list[index][Constants.dSize],
                                          id: list[index][Constants.dId],
                                          images: list[index]
                                              [Constants.dimages],
                                          brand: list[index][Constants.dBrand],
                                          decription: list[index]
                                              [Constants.dDesc],
                                          name: list[index][Constants.dPname],
                                          price: list[index][Constants.dSPrice],
                                        ),
                                      ));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 200,
                                                  width: 150,
                                                  child: Ink(
                                                      decoration:
                                                          const BoxDecoration(
                                                              boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black12,
                                                                offset: Offset(
                                                                    0, 0),
                                                                blurRadius: 5),
                                                          ]),
                                                      child: Image.network(
                                                        list[index][Constants
                                                            .dimages][0],
                                                        fit: BoxFit.fill,
                                                        color: Colors
                                                            .grey.shade300,
                                                        colorBlendMode:
                                                            BlendMode.multiply,
                                                        scale: 4,
                                                      )),
                                                ),
                                                Positioned(
                                                  left: 8,
                                                  top: 8,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(29)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      child: Text(Constants.NEW,
                                                          style: Text_Style
                                                              .text_Theme(
                                                                  Constants
                                                                      .white_text,
                                                                  11,
                                                                  FontWeight
                                                                      .bold,
                                                                  context)),
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
                                                            BorderRadius
                                                                .circular(29)),
                                                    child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
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
                                                padding: const EdgeInsets.only(
                                                    top: 7),
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
                                                              left: 2,
                                                              bottom: 0),
                                                      child: Text(
                                                        "(10)",
                                                        style: Text_Style
                                                            .text_Theme(
                                                                Constants
                                                                    .grey_text,
                                                                10,
                                                                FontWeight
                                                                    .normal,
                                                                context),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                list[index][Constants.dBrand],
                                                style: const TextStyle(
                                                    color: Color(0xff9B9B9B),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 3),
                                                child: Text(
                                                  list[index][Constants.dPname],
                                                  style: Text_Style.text_Theme(
                                                      Constants.black_text,
                                                      16,
                                                      FontWeight.bold,
                                                      context),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 4),
                                                    child: Text(
                                                      list[index][Constants
                                                                  .ddPrice]
                                                              .toString() +
                                                          "\$",
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Color(Constants
                                                              .grey_text),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text(
                                                      list[index][Constants
                                                                  .dSPrice]
                                                              .toString() +
                                                          "\$",
                                                      style:
                                                          Text_Style.text_Theme(
                                                              Constants
                                                                  .red_text,
                                                              14,
                                                              FontWeight.bold,
                                                              context)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: themeChange.darkTheme ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
              onTap: () {
                addData();
              },
              child: Container(
                  height: 48,
                  child: loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : Button_Style.button_Theme(Constants.add_cart))),
        ),
      ),
    ));
  }

  void addData() {
    if (!mounted) return;
    setState(() {
      loading = true;
    });
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref(Constants.dUser).child(userId.toString());
    databaseReference.once().then((value) {
      if (value.snapshot.hasChild(Constants.dAddToCart)) {
        checkDataAlreadyAddorNot();
      } else {
        addDataToAddToCart();
      }
    });
  }

  void addDataToAddToCart() {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(userId.toString())
        .child(Constants.dAddToCart)
        .push();
    if (widget.color || widget.size) {
      if (selectedcolor != "Color" && selectedsize != "Size") {
        databaseReference.update({
          Constants.dPid: widget.id,
          Constants.dPname: widget.name,
          Constants.dQuantity: 1,
          Constants.dSize: selectedsize,
          Constants.dColor: selectedcolor,
          Constants.dtotamt: widget.price,
          Constants.dimages: widget.images[0],
          Constants.dSPrice: widget.price,
        }).then((value) {
          Scaffold_msg.toastMessage(context, "Added to cart");
          if (!mounted) return;
          setState(() {
            loading = false;
          });
        });
      } else {
        Scaffold_msg.toastMessage(context, "Please select color and size");
        if (!mounted) return;
        setState(() {
          loading = false;
        });
      }
    } else {
      databaseReference.update({
        Constants.dPid: widget.id,
        Constants.dQuantity: 1,
        Constants.dtotamt: widget.price,
        Constants.dimages: widget.images[0],
        Constants.dSPrice: widget.price,
        Constants.dPname: widget.name
      }).then((value) {
        Scaffold_msg.toastMessage(context, "Added to cart");
        if (!mounted) return;
        setState(() {
          loading = false;
        });
      });
    }
  }

  void checkDataAlreadyAddorNot() {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(userId.toString())
        .child(Constants.dAddToCart);

    databaseReference.orderByKey().once().then((value) {
      bool isExis = false;
      value.snapshot.children.forEach((element) {
        if (element.child(Constants.dPid).value.toString() == widget.id) {
          isExis = true;
          print("pid" +
              element.child(Constants.dPid).value.toString() +
              "\nwidgetid" +
              "pid" +
              widget.id.toString() +
              "\nmatch" +
              isExis.toString());
        }
      });
      if (isExis) {
        Scaffold_msg.toastMessage(context, "Already Added");
        if (!mounted) return;
        setState(() {
          loading = false;
        });
      } else {
        addDataToAddToCart();
      }
    });
  }
}
