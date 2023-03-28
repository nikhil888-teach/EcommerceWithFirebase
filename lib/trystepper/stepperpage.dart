import 'package:ecommerce/screen/aftercheckout/add_address_page.dart';
import 'package:ecommerce/screen/aftercheckout/shipping_page.dart';
import 'package:ecommerce/screen/aftercheckout/success_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyStepperPage extends StatefulWidget {
  const MyStepperPage({super.key});

  @override
  State<MyStepperPage> createState() => _MyStepperPageState();
}

enum PaymentOptions { cashonDelivery, onlinePayment }

class _MyStepperPageState extends State<MyStepperPage> {
  int stepIndex = 0;
  List<Step> getStep() => [
        Step(
            isActive: stepIndex >= 0,
            title: Text(""),
            label: Text("Address"),
            content: Container()),
        Step(
            isActive: stepIndex >= 1,
            title: Text(""),
            label: Text("Payment"),
            content: Container()),
        Step(
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
                return myStepperAddress();
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

  Widget myStepperAddress() {
    bool checkaddress = true;

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 1,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  "Jane Doe",
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
                                        builder: (context) => MyAddressPage(),
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
                              "3 Newbridge Court",
                              style: Text_Style.text_Theme(Constants.black_text,
                                  14, FontWeight.normal, context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Text("Chino Hills, CA 91709, United States",
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
              stepIndex++;
              setState(() {});
            },
            child: Button_Style.button_Theme("Deliver to this address")),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Button_Style.button_Theme("Add a New Address"),
        )
      ],
    );
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
                openCheckout();
              });
            },
          ),
        ),
      ],
    );
  }
}
