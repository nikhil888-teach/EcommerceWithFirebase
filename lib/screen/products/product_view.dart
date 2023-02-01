import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({Key? key}) : super(key: key);

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  List size = <String>["XS", "S", "M", "L", "XL"];
  String? selectedsize = "XS";
  List color = <String>["White", "Black", "Pink", "Blue", "Grey"];
  String? selectedcolor = "Black";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(25)),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Center(
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Expanded(
          child: Container(
            child: Column(
              children: [
                Hero(
                  tag: "imageurl",
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Image.network(
                      "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade300,
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: DropdownButtonFormField(
                              alignment: Alignment.topCenter,
                              elevation: 0,
                              decoration: InputDecoration(
                                  fillColor: Colors.red,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff9B9B9B)),
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              value: selectedsize,
                              items: size.map((e) {
                                return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                    ));
                              }).toList(),
                              onChanged: (value) {
                                if (!mounted) return;
                                setState(() {
                                  selectedsize = value.toString();
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: DropdownButtonFormField(
                              alignment: Alignment.topCenter,
                              elevation: 0,
                              decoration: InputDecoration(
                                  fillColor: Colors.red,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff9B9B9B)),
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              value: selectedcolor,
                              items: color.map((e) {
                                return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                    ));
                              }).toList(),
                              onChanged: (value) {
                                if (!mounted) return;
                                setState(() {
                                  selectedcolor = value.toString();
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29)),
                            child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.grey,
                                  size: 28,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Evening Dress",
                              style: TextStyle(
                                  color: Color(0xff222222),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$19.99",
                              style: TextStyle(
                                  color: Color(0xff222222),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Dorothy Perkins",
                        style: const TextStyle(
                            color: Color(0xff9B9B9B),
                            fontSize: 11,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 8),
                        child: Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.yellow,
                              ),
                            Text(
                              "(10)",
                              style: const TextStyle(
                                  color: Color(0xff9B9B9B),
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                        style: TextStyle(
                            color: Color(0xff9B9B9B),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 12),
                        child: Text("You can also like this",
                            style: TextStyle(
                                color: Color(0xff222222),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 22, right: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyProductPage(),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          Ink(
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(0, 0),
                                                        blurRadius: 5),
                                                  ]),
                                              child: Hero(
                                                tag: "imageurl" +
                                                    index.toString(),
                                                child: Image.network(
                                                  "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                                  fit: BoxFit.fill,
                                                  color: Colors.grey.shade300,
                                                  colorBlendMode:
                                                      BlendMode.multiply,
                                                  scale: 4,
                                                ),
                                              )),
                                          Positioned(
                                            left: 8,
                                            top: 8,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29)),
                                              child: const Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Text("New",
                                                    style: TextStyle(
                                                      color: Color(0xffFFFFFF),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29)),
                                              child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Icon(
                                                    CupertinoIcons.heart,
                                                    color: Colors.grey,
                                                    size: 14,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 7),
                                            child: Row(
                                              children: [
                                                for (int i = 0; i < 5; i++)
                                                  const Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Colors.yellow,
                                                  ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2, bottom: 0),
                                                  child: Text(
                                                    "(10)",
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff9B9B9B),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Dorothy Perkins",
                                          style: const TextStyle(
                                              color: Color(0xff9B9B9B),
                                              fontSize: 11,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 3),
                                          child: const Text(
                                            "Evening Dress",
                                            style: TextStyle(
                                                color: Color(0xff222222),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4),
                                              child: Text(
                                                "15\$",
                                                style: const TextStyle(
                                                    color: Color(0xff9B9B9B),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const Text(
                                              "12\$",
                                              style: TextStyle(
                                                  color: Color(0xffDB3022),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
