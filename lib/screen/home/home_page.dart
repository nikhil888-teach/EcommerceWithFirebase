import 'package:ecommerce/screen/products/allmixproducts_page.dart';
import 'package:ecommerce/screen/products/product_view.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.bagTotal}) : super(key: key);
  final bagTotal;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFv = false;
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
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
                      Text(Constants.FASHION,
                          style: Text_Style.text_Theme(Constants.white_text, 48,
                              FontWeight.bold, context)),
                      Text(
                        Constants.SALE,
                        style: Text_Style.text_Theme(
                            Constants.white_text, 48, FontWeight.bold, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyAllTypeProductsPage(
                                        type: Constants.BEST),
                                  ));
                            },
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
                            Text(Constants.NEW,
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    34,
                                    FontWeight.bold,
                                    context)),
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyAllTypeProductsPage(
                                                type: Constants.NEW),
                                      ));
                                },
                                child: Text(
                                  "View all",
                                  style: TextStyle(
                                      color: themeChange.darkTheme
                                          ? Colors.grey
                                          : Colors.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(Constants.you_never_before,
                            style: Text_Style.text_Theme(Constants.grey_text,
                                11, FontWeight.normal, context)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 320,
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
                                } else if (snapshot.hasError) {
                                  return Container();
                                }
                                Map<dynamic, dynamic> map =
                                    snapshot.data!.snapshot.value as dynamic;
                                List<dynamic> list = [];
                                list.clear();
                                for (var element in map.values) {
                                  if (list.length < 10) {
                                    list.add(element);
                                  }
                                }
                                list.sort((a, b) => b[Constants.dDate]
                                    .compareTo(a[Constants.dDate]));

                                return productsList(list, Constants.NEW);
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
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
                            Text(Constants.bestSeller,
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    34,
                                    FontWeight.bold,
                                    context)),
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyAllTypeProductsPage(
                                                type: Constants.BEST),
                                      ));
                                },
                                child: Text(
                                  "View all",
                                  style: TextStyle(
                                      color: themeChange.darkTheme
                                          ? Colors.grey
                                          : Colors.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 320,
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
                                } else if (snapshot.hasError) {
                                  return Container();
                                }
                                Map<dynamic, dynamic> map =
                                    snapshot.data!.snapshot.value as dynamic;
                                List<dynamic> list = [];
                                list.clear();
                                for (var element in map.values) {
                                  if (element[Constants.dOrderCount] > 0) {
                                    if (list.length < 10) {
                                      list.add(element);
                                    }
                                  }
                                }
                                list.sort((a, b) => b[Constants.dOrderCount]
                                    .compareTo(a[Constants.dOrderCount]));

                                return productsList(list, Constants.BEST);
                              }),
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

  ListView productsList(List<dynamic> list, String sticker) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          int? perUserRate;
          if (list[index][Constants.dTotalRating] != null) {
            perUserRate = list[index][Constants.dTotalRating] + 1;
          }
          return Padding(
            padding: const EdgeInsets.only(top: 22, right: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyProductPage(
                    rate: list[index][Constants.dTotalRating] == null
                        ? null
                        : perUserRate,
                    category: list[index][Constants.dGender],
                    subCategory: list[index][Constants.dType],
                    color: list[index][Constants.dColor],
                    size: list[index][Constants.dSize],
                    id: list[index][Constants.dId],
                    images: list[index][Constants.dimages],
                    brand: list[index][Constants.dBrand],
                    decription: list[index][Constants.dDesc],
                    name: list[index][Constants.dPname],
                    price: list[index][Constants.dSPrice],
                  ),
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
                          Container(
                            height: 200,
                            width: 150,
                            child: Ink(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 5),
                                ]),
                                child: Image.network(
                                  list[index][Constants.dimages][0],
                                  fit: BoxFit.fill,
                                  color: Colors.grey.shade300,
                                  colorBlendMode: BlendMode.multiply,
                                  scale: 4,
                                )),
                          ),
                          Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(29)),
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(sticker,
                                    style: Text_Style.text_Theme(
                                        Constants.white_text,
                                        11,
                                        FontWeight.bold,
                                        context)),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () async {
                                if (!mounted) return;
                                setState(() {
                                  selectedId = list[index][Constants.dId];
                                });
                                if (await isFavorite()) {
                                  if (await checkAlreadyAddOrNot()) {
                                    Scaffold_msg.toastMessage(
                                        context, "Already Added");
                                  } else {
                                    addToFaviratePage(
                                      rate: perUserRate == null
                                          ? null
                                          : perUserRate,
                                      category: list[index][Constants.dGender],
                                      subCategory: list[index][Constants.dType],
                                      color: list[index][Constants.dColor],
                                      size: list[index][Constants.dSize],
                                      id: list[index][Constants.dId],
                                      images: list[index][Constants.dimages],
                                      brand: list[index][Constants.dBrand],
                                      decription: list[index][Constants.dDesc],
                                      name: list[index][Constants.dPname],
                                      price: list[index][Constants.dSPrice],
                                    );
                                  }
                                } else {
                                  addToFaviratePage(
                                    rate: perUserRate == null
                                        ? null
                                        : perUserRate,
                                    category: list[index][Constants.dGender],
                                    subCategory: list[index][Constants.dType],
                                    color: list[index][Constants.dColor],
                                    size: list[index][Constants.dSize],
                                    id: list[index][Constants.dId],
                                    images: list[index][Constants.dimages],
                                    brand: list[index][Constants.dBrand],
                                    decription: list[index][Constants.dDesc],
                                    name: list[index][Constants.dPname],
                                    price: list[index][Constants.dSPrice],
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(29)),
                                child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.white,
                                      size: 14,
                                    )),
                              ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 7),
                            child: list[index][Constants.dTotalRating] == null
                                ? SizedBox()
                                : Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          size: 14,
                                          color: list[index][
                                                      Constants.dTotalRating] >=
                                                  i
                                              ? Colors.yellow[800]
                                              : Colors.grey,
                                        ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 2, bottom: 0),
                                        child: Text(
                                            "(" + perUserRate.toString() + ")",
                                            style: Text_Style.text_Theme(
                                                Constants.grey_text,
                                                10,
                                                FontWeight.normal,
                                                context)),
                                      )
                                    ],
                                  ),
                          ),
                          Text(
                            list[index][Constants.dBrand].toString(),
                            style: Text_Style.text_Theme(Constants.grey_text,
                                11, FontWeight.normal, context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 3),
                            child: Text(
                                list[index][Constants.dPname].toString(),
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    16,
                                    FontWeight.bold,
                                    context)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Text(
                                    list[index][Constants.ddPrice].toString() +
                                        "₹",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Color(Constants.grey_text),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                  "₹" +
                                      list[index][Constants.dSPrice].toString(),
                                  style: Text_Style.text_Theme(
                                      Constants.red_text,
                                      14,
                                      FontWeight.bold,
                                      context)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<bool> isFavorite() async {
    DatabaseReference reference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid);
    bool isChild = false;

    await reference.once().then((value) {
      if (value.snapshot.hasChild(Constants.dFavorite)) {
        if (!mounted) return;
        setState(() {
          isChild = true;
        });
      } else {
        if (!mounted) return;
        setState(() {
          isChild = false;
        });
      }
    });
    print(isChild);
    return isChild;
  }

  Future<bool> checkAlreadyAddOrNot() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(Constants.dFavorite);

    bool isExis = false;
    await databaseReference.orderByKey().once().then((value) {
      value.snapshot.children.forEach((element) {
        if (element.child(Constants.dPid).value == selectedId) {
          if (!mounted) return;
          setState(() {
            isExis = true;
          });
        }
      });
    });

    return isExis;
  }

  void addToFaviratePage({
    required String category,
    required String subCategory,
    required color,
    required size,
    required id,
    required images,
    required brand,
    required decription,
    required name,
    required price,
    int? rate,
  }) {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(Constants.dFavorite)
        .push();

    databaseReference.update({
      Constants.dcategory: category,
      Constants.dSubCategoryName: subCategory,
      Constants.dColor: color,
      Constants.dSize: size,
      Constants.dPid: id,
      Constants.dBrand: brand,
      Constants.dDesc: decription,
      Constants.dPname: name,
      Constants.dSPrice: price,
      Constants.dimages: images,
      Constants.dFavId: databaseReference.key,
      Constants.dTotalRating: rate,
      Constants.dFavDate: DateTime.now().toString()
    }).then((value) {
      if (!mounted) return;
      setState(() {
        isFv = false;
      });
      Scaffold_msg.toastMessage(context, "Added to Facorite");
    });
  }
}
