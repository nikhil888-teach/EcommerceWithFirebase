import 'package:ecommerce/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

int? total;
int getTotalCart() {
  DatabaseReference databaseReference = FirebaseDatabase.instance
      .ref(Constants.dUser)
      .child(FirebaseAuth.instance.currentUser!.uid);
  databaseReference.once().then((value) {
    if (value.snapshot.child(Constants.dAddToCart).children.isNotEmpty) {
      // if (!mounted) return;
      // setState(() {
      total = value.snapshot.child(Constants.dAddToCart).children.length;
      // });
    } else {
      // if (mounted) return;
      // setState(() {
      total = 0;
      // });
    }
  });
  return total ??= 0;
}
