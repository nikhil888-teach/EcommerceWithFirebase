import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

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
                title: const Text(Constants.Categories,
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Colors.white,
                elevation: 1,
              ),
              body: Column(
                children: [
                  Container(
                    color: const Color(0xffFFFFFF),
                    child: const TabBar(
                        labelPadding: EdgeInsets.symmetric(vertical: 14),
                        indicatorColor: Color(0xffDB3022),
                        unselectedLabelColor: Color(0xff222222),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                        labelColor: Color(0xff222222),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        tabs: [
                          Text(Constants.women),
                          Text(Constants.Men),
                          Text(Constants.kides)
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          listOfCategories(),
                          listOfCategories(),
                          listOfCategories(),
                        ]),
                  )
                ],
              ))),
    );
  }

  Padding listOfCategories() {
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
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        Constants.NEW,
                        style: TextStyle(
                            color: Color(0xff222222),
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
