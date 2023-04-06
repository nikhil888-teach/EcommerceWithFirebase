import 'package:ecommerce/screen/products/product_view.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lottie/lottie.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  Map filter = {
    0: 'Newest',
    1: 'Oldest',
    2: 'lowest to high',
    3: 'highest to low'
  };

  int? sortIndex = 0;
  String? selectedSort;

  @override
  void initState() {
    if (!mounted) return;
    setState(() {
      selectedSort = filter.entries.elementAt(sortIndex!).value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  Constants.Favorites,
                  style: Text_Style.text_Theme(
                      Constants.black_text, 34, FontWeight.bold, context),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 24,
                    ))
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(35.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.arrow_up_arrow_down,
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("Price: $selectedSort",
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            14,
                                            FontWeight.normal,
                                            context)),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: themeChange.darkTheme
                                        ? Colors.grey.shade900
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(34),
                                            topRight: Radius.circular(34))),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.4,
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
                                              "Sort by",
                                              style: Text_Style.text_Theme(
                                                  Constants.black_text,
                                                  18,
                                                  FontWeight.bold,
                                                  context),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: StatefulBuilder(
                                                  builder: (context, setState) {
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: filter.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      onTap: () {
                                                        if (!mounted) return;
                                                        this.setState(() {
                                                          sortIndex = index;
                                                          selectedSort = filter
                                                              .entries
                                                              .elementAt(
                                                                  sortIndex!)
                                                              .value;
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      title: Text(
                                                          filter.entries
                                                              .elementAt(index)
                                                              .value,
                                                          style: Text_Style.text_Theme(
                                                              sortIndex == index
                                                                  ? Constants
                                                                      .white_text
                                                                  : Constants
                                                                      .black_text,
                                                              16,
                                                              FontWeight.normal,
                                                              context)),
                                                      selected: true,
                                                      selectedColor: Colors.red,
                                                      selectedTileColor:
                                                          sortIndex == index
                                                              ? Colors.red
                                                              : themeChange
                                                                      .darkTheme
                                                                  ? Colors.grey
                                                                      .shade900
                                                                  : Colors
                                                                      .white,
                                                    );
                                                  },
                                                );
                                              }),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: StreamBuilder(
                    stream: FirebaseDatabase.instance
                        .ref(Constants.dUser)
                        .child(FirebaseAuth.instance.currentUser!.uid)
                        .onValue,
                    builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      } else if (!snapshot.data!.snapshot
                          .hasChild(Constants.dFavorite)) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Lottie.asset(
                              "assets/image/emptywishlist.json",
                            )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Your Wishlist is Empty",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    20,
                                    FontWeight.bold,
                                    context),
                              ),
                            ),
                            Text(
                                "Tap heart button to start saving your favorite items.",
                                textAlign: TextAlign.center,
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    14,
                                    FontWeight.normal,
                                    context))
                          ],
                        ));
                      }
                      Map<dynamic, dynamic> map = snapshot.data!.snapshot
                          .child(Constants.dFavorite)
                          .value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      for (var element in map.values) {
                        list.add(element);
                      }
                      switch (sortIndex) {
                        case 0:
                          list.sort((a, b) => b[Constants.dFavDate]
                              .compareTo(a[Constants.dFavDate]));
                          break;
                        case 1:
                          list.sort((a, b) => a[Constants.dFavDate]
                              .compareTo(b[Constants.dFavDate]));
                          break;
                        case 2:
                          list.sort((a, b) => a[Constants.dSPrice]
                              .compareTo(b[Constants.dSPrice]));
                          break;
                        case 3:
                          list.sort((a, b) => b[Constants.dSPrice]
                              .compareTo(a[Constants.dSPrice]));
                          break;
                        default:
                          list.sort((a, b) => b[Constants.dFavDate]
                              .compareTo(a[Constants.dFavDate]));
                      }

                      return GridView.builder(
                          itemCount: list.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.530,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyProductPage(
                                    category: list[index][Constants.dcategory],
                                    subCategory: list[index]
                                        [Constants.dSubCategoryName],
                                    color: list[index][Constants.dColor],
                                    size: list[index][Constants.dSize],
                                    id: list[index][Constants.dPid],
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 80 / 100,
                                          child: Ink(
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(0, 0),
                                                        blurRadius: 5),
                                                  ]),
                                              child: Image.network(
                                                list[index][Constants.dimages]
                                                        [0]
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                color: Colors.grey.shade300,
                                                colorBlendMode:
                                                    BlendMode.multiply,
                                                scale: 3,
                                              )),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: InkWell(
                                            onTap: () {
                                              DatabaseReference
                                                  databaseReference =
                                                  FirebaseDatabase.instance
                                                      .ref(Constants.dUser)
                                                      .child(FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .uid)
                                                      .child(
                                                          Constants.dFavorite);
                                              databaseReference
                                                  .child(list[index]
                                                      [Constants.dFavId])
                                                  .remove();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffDB3022),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29)),
                                              child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Icon(
                                                    CupertinoIcons.delete,
                                                    color: Color(0xffF9F9F9),
                                                    size: 16,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Row(
                                            children: [
                                              for (int i = 0; i < 5; i++)
                                                Icon(
                                                  Icons.star,
                                                  size: 14,
                                                  color: Colors.yellow[800],
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 2, bottom: 0),
                                                child: Text(
                                                  "(10)",
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
                                          style: Text_Style.text_Theme(
                                              Constants.grey_text,
                                              11,
                                              FontWeight.normal,
                                              context),
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            list[index][Constants.dSPrice]
                                                    .toString() +
                                                "\$",
                                            style: Text_Style.text_Theme(
                                                Constants.red_text,
                                                14,
                                                FontWeight.bold,
                                                context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }),
              ),
            )));
  }
}
