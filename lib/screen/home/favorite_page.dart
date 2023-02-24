import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  int? sortIndex = 2;
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
                      Constants.black_text, 34, FontWeight.bold),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
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
                                  const Icon(
                                    CupertinoIcons.arrow_up_arrow_down,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("Price: $selectedSort",
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            14,
                                            FontWeight.normal)),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(34),
                                            topRight: Radius.circular(34))),
                                    backgroundColor: Colors.white,
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
                                                  FontWeight.bold),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: StatefulBuilder(
                                                  builder: (context, setState) {
                                                return ListView.builder(
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
                                                              FontWeight
                                                                  .normal)),
                                                      selected: true,
                                                      selectedColor: Colors.red,
                                                      selectedTileColor:
                                                          sortIndex == index
                                                              ? Colors.red
                                                              : Colors.white,
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
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.black,
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
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.517,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Ink(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                      blurRadius: 5),
                                ]),
                                child: Image.network(
                                  "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                  fit: BoxFit.fill,
                                  color: Colors.grey.shade300,
                                  colorBlendMode: BlendMode.multiply,
                                  scale: 3,
                                )),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffDB3022),
                                    borderRadius: BorderRadius.circular(29)),
                                child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      CupertinoIcons.bag_fill,
                                      color: Color(0xffF9F9F9),
                                      size: 16,
                                    )),
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
                                          13,
                                          FontWeight.normal),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Dorothy Perkins",
                              style: Text_Style.text_Theme(
                                  Constants.grey_text, 11, FontWeight.normal),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 3),
                              child: Text(
                                "Evening Dress",
                                style: Text_Style.text_Theme(
                                    Constants.black_text, 16, FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Color: ",
                                  style: Text_Style.text_Theme(
                                      Constants.grey_text,
                                      13,
                                      FontWeight.normal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    "Black",
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        13,
                                        FontWeight.normal),
                                  ),
                                ),
                                Text(
                                  "Size: ",
                                  style: Text_Style.text_Theme(
                                      Constants.grey_text,
                                      13,
                                      FontWeight.normal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    "L",
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        13,
                                        FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "12\$",
                                style: Text_Style.text_Theme(
                                    Constants.red_text, 14, FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
