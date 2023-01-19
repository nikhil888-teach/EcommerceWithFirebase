import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Stack(fit: StackFit.expand, children: [
                Image.asset(
                  "assets/image/homebanner.png",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 40,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fashion",
                        style: google_fonts.GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "sale",
                        style: google_fonts.GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 39),
                              child: Center(
                                child: Text(
                                  "Check",
                                  style: google_fonts.GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New",
                              style: google_fonts.GoogleFonts.roboto(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, right: 15),
                              child: Text("View all"),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "You've never seen it before",
                          style: google_fonts.GoogleFonts.roboto(
                              color: const Color(0xff9B9B9B),
                              fontSize: 11,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2.87,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 22, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Ink(
                                          decoration:
                                              const BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 0),
                                                blurRadius: 5),
                                          ]),
                                          child: Image.network(
                                            "https://m.media-amazon.com/images/I/61XdzIyV6hL._UY741_.jpg",
                                            fit: BoxFit.fill,
                                            color: Colors.grey.shade300,
                                            colorBlendMode: BlendMode.multiply,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                          )),
                                      Positioned(
                                        left: 8,
                                        top: 8,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(29)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text("New",
                                                style: google_fonts.GoogleFonts
                                                    .roboto(
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
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
                                                  BorderRadius.circular(29)),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        const Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.yellow,
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2, bottom: 8),
                                        child: Text(
                                          "(10)",
                                          style:
                                              google_fonts.GoogleFonts.roboto(
                                                  color:
                                                      const Color(0xff9B9B9B),
                                                  fontSize: 10,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Dorothy Perkins",
                                  style: google_fonts.GoogleFonts.roboto(
                                      color: const Color(0xff9B9B9B),
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 3),
                                  child: Text(
                                    "Evening Dress",
                                    style: google_fonts.GoogleFonts.roboto(
                                        color: const Color(0xff222222),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Text(
                                        "15\$",
                                        style: google_fonts.GoogleFonts.roboto(
                                            color: const Color(0xff9B9B9B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "12\$",
                                      style: google_fonts.GoogleFonts.roboto(
                                          color: const Color(0xffDB3022),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
