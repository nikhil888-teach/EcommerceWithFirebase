import 'dart:developer';

import 'package:csc_picker/csc_picker.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                enabled: true,
                enableInteractiveSelection: true,
                keyboardType: TextInputType.name,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                    hintText: Constants.full_name,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 2,
              child: TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                enabled: true,
                enableInteractiveSelection: true,
                keyboardType: TextInputType.streetAddress,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                    hintText: Constants.address,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 2,
              child: TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                enabled: true,
                enableInteractiveSelection: true,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                    hintText: Constants.city,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 2,
              child: TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                enabled: true,
                enableInteractiveSelection: true,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                    hintText: Constants.state,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: true,
                enableSuggestions: true,
                enabled: true,
                enableInteractiveSelection: true,
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                    hintText: Constants.code,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 2,
              child: CSCPicker(
                onCountryChanged: (value) {
                  log(value);
                },
                showCities: false,
                showStates: false,
                countryDropdownLabel: Constants.country,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
