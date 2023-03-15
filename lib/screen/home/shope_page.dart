import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyShopePage extends StatefulWidget {
  const MyShopePage({Key? key}) : super(key: key);

  @override
  State<MyShopePage> createState() => _MyShopePageState();
}

class _MyShopePageState extends State<MyShopePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    )),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search,
                    ),
                  )
                ],
                centerTitle: true,
                title: Text(Constants.Categories,
                    style: Text_Style.text_Theme(
                        Constants.black_text, 18, FontWeight.bold, context)),
                elevation: 1,
              ),
              body: Column(
                children: [
                  Container(
                    color: themeChange.darkTheme
                        ? Colors.black
                        : const Color(0xffFFFFFF),
                    child: TabBar(indicatorColor: Color(0xffDB3022), tabs: [
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
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        Constants.NEW,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 18, FontWeight.bold, context),
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
