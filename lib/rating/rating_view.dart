import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';

class MyRatingPage extends StatefulWidget {
  const MyRatingPage({super.key});

  @override
  State<MyRatingPage> createState() => _MyRatingPageState();
}

class _MyRatingPageState extends State<MyRatingPage> {
  TextEditingController reviewControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Rating and Review",
          style: Text_Style.text_Theme(
              Constants.black_text, 18, FontWeight.bold, context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "8 reviews",
                  style: Text_Style.text_Theme(
                      Constants.black_text, 22, FontWeight.bold, context),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZLOqSTm8TatG1IB-m0E6Ce5GfeQSZ4U5yPQ&usqp=CAU"),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 3),
                                child: Column(
                                  children: [
                                    Text(
                                      "Salman Khan",
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          14,
                                          FontWeight.bold,
                                          context),
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.yellow[800],
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
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "I loved this dress so much as soon as I tried it on I knew I had to buy it in another color. I am 5'3 about 155lbs and I carry all my weight in my upper body. When I put it on I felt like it thinned me put and I got so many compliments.",
                              style: Text_Style.text_Theme(Constants.grey_text,
                                  14, FontWeight.normal, context),
                            ),
                          )
                        ],
                      ),
                    )),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34))),
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: BoxDecoration(),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          width: 60,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Column(
                          children: [
                            Text(
                              "What is you rate?",
                              style: Text_Style.text_Theme(Constants.black_text,
                                  18, FontWeight.bold, context),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star,
                                      size: 35,
                                      color: Colors.yellow[800],
                                    ),
                                ],
                              ),
                            ),
                            Text(
                              "Please share your opinion",
                              style: Text_Style.text_Theme(Constants.black_text,
                                  16, FontWeight.bold, context),
                            ),
                            Text("about the product",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    16,
                                    FontWeight.bold,
                                    context)),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Card(
                                color: Colors.white,
                                elevation: 2,
                                child: TextFormField(
                                  controller: reviewControl,
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  enabled: true,
                                  enableInteractiveSelection: true,
                                  cursorColor: Colors.grey,
                                  maxLines: null,
                                  minLines: 5,
                                  decoration: InputDecoration(
                                      hintText: "Your review",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                            Button_Style.button_Theme("SEND REVIEW")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.red,
        label: Text(
          "Write a review",
          style: Text_Style.text_Theme(
              Constants.white_text, 14, FontWeight.bold, context),
        ),
        icon: Icon(Icons.edit),
      ),
    );
  }
}
