import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/screen/aftercheckout/checkout_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController code = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Country? _country;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text("Shipping Addresses",
            style: Text_Style.text_Theme(
                Constants.black_text, 18, FontWeight.bold, context)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              Textformfield_style.textField(
                  fname, Constants.full_name, TextInputType.name),
              const SizedBox(
                height: 8,
              ),
              Textformfield_style.textField(streetAddress, Constants.address,
                  TextInputType.streetAddress),
              const SizedBox(
                height: 8,
              ),
              Textformfield_style.textField(
                  city, Constants.city, TextInputType.streetAddress),
              const SizedBox(
                height: 8,
              ),
              Textformfield_style.textField(
                  state, Constants.state, TextInputType.streetAddress),
              const SizedBox(
                height: 8,
              ),
              Textformfield_style.textField(
                  code, Constants.code, TextInputType.streetAddress),
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
                          showSearch: false,
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
