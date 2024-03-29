import 'package:ecommerce/screen/products/product_view.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class MyAllTypeProductsPage extends StatefulWidget {
  const MyAllTypeProductsPage({super.key, required this.type});
  final String type;

  @override
  State<MyAllTypeProductsPage> createState() => _MyAllTypeProductsPageState();
}

class _MyAllTypeProductsPageState extends State<MyAllTypeProductsPage> {
  bool isFv = false;
  String? selectedId;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: false,
          title: Text(widget.type,
              style: Text_Style.text_Theme(
                  Constants.black_text, 20, FontWeight.bold, context)),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.shopping_cart),
          //     onPressed: () {},
          //   ),
          // ],
          bottom: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            elevation: 0,
            title: Container(
              width: double.infinity,
              height: 40,
              color: themeChange.darkTheme ? Colors.black : Colors.white,
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    if (!mounted) return;
                    setState(() {});
                  },
                  controller: searchController,
                  cursorColor: Colors.red,
                  style: Text_Style.text_Theme(
                      Constants.black_text, 18, FontWeight.normal, context),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIconColor: Colors.red,
                      suffixIconColor: Colors.red,
                      hintText: 'Search for something',
                      hintStyle: Text_Style.text_Theme(
                          Constants.grey_text, 18, FontWeight.normal, context),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: Icon(Icons.cancel_rounded))),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              StreamBuilder(
                stream:
                    FirebaseDatabase.instance.ref(Constants.dProducts).onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container();
                  }

                  Map<dynamic, dynamic> data =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  String searchQuery = searchController.text.toLowerCase();
                  if (searchController.text.isEmpty) {
                    list.clear();
                    for (var element in data.values) {
                      if (widget.type == Constants.BEST) {
                        if (element[Constants.dOrderCount] > 0) {
                          list.add(element);
                        }
                      } else {
                        list.add(element);
                      }
                    }
                    if (widget.type == Constants.NEW) {
                      list.sort((a, b) =>
                          b[Constants.dDate].compareTo(a[Constants.dDate]));
                    } else if (widget.type == Constants.BEST) {
                      list.sort((a, b) => b[Constants.dOrderCount]
                          .compareTo(a[Constants.dOrderCount]));
                    }
                  } else if (searchController.text.isNotEmpty) {
                    list.clear();
                    for (var element in data.values) {
                      if (element[Constants.dPname]
                              .toString()
                              .toLowerCase()
                              .contains(searchQuery) ||
                          element[Constants.dBrand]
                              .toString()
                              .toLowerCase()
                              .contains(searchQuery)) {
                        if (widget.type.toString() ==
                            Constants.BEST.toString()) {
                          if (element[Constants.dOrderCount] > 0) {
                            list.add(element);
                          }
                        } else {
                          list.add(element);
                        }
                      }
                    }
                  } else {
                    return Container();
                  }
                  return allProductDisplay(context, list);
                },
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container allProductDisplay(BuildContext context, List<dynamic> list) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
        child: GridView.builder(
            itemCount: list.length,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0,
              childAspectRatio: 0.550,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              int? totalRate;
              if (list[index][Constants.dTotalRating] != null) {
                totalRate = list[index][Constants.dTotalRating] + 1;
              }
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyProductPage(
                      colorLists: list[index][Constants.dColorLists] == null
                          ? null
                          : list[index][Constants.dColorLists],
                      rate: list[index][Constants.dTotalRating] == null
                          ? null
                          : totalRate,
                      category: list[index][Constants.dGender],
                      subCategory: list[index][Constants.dType],
                      color: list[index][Constants.dColor],
                      size: list[index][Constants.dSize],
                      id: list[index][Constants.dId],
                      images: list[index][Constants.dimages],
                      brand: list[index][Constants.dBrand],
                      decription: list[index][Constants.dDesc],
                      name: list[index][Constants.dPname],
                      price:
                          int.parse(list[index][Constants.dSPrice].toString()),
                    ),
                  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 80 / 100,
                            child: Ink(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 5),
                                ]),
                                child: Image.network(
                                  list[index][Constants.dimages][0]
                                      .toString()
                                      .toString(),
                                  fit: BoxFit.fill,
                                  color: Colors.grey.shade300,
                                  colorBlendMode: BlendMode.multiply,
                                  scale: 3,
                                )),
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
                                      colorLists: list[index]
                                          [Constants.dColorLists],
                                      rate: totalRate,
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
                                    colorLists: list[index]
                                        [Constants.dColorLists],
                                    rate: totalRate,
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
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: list[index][Constants.dTotalRating] == null
                                ? SizedBox()
                                : Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          size: 14,
                                          color: totalRate! > i
                                              ? Colors.yellow[800]
                                              : Colors.grey,
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2, bottom: 0),
                                        child: Text(
                                          "(${totalRate})",
                                          style: Text_Style.text_Theme(
                                              Constants.grey_text,
                                              13,
                                              FontWeight.normal,
                                              context),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                          Text(
                            list[index][Constants.dBrand],
                            style: Text_Style.text_Theme(Constants.grey_text,
                                11, FontWeight.normal, context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 0),
                            child: Text(
                              list[index][Constants.dPname],
                              style: Text_Style.text_Theme(Constants.black_text,
                                  16, FontWeight.bold, context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Text(
                                      "₹" +
                                          list[index][Constants.ddPrice]
                                              .toString(),
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Color(Constants.grey_text),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    "₹" +
                                        list[index][Constants.dSPrice]
                                            .toString(),
                                    style: Text_Style.text_Theme(
                                        Constants.red_text,
                                        14,
                                        FontWeight.bold,
                                        context)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
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

  void addToFaviratePage(
      {required String category,
      required String subCategory,
      required color,
      required size,
      required id,
      required images,
      required brand,
      required decription,
      required name,
      required colorLists,
      required price,
      int? rate}) {
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
      Constants.dTotalRating: rate,
      Constants.dColorLists: colorLists,
      Constants.dPname: name,
      Constants.dSPrice: price,
      Constants.dimages: images,
      Constants.dFavId: databaseReference.key,
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
