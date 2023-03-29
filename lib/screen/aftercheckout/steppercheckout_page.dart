import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/profileoptions/settings_page.dart';
import 'package:ecommerce/screen/aftercheckout/add_address_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyStepperCheckOutPage extends StatefulWidget {
  const MyStepperCheckOutPage({super.key});

  @override
  State<MyStepperCheckOutPage> createState() => _MyStepperCheckOutPageState();
}

enum PaymentOptions { cashonDelivery, onlinePayment }

Country? _country;

class _MyStepperCheckOutPageState extends State<MyStepperCheckOutPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController code = TextEditingController();
  int stepIndex = 0;
  bool isExis = false;
  List<Step> getStep() => [
        Step(
            state: stepIndex > 0 ? StepState.complete : StepState.indexed,
            isActive: stepIndex >= 0,
            title: Text(""),
            label: Text("Address"),
            content: Container()),
        Step(
            state: stepIndex > 1 ? StepState.complete : StepState.indexed,
            isActive: stepIndex >= 1,
            title: Text(""),
            label: Text("Payment"),
            content: Container()),
        Step(
            state: stepIndex == 2 ? StepState.complete : StepState.indexed,
            isActive: stepIndex == 2,
            label: Text("Place order"),
            title: Text(""),
            content: Container()),
      ];
  Razorpay? razorpay;

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
    checkAddress();
  }

  int price = 432;

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': "${price}00",
      'name': 'TestUser',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(response.paymentId.toString())));
    if (!mounted) return;
    setState(() {
      stepIndex++;
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(response.code.toString())));

    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(response.walletName.toString())));
    stepIndex++;
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stepper(
          type: StepperType.horizontal,
          currentStep: stepIndex,
          // onStepCancel: () {
          //   if (stepIndex <= getStep().length - 1) {
          //     setState(() {
          //       if (stepIndex == 0) {
          //         stepIndex = 0;
          //       } else
          //         stepIndex--;
          //     });
          //   }
          // },
          // onStepContinue: () {
          //   if (stepIndex >= 0) {
          //     setState(() {
          //       if (stepIndex == getStep().length - 1) {
          //         stepIndex = getStep().length - 1;
          //       } else
          //         stepIndex++;
          //     });
          //   }
          // },
          steps: getStep(),
          controlsBuilder: (context, details) {
            switch (stepIndex) {
              case 0:
                if (isExis) {
                  return myStepperAddress();
                } else {
                  return myStepAddAddress();
                }
              // checkAddress().then((value) {
              // if (!mounted) return;
              // setState(() {});
              // if (value) {
              //   check = true;
              // } else {
              //   check = false;
              // }
              // });

              // if (check) {
              //   return myStepperAddress();
              // } else {
              //   return myStepAddAddress();
              // }

              case 1:
                return myStepperPayment();
              case 2:
                return Container();
              default:
                return myStepperAddress();
            }
          },
        ),
      ),
    );
  }

  Future<void> checkAddress() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref(Constants.dUser)
        .child(FirebaseAuth.instance.currentUser!.uid);
    await databaseReference.once().then((value) {
      print(value.snapshot.child(Constants.dAddress).value);
      print(value.snapshot.hasChild(Constants.dAddress));

      if (value.snapshot.hasChild(Constants.dAddress)) {
        setState(() {
          isExis = true;
        });
      } else
        setState(() {
          isExis = false;
        });
    });

    // return isExis;
  }

  Widget myStepAddAddress() {
    bool loading = false;
    final themeChange = Provider.of<ThemeProvider>(context);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Textformfield_style.textField(fname, Constants.full_name),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(streetAddress, Constants.address),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(city, Constants.city),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(state, Constants.state),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(code, Constants.code),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Card(
                  color: Colors.white,
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    controller: TextEditingController(
                        text: _country?.displayNameNoCountryCode ??
                            "Select Country"),
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        showSearch: true,
                        countryListTheme: CountryListThemeData(
                            textStyle: TextStyle(
                                color: themeChange.darkTheme
                                    ? Colors.white
                                    : Colors.black)),
                        onSelect: (Country country) {
                          if (!mounted) return;
                          setState(() {
                            _country = country;
                          });
                        },
                      );
                    },
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
                onTap: () {
                  if (!mounted) return;
                  setState(() {
                    loading = true;
                  });
                  FirebaseDatabase.instance
                      .ref(Constants.dUser)
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .child(Constants.dAddress)
                      .push()
                      .update({
                    Constants.dfname: fname.text.trim(),
                    Constants.dSAddress: streetAddress.text.trim(),
                    Constants.dCity: city.text.trim(),
                    Constants.dState: state.text.trim(),
                    Constants.dZcode: code.text.trim(),
                    Constants.dCountry: _country!.name.toString().trim()
                  }).then((value) {
                    if (!mounted) return;
                    setState(() {
                      loading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyStepperCheckOutPage(),
                        ));
                  }).catchError((onError) {
                    if (!mounted) return;
                    setState(() {
                      loading = false;
                    });
                  });
                },
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : Button_Style.button_Theme(Constants.save_address))
          ],
        ),
      ),
    );
  }

  Widget myStepperAddress() {
    bool checkaddress = true;

    return StreamBuilder(
        stream: FirebaseDatabase.instance
            .ref(Constants.dUser)
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child(Constants.dAddress)
            .onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          Map<dynamic, dynamic> data = snapshot.data!.snapshot.value as dynamic;
          List<dynamic> list = [];
          list.clear();
          list.add(data);
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: Text(
                                        list[index][Constants.dfname]
                                            .toString(),
                                        style: Text_Style.text_Theme(
                                            Constants.black_text,
                                            14,
                                            FontWeight.w600,
                                            context),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyAddressPage(),
                                            ));
                                      },
                                      child: Text(
                                        Constants.edit,
                                        style: Text_Style.text_Theme(
                                            Constants.red_text,
                                            14,
                                            FontWeight.w600,
                                            context),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    list[index][Constants.dSAddress].toString(),
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        14,
                                        FontWeight.normal,
                                        context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Text(
                                      list[index][Constants.dCity].toString() +
                                          ", " +
                                          list[index][Constants.dState]
                                              .toString() +
                                          list[index][Constants.dZcode]
                                              .toString() +
                                          ", " +
                                          list[index][Constants.dCountry]
                                              .toString(),
                                      style: Text_Style.text_Theme(
                                          Constants.black_text,
                                          14,
                                          FontWeight.normal,
                                          context)),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                        activeColor: Colors.black,
                                        value: checkaddress,
                                        onChanged: (value) {
                                          if (!mounted) return;
                                          setState(() {
                                            checkaddress = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(Constants.use_add),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    if (!mounted) return;
                    setState(() {
                      stepIndex++;
                    });
                  },
                  child: Button_Style.button_Theme("Deliver to this address")),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyAddressPage(),
                      ));
                    },
                    child: Button_Style.button_Theme("Add a New Address")),
              )
            ],
          );
        });
  }

  PaymentOptions? paymentOptions;
  Widget myStepperPayment() {
    return Column(
      children: [
        Card(
          child: RadioListTile<PaymentOptions>(
            title: Text("Cash on Delivery"),
            value: PaymentOptions.cashonDelivery,
            groupValue: paymentOptions,
            onChanged: (PaymentOptions? value) {
              if (!mounted) return;
              setState(() {
                paymentOptions = value;
              });
            },
          ),
        ),
        Card(
          child: RadioListTile<PaymentOptions>(
            title: Text("Online Payment"),
            value: PaymentOptions.onlinePayment,
            groupValue: paymentOptions,
            onChanged: (PaymentOptions? value) {
              if (!mounted) return;
              setState(() {
                paymentOptions = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              if (paymentOptions == PaymentOptions.onlinePayment) {
                openCheckout();
              } else if (paymentOptions == PaymentOptions.cashonDelivery) {
                if (!mounted) return;
                setState(() {
                  stepIndex++;
                });
              } else {
                Scaffold_msg.toastMessage(context, "Please select options");
              }
            },
            child: Button_Style.button_Theme("Continue"))
      ],
    );
  }
}
