import 'dart:io';
import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/invoice/api/pdf_api.dart';
import 'package:ecommerce/invoice/api/pdf_invoice_api.dart';
import 'package:ecommerce/invoice/model/customer.dart';
import 'package:ecommerce/invoice/model/invoice.dart';
import 'package:ecommerce/invoice/model/supplier.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyStepperCheckOutPage extends StatefulWidget {
  const MyStepperCheckOutPage(
      {super.key,
      required this.id,
      required this.total,
      required this.productLength});
  final String id;
  final int total;
  final int productLength;

  @override
  State<MyStepperCheckOutPage> createState() => _MyStepperCheckOutPageState();
}

enum PaymentOptions { cashonDelivery, onlinePayment }

Country? _country;

class _MyStepperCheckOutPageState extends State<MyStepperCheckOutPage> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  int stepIndex = 0;
  bool isExis = false;
  bool isPaymentSuccess = false;
  String? paymentNo;
  String? selectedAddress;
  String? selectedPaymentOptions;
  String? userName;
  String? userAddress;
  int? orderNo;
  String? orderid;
  List invoiceList = [];
  bool invoiceLoader = false;

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
  int selectedRadio = 0;

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
  // Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    if (!mounted) return;
    setState(() {
      selectedRadio = val;
    });
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': "${widget.total}00",
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
    paymentNo = response.paymentId;
    addOrderToDatabase();
    if (!mounted) return;
    setState(() {
      stepIndex++;
      isPaymentSuccess = true;
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(response.code.toString())));
    paymentNo = response.code.toString();

    if (!mounted) return;
    setState(() {
      stepIndex++;
      isPaymentSuccess = false;
    });

    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(response.walletName.toString())));
    paymentNo =
        (response.walletName! + new Random().nextInt(100000).toString());
    addOrderToDatabase();

    if (!mounted) return;
    setState(() {
      stepIndex++;
      isPaymentSuccess = true;
    });
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  dynamic selectId;

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
                  return myStepAddAddress(selectId ?? null);
                }

              case 1:
                return myStepperPayment();
              case 2:
                return myFinalPage();
              default:
                return myStepperAddress();
            }
          },
        ),
      ),
    );
  }

  Widget myFinalPage() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        isPaymentSuccess
                            ? "assets/image/success.png"
                            : "assets/image/failed.png",
                        scale: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        isPaymentSuccess ? Constants.success : Constants.failed,
                        style: Text_Style.text_Theme(
                            Constants.black_text, 34, FontWeight.bold, context),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        isPaymentSuccess
                            ? Constants.succ_text
                            : Constants.fail_msg,
                        style: Text_Style.text_Theme(Constants.black_text, 15,
                            FontWeight.normal, context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                    onTap: () {
                      if (isPaymentSuccess) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyMainPage(
                            currentIndex: 2,
                          ),
                        ));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyMainPage(
                            currentIndex: 2,
                          ),
                        ));
                      }
                    },
                    child: Button_Style.button_Theme(isPaymentSuccess
                        ? Constants.conti_shop
                        : Constants.try_again)),
              ),
              isPaymentSuccess
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                          onTap: () {
                            if (!mounted) return;
                            setState(() {
                              invoiceLoader = true;
                            });
                            DatabaseReference databaseReference =
                                FirebaseDatabase.instance
                                    .ref(Constants.dorder)
                                    .child(orderid!);
                            databaseReference
                                .child(Constants.dProducts)
                                .once()
                                .then((value) {
                              print(value);
                              invoiceList.clear();

                              value.snapshot.children.forEach((element) {
                                invoiceList.add(element.value);
                              });
                            }).then((value) async {
                              final DateTime now = DateTime.now();
                              final DateFormat formatter =
                                  DateFormat('dd-MM-yyyy');
                              // final String formatted = formatter.format(now);

                              if (isPaymentSuccess && invoiceList.isNotEmpty) {
                                final date = formatter.format(now);
                                final dueDate = formatter
                                    .format(now.add(const Duration(days: 7)));

                                final invoice = Invoice(
                                  totalPrice: widget.total,
                                  supplier: const Supplier(
                                    name: 'Ecommerce Bot',
                                    address: 'Surat Gujarat.',
                                    paymentInfo: '',
                                  ),
                                  customer: Customer(
                                    name: userName!,
                                    address: userAddress!,
                                  ),
                                  info: InvoiceInfo(
                                    date: date.toString(),
                                    dueDate: dueDate.toString(),
                                    description:
                                        'Enjoy your Shoping with Ecommerce Bot',
                                    number: orderNo.toString(),
                                  ),
                                  items: invoiceList
                                      .map(
                                        (e) => InvoiceItem(
                                          description: e['Pname'],
                                          date: date,
                                          quantity: e['Quantity'],
                                          vat: '',
                                          unitPrice: e['Price'],
                                          total: e['Quantity'] * e['Price'],
                                        ),
                                      )
                                      .toList(),
                                );

                                final pdfFile =
                                    await PdfInvoiceApi.generate(invoice);

                                PdfApi.openFile(pdfFile).then((value) {
                                  if (!mounted) return;
                                  setState(() {
                                    invoiceLoader = false;
                                  });
                                });
                              }
                              ;
                            });
                          },
                          child: invoiceLoader
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                )
                              : Button_Style.button_Theme(
                                  Constants.check_invoice)),
                    )
                  : SizedBox(),
            ],
          ),
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
        if (!mounted) return;
        setState(() {
          isExis = true;
        });
      } else {
        if (!mounted) return;
        setState(() {
          isExis = false;
        });
      }
    });

    // return isExis;
  }

  var countryname;

  Widget myStepAddAddress(String? id) {
    bool loading = false;
    final themeChange = Provider.of<ThemeProvider>(context);
    if (id != null) {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref(Constants.dUser)
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(Constants.dAddress)
          .child(id.toString());
      databaseReference.once().then((value) {
        fnameController.text =
            value.snapshot.child(Constants.dfname).value.toString();
        streetAddressController.text =
            value.snapshot.child(Constants.dSAddress).value.toString();
        cityController.text =
            value.snapshot.child(Constants.dCity).value.toString();
        stateController.text =
            value.snapshot.child(Constants.dState).value.toString();
        codeController.text =
            value.snapshot.child(Constants.dZcode).value.toString();
        countryController.text =
            value.snapshot.child(Constants.dCountry).value.toString();
      });
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Textformfield_style.textField(
                fnameController, Constants.full_name, TextInputType.name),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(streetAddressController,
                Constants.address, TextInputType.streetAddress),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(
                cityController, Constants.city, TextInputType.streetAddress),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(
                stateController, Constants.state, TextInputType.streetAddress),
            const SizedBox(
              height: 8,
            ),
            Textformfield_style.textField(
                codeController, Constants.code, TextInputType.streetAddress),
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
                    controller: countryController,
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
                  DatabaseReference databaseReference = id != null
                      ? FirebaseDatabase.instance
                          .ref(Constants.dUser)
                          .child(FirebaseAuth.instance.currentUser!.uid)
                          .child(Constants.dAddress)
                          .child(id)
                      : FirebaseDatabase.instance
                          .ref(Constants.dUser)
                          .child(FirebaseAuth.instance.currentUser!.uid)
                          .child(Constants.dAddress)
                          .push();

                  databaseReference.update({
                    Constants.daddressId: databaseReference.key,
                    Constants.dfname: fnameController.text.trim(),
                    Constants.dSAddress: streetAddressController.text.trim(),
                    Constants.dCity: cityController.text.trim(),
                    Constants.dState: stateController.text.trim(),
                    Constants.dZcode: codeController.text.trim(),
                    Constants.dCountry: _country!.name.toString().trim()
                  }).then((value) {
                    if (!mounted) return;
                    setState(() {
                      loading = false;
                      isExis = true;
                    });
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
                    : Button_Style.button_Theme(id == null
                        ? Constants.save_address
                        : Constants.update_address))
          ],
        ),
      ),
    );
  }

  Widget myStepperAddress() {
    final themeChange = Provider.of<ThemeProvider>(context);

    return StreamBuilder(
        stream: FirebaseDatabase.instance
            .ref(Constants.dUser)
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child(Constants.dAddress)
            .onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }

          Map<dynamic, dynamic> id = snapshot.data!.snapshot.value as dynamic;
          List<dynamic> list = [];
          list.clear();
          for (var element in id.values) {
            list.add(element);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    userName = list[0][Constants.dfname].toString();
                    userAddress = list[0][Constants.dCity].toString() +
                        ",\n" +
                        list[0][Constants.dState].toString() +
                        " " +
                        list[0][Constants.dZcode].toString() +
                        ",\n" +
                        list[0][Constants.dCountry].toString();
                    selectedAddress =
                        list[index][Constants.dSAddress].toString() +
                            ", " +
                            list[index][Constants.dCity].toString() +
                            ", " +
                            list[index][Constants.dState].toString() +
                            " " +
                            list[index][Constants.dZcode].toString() +
                            ", " +
                            list[index][Constants.dCountry].toString();
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
                                        if (!mounted) return;
                                        setState(() {
                                          isExis = false;
                                          print(list[index]
                                              [Constants.daddressId]);
                                          selectId =
                                              list[index][Constants.daddressId];
                                        });
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
                                          " " +
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
                                RadioListTile<dynamic>(
                                  title: Text(
                                    Constants.use_add,
                                    style: Text_Style.text_Theme(
                                        Constants.black_text,
                                        14,
                                        FontWeight.normal,
                                        context),
                                  ),
                                  activeColor: themeChange.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  value: index,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                    userName = list[value][Constants.dfname]
                                        .toString();
                                    userAddress = list[value][Constants.dCity]
                                            .toString() +
                                        ",\n" +
                                        list[value][Constants.dState]
                                            .toString() +
                                        " " +
                                        list[value][Constants.dZcode]
                                            .toString() +
                                        ",\n" +
                                        list[value][Constants.dCountry]
                                            .toString();
                                  },
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
                      if (!mounted) return;
                      setState(() {
                        isExis = false;
                      });
                    },
                    child: Button_Style.button_Theme("Add a New Address")),
              )
            ],
          );
        });
  }

  PaymentOptions? paymentOptions;
  Widget myStepperPayment() {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Card(
          child: RadioListTile<PaymentOptions>(
            activeColor: themeChange.darkTheme ? Colors.white : Colors.black,
            title: Text(
              "Cash on Delivery",
              style: Text_Style.text_Theme(
                  Constants.black_text, 14, FontWeight.bold, context),
            ),
            value: PaymentOptions.cashonDelivery,
            groupValue: paymentOptions,
            onChanged: (PaymentOptions? value) {
              if (!mounted) return;
              setState(() {
                paymentOptions = value;
                selectedPaymentOptions = "Cash on Delivery";
              });
            },
          ),
        ),
        Card(
          child: RadioListTile<PaymentOptions>(
            activeColor: themeChange.darkTheme ? Colors.white : Colors.black,
            title: Text(
              "Online Payment",
              style: Text_Style.text_Theme(
                  Constants.black_text, 14, FontWeight.bold, context),
            ),
            value: PaymentOptions.onlinePayment,
            groupValue: paymentOptions,
            onChanged: (PaymentOptions? value) {
              if (!mounted) return;
              setState(() {
                paymentOptions = value;
                selectedPaymentOptions = "Online Payment";
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
                addOrderToDatabase();

                if (!mounted) return;
                setState(() {
                  stepIndex++;

                  isPaymentSuccess = true;
                });
              } else {
                Scaffold_msg.toastMessage(context, "Please select options");
              }
            },
            child: Button_Style.button_Theme("Continue"))
      ],
    );
  }

  void addOrderToDatabase() {
    paymentNo = 1000.toString() + Random().nextInt(1000000).toString();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref(Constants.dorder).push();
    orderNo = new Random().nextInt(10000);
    databaseReference.update({
      Constants.dorderno: orderNo,
      Constants.dtrackNum: paymentNo,
      Constants.dodate: DateTime.now().toString(),
      Constants.dShipAddress: selectedAddress,
      Constants.dtotal: widget.total,
      Constants.dPayment: selectedPaymentOptions,
      Constants.dUserid: FirebaseAuth.instance.currentUser!.uid,
      Constants.dokey: databaseReference.key,
      Constants.dstatus: Constants.dProcessing,
      Constants.dTotalProduct: widget.productLength
    }).then((value) {
      orderid = databaseReference.key;
      DatabaseReference database = FirebaseDatabase.instance
          .ref(Constants.dUser)
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(Constants.dAddToCart);
      database.orderByKey().once().then((value) {
        value.snapshot.children.forEach((element) {
          element.hasChild(Constants.dColor)
              ? databaseReference.child(Constants.dProducts).push().update({
                  Constants.dPid: element.child(Constants.dPid).value,
                  Constants.dPname: element.child(Constants.dPname).value,
                  Constants.dQuantity: element.child(Constants.dQuantity).value,
                  Constants.dSize: element.child(Constants.dSize).value,
                  Constants.dColor: element.child(Constants.dColor).value,
                  Constants.dimages: element.child(Constants.dimages).value,
                  Constants.dSPrice: element.child(Constants.dSPrice).value,
                }).whenComplete(() {
                  FirebaseDatabase.instance
                      .ref(Constants.dUser)
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .child(Constants.dAddToCart)
                      .remove();
                })
              : databaseReference.child(Constants.dProducts).push().update({
                  Constants.dPid: element.child(Constants.dPid).value,
                  Constants.dPname: element.child(Constants.dPname).value,
                  Constants.dQuantity: element.child(Constants.dQuantity).value,
                  Constants.dimages: element.child(Constants.dimages).value,
                  Constants.dSPrice: element.child(Constants.dSPrice).value,
                }).whenComplete(() {
                  FirebaseDatabase.instance
                      .ref(Constants.dUser)
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .child(Constants.dAddToCart)
                      .remove();
                });
        });
      });
    });
  }
}
