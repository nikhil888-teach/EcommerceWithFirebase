import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.only(top: 18, left: 15, right: 15, bottom: 15),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25, top: 18),
            child: Text(
              "My profile",
              style: TextStyle(
                  color: const Color(0xff222222),
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.red,
                child: ClipOval(
                    child: Image.network(
                        'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Matilda Brown",
                      style: TextStyle(
                          color: const Color(0xff222222),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "matildabrown@mail.com",
                      style: TextStyle(
                          color: const Color(0xff9B9B9B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 5),
            child: Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  "My orders",
                  style: TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  "Shipping addresses",
                  style: TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  "Payment methods",
                  style: TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  "Promocodes",
                  style: TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  "My reviews",
                  style: TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
