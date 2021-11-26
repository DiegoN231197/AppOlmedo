import 'package:cloud_firestore/cloud_firestore.dart';

class ChoferAcc {
  CollectionReference<Map<String, dynamic>> choferesRef =
      FirebaseFirestore.instance.collection("choferes");
}
