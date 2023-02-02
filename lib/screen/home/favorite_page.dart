import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  Map map = {
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
      selectedSort = map.entries.elementAt(sortIndex!).value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: false,
              titleSpacing: 0,
              titleTextStyle: TextStyle(
                  color: const Color(0xff222222),
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
              title: Transform(
                transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
                child: Text(
                  Constants.Favorites,
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
                                    child: Text(
                                      "Price: $selectedSort",
                                      style: TextStyle(
                                          color: const Color(0xff222222),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Sort",
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: StatefulBuilder(
                                                  builder: (context, setState) {
                                                return ListView.builder(
                                                  itemCount: map.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      onTap: () {
                                                        if (!mounted) return;
                                                        this.setState(() {
                                                          sortIndex = index;
                                                          selectedSort = map
                                                              .entries
                                                              .elementAt(
                                                                  sortIndex!)
                                                              .value;
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      // tileColor: ,
                                                      title: Text(
                                                        map.entries
                                                            .elementAt(index)
                                                            .value,
                                                        style: TextStyle(
                                                            color: sortIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
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
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.5182,
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
                                          colorBlendMode: BlendMode.multiply,
                                          scale: 3,
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffDB3022),
                                            borderRadius:
                                                BorderRadius.circular(29)),
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
                                              style: const TextStyle(
                                                  color: Color(0xff9B9B9B),
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
                                        const Text(
                                          "Color: ",
                                          style: TextStyle(
                                              color: Color(0xff9B9B9B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Text(
                                            "Black",
                                            style: const TextStyle(
                                                color: Color(0xff222222),
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Text(
                                          "Size: ",
                                          style: const TextStyle(
                                              color: Color(0xff9B9B9B),
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Text(
                                            "L",
                                            style: const TextStyle(
                                                color: Color(0xff222222),
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: const Text(
                                        "12\$",
                                        style: TextStyle(
                                            color: Color(0xffDB3022),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
