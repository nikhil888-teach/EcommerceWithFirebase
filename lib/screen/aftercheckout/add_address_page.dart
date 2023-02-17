import 'package:csc_picker/csc_picker.dart';
import 'package:ecommerce/screen/aftercheckout/checkout_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  String country = "Country";
  TextEditingController fname = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController code = TextEditingController();
  @override
  void initState() {
    country = "Country";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text("Shipping Addresses",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold)),
      ),
      body: SingleChildScrollView(
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
                  child: CSCPicker(
                    dropdownDecoration: BoxDecoration(),
                    onCountryChanged: (value) {
                      setState(() {
                        country = value;
                      });
                    },
                    showCities: false,
                    onCityChanged: (value) {},
                    showStates: false,
                    countryDropdownLabel: country,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyCheckOut(),
                        ));
                  },
                  child: Button_Style.button_Theme(Constants.save_address))
            ],
          ),
        ),
      ),
    ));
  }
}
