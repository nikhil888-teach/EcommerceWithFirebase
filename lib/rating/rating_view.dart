import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRatingPage extends StatefulWidget {
  const MyRatingPage({super.key, required this.id});
  final String id;

  @override
  State<MyRatingPage> createState() => _MyRatingPageState();
}

class _MyRatingPageState extends State<MyRatingPage> {
  TextEditingController reviewControl = TextEditingController();
  int? selectedRate;
  bool loading = false;
  bool alreadyAddorNot = false;
  String? comment;
  int? rate;
  String? ratingId;
  double? calculateRating;
  @override
  void initState() {
    alreadyRatingOrNot();
    super.initState();
  }

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
      body: StreamBuilder(
          stream: FirebaseDatabase.instance
              .ref(Constants.dProducts)
              .child(widget.id)
              .onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (!snapshot.data!.snapshot.hasChild(Constants.dRating)) {
              return Center(
                child: Text("No review"),
              );
            } else {
              Map<dynamic, dynamic> data = snapshot.data!.snapshot
                  .child(Constants.dRating)
                  .value as dynamic;
              List<dynamic> list = [];
              list.clear();
              for (var element in data.values) {
                list.add(element);
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          list.length.toString() + " reviews",
                          style: Text_Style.text_Theme(Constants.black_text, 22,
                              FontWeight.bold, context),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          int? perUserRate =
                              list[index][Constants.dUserRate] + 1;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            list[index][Constants.dProimage]
                                                .toString()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, bottom: 3),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list[index][Constants.duname],
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
                                                    color: list[index][Constants
                                                                .dUserRate] >=
                                                            i
                                                        ? Colors.yellow[800]
                                                        : Colors.grey,
                                                  ),
                                                Text(
                                                  "(${perUserRate.toString()})",
                                                  style: const TextStyle(
                                                      color: Color(0xff9B9B9B),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.normal),
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
                                      list[index][Constants.dComment],
                                      style: Text_Style.text_Theme(
                                          Constants.grey_text,
                                          14,
                                          FontWeight.normal,
                                          context),
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
              );
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (comment != null || rate != null) {
            if (!mounted) return;
            setState(() {
              reviewControl.text = comment!;
              selectedRate = rate;
            });
          }

          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34))),
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) => Padding(
                  padding: EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 1.5,
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
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    18,
                                    FontWeight.bold,
                                    context),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                if (!mounted) return;
                                                setState(() {
                                                  selectedRate = index;
                                                });
                                              },
                                              icon: Icon(Icons.star,
                                                  size: 35,
                                                  color: selectedRate == null
                                                      ? Colors.grey
                                                      : selectedRate! >= index
                                                          ? Colors.yellow[800]
                                                          : Colors.grey));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Please share your opinion",
                                style: Text_Style.text_Theme(
                                    Constants.black_text,
                                    16,
                                    FontWeight.bold,
                                    context),
                              ),
                              Text("about the product",
                                  style: Text_Style.text_Theme(
                                      Constants.black_text,
                                      16,
                                      FontWeight.bold,
                                      context)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
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
                              InkWell(
                                  onTap: () async {
                                    if (!mounted) return;
                                    setState(() {
                                      loading = true;
                                    });
                                    alreadyRatingOrNot();
                                    if (alreadyAddorNot) {
                                      addRatingToProduct();
                                    } else {
                                      addRatingToProduct();
                                    }
                                  },
                                  child: loading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.red,
                                          ),
                                        )
                                      : Button_Style.button_Theme(
                                          alreadyAddorNot
                                              ? "UPDATE REVIEW"
                                              : "SEND REVIEW"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ).whenComplete(() {
            selectedRate = null;
            reviewControl.clear();
          });
        },
        backgroundColor: Colors.red,
        label: Text(
          alreadyAddorNot ? "Edit a review" : "Write a review",
          style: Text_Style.text_Theme(
              Constants.white_text, 14, FontWeight.bold, context),
        ),
        icon: Icon(Icons.edit),
      ),
    );
  }

  addRatingToProduct() {
    DatabaseReference databaseReference = alreadyAddorNot
        ? FirebaseDatabase.instance
            .ref(Constants.dProducts)
            .child(widget.id)
            .child(Constants.dRating)
            .child(ratingId!)
        : FirebaseDatabase.instance
            .ref(Constants.dProducts)
            .child(widget.id)
            .child(Constants.dRating)
            .push();
    DatabaseReference reference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid);
    reference.once().then((value) {
      databaseReference.update({
        Constants.dRatingId: alreadyAddorNot ? ratingId : databaseReference.key,
        Constants.dUserRate: selectedRate,
        Constants.dComment: reviewControl.text,
        Constants.duname: value.snapshot.child(Constants.duname).value,
        Constants.dProimage: value.snapshot.child(Constants.dProimage).value,
        Constants.dUserid: FirebaseAuth.instance.currentUser!.uid
      }).then((value) async {
        await calculateRatings();
        DatabaseReference database =
            FirebaseDatabase.instance.ref(Constants.dProducts).child(widget.id);
        database.update({Constants.dTotalRating: calculateRating!.round()});

        Navigator.pop(context);
        if (!mounted) return;
        setState(() {
          loading = false;
        });
        alreadyRatingOrNot();
      });
    });
  }

  calculateRatings() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dProducts)
        .child(widget.id)
        .child(Constants.dRating);

    await databaseReference.orderByKey().once().then((value) {
      calculateRating = 0;
      value.snapshot.children.forEach((element) {
        calculateRating = calculateRating! +
            int.parse(element.child(Constants.dUserRate).value.toString());
      });
      if (calculateRating != null) {
        calculateRating = calculateRating! / value.snapshot.children.length;
      }
    });
  }

  alreadyRatingOrNot() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dProducts)
        .child(widget.id)
        .child(Constants.dRating);
    await databaseReference.orderByKey().once().then((value) {
      value.snapshot.children.forEach((element) {
        if (element.child(Constants.dUserid).value.toString() ==
            FirebaseAuth.instance.currentUser!.uid) {
          if (!mounted) return;
          setState(() {
            alreadyAddorNot = true;
          });
          comment = element.child(Constants.dComment).value.toString();
          rate = element.child(Constants.dUserRate).value as int?;
          ratingId = element.child(Constants.dRatingId).value.toString();
        }
      });
    });
  }
}
