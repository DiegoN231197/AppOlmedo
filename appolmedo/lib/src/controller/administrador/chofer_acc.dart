import 'package:firebase_database/firebase_database.dart';

class ChoferAcc {
  final DatabaseReference _choferesRef =
      FirebaseDatabase.instance.reference().child('usuarios/choferes');

  Query getChoferes() => _choferesRef;
}
