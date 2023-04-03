import 'package:draggable_fab/draggable_fab.dart';
import 'package:ecommerce/screen/chat/chatScreen.dart';
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
  const MyProfilePage(),
];

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pagess.elementAt(currentindex),
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
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: Text_Style.text_Theme(
                Constants.grey_text, 10, FontWeight.normal, context),
            items: const [
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
                  icon: Icon(CupertinoIcons.bag),
                  activeIcon: Icon(
                    CupertinoIcons.bag_fill,
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
