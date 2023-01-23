import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

class MyShopePage extends StatefulWidget {
  const MyShopePage({Key? key}) : super(key: key);

  @override
  State<MyShopePage> createState() => _MyShopePageState();
}

class _MyShopePageState extends State<MyShopePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )
                ],
                centerTitle: true,
                title: Text("Categories",
                    style: google_fonts.GoogleFonts.roboto(
                        color: const Color(0xff222222),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Colors.white,
                elevation: 1,
              ),
              body: Container(
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xffFFFFFF),
                      child: TabBar(
                          labelPadding:
                              const EdgeInsets.symmetric(vertical: 14),
                          indicatorColor: const Color(0xffDB3022),
                          unselectedLabelColor: const Color(0xff222222),
                          unselectedLabelStyle: google_fonts.GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.normal),
                          labelColor: const Color(0xff222222),
                          labelStyle: google_fonts.GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          tabs: const [
                            Text(
                              "Women",
                            ),
                            Text("Men"),
                            Text("Kids")
                          ]),
                    ),
                    Expanded(
                      child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ListOfCategories(),
                            ListOfCategories(),
                            ListOfCategories(),
                          ]),
                    )
                  ],
                ),
              ))),
    );
  }

  Padding ListOfCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 100,
                child: Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "New",
                        style: google_fonts.GoogleFonts.roboto(
                            color: const Color(0xff222222),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTamE2X9X7VXv0Y_ce4RiWqJmoZ8AYuMJ5dYg&usqp=CAU",
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    )
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
