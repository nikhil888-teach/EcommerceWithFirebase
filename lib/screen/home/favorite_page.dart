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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 25),
                    child: Text(
                      "Favorites",
                      style: TextStyle(
                          color: const Color(0xff222222),
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
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
                                    MediaQuery.of(context).size.height / 2.5,
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
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                if (!mounted) return;
                                                this.setState(() {
                                                  sortIndex = index;
                                                  selectedSort = map.entries
                                                      .elementAt(sortIndex!)
                                                      .value;
                                                  Navigator.pop(context);
                                                });
                                              },
                                              // tileColor: ,
                                              title: Text(
                                                map.entries
                                                    .elementAt(index)
                                                    .value,
                                                style: TextStyle(
                                                    color: sortIndex == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                  )
                ],
              ),
            )));
  }
}
