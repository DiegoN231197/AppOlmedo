import 'package:appolmedo/src/controller/administrador/chofer.dart';
import 'package:firebase_database/firebase_database.dart';

class ChoferAcc {
  final DatabaseReference _choferesRef =
      FirebaseDatabase.instance.reference().child('usuarios/choferes');

  Query getChoferes() => _choferesRef;

  void guardarChofer(Choferdb chofer) {
    _choferesRef.child(chofer.id.toString()).set(chofer.toJson());
  }
}
