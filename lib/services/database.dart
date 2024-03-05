import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future deleteProduct(String id) async {
    return FirebaseFirestore.instance.collection("products").doc(id).delete();
  }
}
