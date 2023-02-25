import 'package:ecommerce/screen/home/bag_pages.dart';
import 'package:ecommerce/screen/home/favorite_page.dart';
import 'package:ecommerce/screen/home/home_page.dart';
import 'package:ecommerce/screen/home/profile_page.dart';
import 'package:ecommerce/screen/home/shope_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

int currentindex = 0;
List pagess = <Widget>[
  const MyHomePage(),
  const MyShopePage(),
  const MyBagPage(),
  const MyFavoritePage(),
  const MyFavoritePage(),
];

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pagess.elementAt(currentindex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              if (!mounted) return;
              setState(() {
                currentindex = value;
              });
            },
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: const Color(0xffDB3022),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: Text_Style.text_Theme(
                Constants.grey_text, 10, FontWeight.normal),
            selectedLabelStyle: Text_Style.text_Theme(
                Constants.red_text, 10, FontWeight.normal),
            items: const [
              BottomNavigationBarItem(
                  label: Constants.HOME,
                  icon: Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: Constants.shop,
                  icon: Icon(CupertinoIcons.shopping_cart),
                  activeIcon: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: Constants.bag,
                  icon: Icon(CupertinoIcons.bag),
                  activeIcon: Icon(
                    CupertinoIcons.bag_fill,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: Constants.Favorites,
                  icon: Icon(CupertinoIcons.heart),
                  activeIcon: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: Constants.Profile,
                  icon: Icon(CupertinoIcons.profile_circled),
                  activeIcon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.red,
                  )),
            ]),
      ),
    );
  }
}
