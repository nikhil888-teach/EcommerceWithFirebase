import 'package:ecommerce/screen/aftercheckout/add_address_page.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyShippingAddress extends StatefulWidget {
  const MyShippingAddress({Key? key}) : super(key: key);

  @override
  State<MyShippingAddress> createState() => _MyShippingAddressState();
}

class _MyShippingAddressState extends State<MyShippingAddress> {
  bool checkaddress = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAddressPage(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              "Jane Doe",
                              style: Text_Style.text_Theme(
                                  Constants.black_text, 14, FontWeight.w600),
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
                                  Constants.red_text, 14, FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "3 Newbridge Court",
                          style: Text_Style.text_Theme(
                              Constants.black_text, 14, FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Text("Chino Hills, CA 91709, United States",
                            style: Text_Style.text_Theme(
                                Constants.black_text, 14, FontWeight.normal)),
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
    );
  }
}
