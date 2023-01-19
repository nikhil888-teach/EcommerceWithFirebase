import 'package:ecommerce/screen/home/bag_pages.dart';
import 'package:ecommerce/screen/home/favorite_page.dart';
import 'package:ecommerce/screen/home/home_page.dart';
import 'package:ecommerce/screen/home/profile_page.dart';
import 'package:ecommerce/screen/home/shope_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

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
  const MyProfilePage(),
];

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pagess.elementAt(currentindex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
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
            unselectedLabelStyle: google_fonts.GoogleFonts.roboto(
                color: const Color(0xff9B9B9B),
                fontSize: 10,
                fontWeight: FontWeight.normal),
            selectedLabelStyle: google_fonts.GoogleFonts.roboto(
                color: Color(0xffDB3022),
                fontSize: 10,
                fontWeight: FontWeight.normal),
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: "Shop",
                  icon: Icon(CupertinoIcons.shopping_cart),
                  activeIcon: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: "Bag",
                  icon: Icon(CupertinoIcons.bag),
                  activeIcon: Icon(
                    CupertinoIcons.bag_fill,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: "Favorites",
                  icon: Icon(CupertinoIcons.heart),
                  activeIcon: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: "Profile",
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
