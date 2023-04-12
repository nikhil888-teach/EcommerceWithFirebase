import 'package:draggable_fab/draggable_fab.dart';
import 'package:ecommerce/functions/cartcount.dart';
import 'package:ecommerce/screen/chat/chatScreen.dart';
import 'package:ecommerce/screen/home/bag_pages.dart';
import 'package:ecommerce/screen/home/favorite_page.dart';
import 'package:ecommerce/screen/home/home_page.dart';
import 'package:ecommerce/screen/home/profile_page.dart';
import 'package:ecommerce/screen/home/shope_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMainPage extends StatefulWidget {
  MyMainPage({Key? key, this.currentIndex = 0}) : super(key: key);
  int currentIndex;

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

List pagess = <Widget>[
  MyHomePage(),
  MyShopePage(),
  MyBagPage(),
  const MyFavoritePage(),
  const MyProfilePage(),
];

class _MyMainPageState extends State<MyMainPage> {
  @override
  void initState() {
    if (!mounted) return;
    setState(() {
      getTotalCart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: pagess.elementAt(widget.currentIndex),
        floatingActionButton: DraggableFab(
          securityBottom: 30,
          initPosition: Offset(double.infinity, double.infinity),
          child: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    )),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: FractionallySizedBox(
                            heightFactor: 1, child: MyChatScreen()),
                      );
                    });

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MyChatScreen()));
              },
              backgroundColor: Color.fromARGB(255, 224, 57, 57),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/image/bot.png",
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: widget.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              if (!mounted) return;
              setState(() {
                widget.currentIndex = value;
              });
            },
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: Text_Style.text_Theme(
                Constants.grey_text, 10, FontWeight.normal, context),
            items: [
              BottomNavigationBarItem(
                  label: Constants.HOME,
                  icon: Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: Constants.shop,
                  icon: Icon(CupertinoIcons.shopping_cart),
                  activeIcon: Icon(
                    CupertinoIcons.shopping_cart,
                  )),
              BottomNavigationBarItem(
                  label: Constants.bag,
                  icon: Stack(alignment: Alignment.center, children: [
                    ValueListenableBuilder<int>(
                      valueListenable: countCart,
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "${value}",
                          style: Text_Style.text_Theme(Constants.grey_text, 10,
                              FontWeight.bold, context),
                        ),
                      ),
                    ),
                    Icon(CupertinoIcons.bag),
                  ]),
                  activeIcon: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.bag_fill,
                      ),
                      ValueListenableBuilder<int>(
                          valueListenable: countCart,
                          builder: (context, value, child) => Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("${value}",
                                    style: TextStyle(
                                        color: themeChange.darkTheme
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              )),
                    ],
                  )),
              BottomNavigationBarItem(
                  label: Constants.Favorites,
                  icon: Icon(CupertinoIcons.heart),
                  activeIcon: Icon(
                    CupertinoIcons.heart_fill,
                  )),
              BottomNavigationBarItem(
                  label: Constants.Profile,
                  icon: Icon(CupertinoIcons.profile_circled),
                  activeIcon: Icon(
                    CupertinoIcons.profile_circled,
                  )),
            ]),
      ),
    );
  }
}
