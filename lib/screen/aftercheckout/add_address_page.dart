import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool loading = false;

  bool isExis = false;
  @override
  void initState() {
    if (widget.id != null) {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref(Constants.dUser)
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(Constants.dAddress)
          .child(widget.id.toString());
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
    } else {
      var database = FirebaseDatabase.instance
          .ref(Constants.dUser)
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(Constants.duname);
      database.once().then(
          (value) => fnameController.text = value.snapshot.value.toString());
    }
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
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
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
                    Textformfield_style.textField(fnameController,
                        Constants.full_name, TextInputType.name),
                    const SizedBox(
                      height: 8,
                    ),
                    Textformfield_style.textField(streetAddressController,
                        Constants.address, TextInputType.streetAddress),
                    const SizedBox(
                      height: 8,
                    ),
                    Textformfield_style.textField(cityController,
                        Constants.city, TextInputType.streetAddress),
                    const SizedBox(
                      height: 8,
                    ),
                    Textformfield_style.textField(stateController,
                        Constants.state, TextInputType.streetAddress),
                    const SizedBox(
                      height: 8,
                    ),
                    Textformfield_style.textField(codeController,
                        Constants.code, TextInputType.streetAddress),
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
                                hintText:
                                    widget.id == null ? "Select Country" : null,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
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

                                    countryController.text = _country!.name;
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
                          DatabaseReference databaseReference = widget.id !=
                                  null
                              ? FirebaseDatabase.instance
                                  .ref(Constants.dUser)
                                  .child(FirebaseAuth.instance.currentUser!.uid)
                                  .child(Constants.dAddress)
                                  .child(widget.id.toString())
                              : FirebaseDatabase.instance
                                  .ref(Constants.dUser)
                                  .child(FirebaseAuth.instance.currentUser!.uid)
                                  .child(Constants.dAddress)
                                  .push();

                          databaseReference.update({
                            Constants.daddressId: databaseReference.key,
                            Constants.dfname: fnameController.text.trim(),
                            Constants.dSAddress:
                                streetAddressController.text.trim(),
                            Constants.dCity: cityController.text.trim(),
                            Constants.dState: stateController.text.trim(),
                            Constants.dZcode: codeController.text.trim(),
                            Constants.dCountry:
                                countryController.text.toString().trim()
                          }).then((value) {
                            if (!mounted) return;
                            setState(() {
                              loading = false;
                              isExis = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyMainPage(),
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
                            : Button_Style.button_Theme(widget.id == null
                                ? Constants.save_address
                                : Constants.update_address))
                  ],
                ),
              ),
            )));
  }
}
