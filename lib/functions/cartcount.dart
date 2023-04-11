import 'package:ecommerce/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

int bagTotal = 0;
int getTotalCart() {
  DatabaseReference databaseReference = FirebaseDatabase.instance
      .ref(Constants.dUser)
      .child(FirebaseAuth.instance.currentUser!.uid);
  databaseReference.once().then((value) {
    if (value.snapshot.child(Constants.dAddToCart).children.isNotEmpty) {
      // if (!mounted) return;
      // setState(() {
      bagTotal = value.snapshot.child(Constants.dAddToCart).children.length;
      // });
    } else {
      // if (mounted) return;
      // setState(() {
      bagTotal = 0;
      // });
    }
  });
  return bagTotal;
}
