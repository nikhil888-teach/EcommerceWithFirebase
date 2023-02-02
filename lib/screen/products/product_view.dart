import 'package:flutter/material.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({Key? key}) : super(key: key);

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  List size = <String>["XS", "S", "M", "L", "XL"];
  String? selectedsize = "XS";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text("Short dress",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 17),
            child: Icon(
              Icons.share,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: "imageurl",
              child: Image.network(
                "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
                colorBlendMode: BlendMode.multiply,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        child: DropdownButton(
                          value: selectedsize,
                          items: size.map((e) {
                            return DropdownMenuItem<String>(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(e),
                                ));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedsize = value.toString();
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
