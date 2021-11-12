import 'package:firebase_database/firebase_database.dart';

class AdminstradorAcc {
  final DatabaseReference _administradorRef =
      FirebaseDatabase.instance.reference().child('usuarios/adminstrador');

  Query getAdmninistrador() => _administradorRef;
}
