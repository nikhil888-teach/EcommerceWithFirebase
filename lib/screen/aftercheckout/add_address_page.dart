import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/screen/aftercheckout/shipping_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/button_theme.dart';
import 'package:ecommerce/widgets/scafoldmsg_theme.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:ecommerce/widgets/textformfield_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  // TextEditingController cityController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;

  final Map<String, List<String>> _statesByCountry = {
    'USA': ['California', 'Florida', 'Texas'],
    'Canada': ['Ontario', 'Quebec', 'Alberta'],
    'India': [
      'Maharashtra',
      'Uttar Pradesh',
      'West Bengal',
      'Karnataka',
      'Gujarat',
      'Tamil Nadu'
    ],
    'Nepal': [
      'Province No. 1',
      'Province No. 2',
      'Bagmati Province',
      'Gandaki Province',
      'Lumbini Province',
      'Karnali Province',
      'Sudurpashchim Province'
    ]
  };

  final Map<String, List<String>> _citiesByState = {
    'California': ['Los Angeles', 'San Francisco', 'San Diego'],
    'Florida': ['Miami', 'Orlando', 'Tampa'],
    'Texas': ['Houston', 'Dallas', 'Austin'],
    'Ontario': ['Toronto', 'Ottawa', 'Hamilton'],
    'Quebec': ['Montreal', 'Quebec City', 'Gatineau'],
    'Alberta': ['Calgary', 'Edmonton', 'Red Deer'],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur'],
    'Uttar Pradesh': ['Lucknow', 'Kanpur', 'Agra'],
    'West Bengal': ['Kolkata', 'Darjeeling', 'Siliguri'],
    'Karnataka': ['Bengaluru', 'Mysuru', 'Hubli'],
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara'],
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai'],
    'Province No. 1': ['Biratnagar', 'Dharan', 'Bhadrapur'],
    'Province No. 2': ['Janakpur', 'Birgunj', 'Bharatpur'],
    'Bagmati Province': ['Kathmandu', 'Lalitpur', 'Bhaktapur'],
    'Gandaki Province': ['Pokhara', 'Baglung', 'Lamjung'],
    'Lumbini Province': ['Butwal', 'Bhairahawa', 'Nepalgunj'],
    'Karnali Province': ['Jumla', 'Dolpa', 'Humla'],
    'Sudurpashchim Province': ['Dhangadhi', 'Mahendranagar', 'Dipayal'],
  };

  List<String> _getStatesForCountry(String country) {
    return _statesByCountry[country] ?? [];
  }

  List<String> _getCitiesForState(String state) {
    return _citiesByState[state] ?? [];
  }

  bool isExis = false;
  // Country? _country;

  @override
  void initState() {
    if (widget.id != null) {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref(Constants.dUser)
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(Constants.dAddress)
          .child(widget.id.toString());
      databaseReference.once().then((value) {
        if (!mounted) return;
        setState(() {
          fnameController.text =
              value.snapshot.child(Constants.dfname).value.toString();
          streetAddressController.text =
              value.snapshot.child(Constants.dSAddress).value.toString();
          _selectedCity =
              value.snapshot.child(Constants.dCity).value.toString();
          _selectedState =
              value.snapshot.child(Constants.dState).value.toString();
          codeController.text =
              value.snapshot.child(Constants.dZcode).value.toString();
          _selectedCountry =
              value.snapshot.child(Constants.dCountry).value.toString();
        });
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Textformfield_style.textField(fnameController,
                          Constants.full_name, TextInputType.name,
                          isName: true),
                      const SizedBox(
                        height: 8,
                      ),
                      Textformfield_style.textField(streetAddressController,
                          Constants.address, TextInputType.streetAddress),
                      const SizedBox(
                        height: 8,
                      ),
                      // Textformfield_style.textField(cityController,
                      //     Constants.city, TextInputType.streetAddress),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // Textformfield_style.textField(stateController,
                      //     Constants.state, TextInputType.streetAddress),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      Textformfield_style.textField(
                          codeController, Constants.code, TextInputType.number),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              hintText: "Select Country",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          value: _selectedCountry,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCountry = newValue;
                              _selectedState = null;
                              _selectedCity = null;
                            });
                          },
                          items: _statesByCountry.keys
                              .map<DropdownMenuItem<String>>(
                                (String country) => DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              hintText: "Select State",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          value: _selectedState,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedState = newValue;
                              _selectedCity = null;
                            });
                          },
                          items: _getStatesForCountry(_selectedCountry ?? '')
                              .map<DropdownMenuItem<String>>(
                                (String state) => DropdownMenuItem<String>(
                                  value: state,
                                  child: Text(state),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              hintText: "Select City",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          value: _selectedCity,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCity = newValue;
                            });
                          },
                          items: _getCitiesForState(_selectedState ?? '')
                              .map<DropdownMenuItem<String>>(
                                (String city) => DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(),
                      //   child: Card(
                      //       color: Colors.white,
                      //       child: TextFormField(
                      //         readOnly: true,
                      //         decoration: InputDecoration(
                      //             hintText: widget.id == null
                      //                 ? "Select Country"
                      //                 : null,
                      //             border: OutlineInputBorder(
                      //                 borderSide: BorderSide.none)),
                      //         controller: countryController,
                      //         onTap: () {
                      //           FocusManager.instance.primaryFocus?.unfocus();
                      //           showCountryPicker(
                      //             context: context,
                      //             showPhoneCode: true,
                      //             showSearch: true,
                      //             countryListTheme: CountryListThemeData(
                      //                 textStyle: TextStyle(
                      //                     color: themeChange.darkTheme
                      //                         ? Colors.white
                      //                         : Colors.black)),
                      //             onSelect: (Country country) {
                      //               if (!mounted) return;
                      //               setState(() {
                      //                 _country = country;

                      //                 countryController.text = _country!.name;
                      //               });
                      //             },
                      //           );
                      //         },
                      //       )),
                      // ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            final form = _formKey.currentState;
                            if (form?.validate() == null) return;
                            if (!mounted) return;
                            setState(() {
                              loading = true;
                            });
                            if (fnameController.text.isEmpty ||
                                streetAddressController.text.isEmpty ||
                                codeController.text.isEmpty ||
                                _selectedCity == null ||
                                _selectedCountry == null ||
                                _selectedState == null) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(const SnackBar(
                                    content:
                                        Text("Please fill all the field")));
                            } else {
                              if (!fnameController.text.isAlphabetOnly) {
                                Scaffold_msg.toastMessage(context,
                                    "User name must contain only letters");
                              } else {
                                if (streetAddressController
                                    .text.isNumericOnly) {
                                  Scaffold_msg.toastMessage(
                                      context, "Street address does not valid");
                                } else {
                                  if (codeController.text.length != 6) {
                                    Scaffold_msg.toastMessage(context,
                                        "pin code length must be 6 digit");
                                  } else {
                                    if (!codeController.text.isNumericOnly) {
                                      Scaffold_msg.toastMessage(
                                          context, "pin code must be digit");
                                    } else {
                                      DatabaseReference databaseReference =
                                          widget.id != null
                                              ? FirebaseDatabase.instance
                                                  .ref(Constants.dUser)
                                                  .child(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .child(Constants.dAddress)
                                                  .child(widget.id.toString())
                                              : FirebaseDatabase.instance
                                                  .ref(Constants.dUser)
                                                  .child(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .child(Constants.dAddress)
                                                  .push();
                                      databaseReference.update({
                                        Constants.daddressId:
                                            databaseReference.key,
                                        Constants.dfname:
                                            fnameController.text.trim(),
                                        Constants.dSAddress:
                                            streetAddressController.text.trim(),
                                        Constants.dCity: _selectedCity,
                                        Constants.dState: _selectedState,
                                        Constants.dZcode:
                                            codeController.text.trim(),
                                        Constants.dCountry: _selectedCountry
                                      }).then((value) {
                                        if (!mounted) return;
                                        setState(() {
                                          loading = false;
                                          isExis = true;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyShippingAddress(),
                                            ));
                                      }).catchError((onError) {
                                        if (!mounted) return;
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    }
                                  }
                                }
                              }
                            }
                            if (!mounted) return;
                            setState(() {
                              loading = false;
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
              ),
            )));
  }
}
