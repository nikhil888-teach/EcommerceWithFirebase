import 'package:ecommerce/screen/products/allproduct_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

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
                centerTitle: false,
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
                      Text(Constants.Men),
                      Text(Constants.women),
                      Text(Constants.kides)
                    ]),
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          listOfCategories(Constants.dMale),
                          listOfCategories(Constants.dFemale),
                          listOfCategories(Constants.dKids),
                        ]),
                  )
                ],
              ))),
    );
  }

  Padding listOfCategories(String selectCategory) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: FirebaseAnimatedList(
        query: FirebaseDatabase.instance.ref(selectCategory),
        physics: const BouncingScrollPhysics(),
        defaultChild: const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
        itemBuilder: (context, snapshot, animation, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyCategoryProducts(
                          subCategory: snapshot
                              .child(Constants.dSubCategoryName)
                              .value
                              .toString(),
                          category: selectCategory),
                    ));
                  },
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          snapshot
                              .child(Constants.dSubCategoryName)
                              .value
                              .toString(),
                          style: Text_Style.text_Theme(Constants.black_text, 18,
                              FontWeight.bold, context),
                        ),
                      ),
                      Image.network(
                        snapshot
                            .child(Constants.dSubCategoryImage)
                            .value
                            .toString(),
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      )
                    ],
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
