import 'package:firebase_database/firebase_database.dart';
import 'guia.dart';

class GuiaAcc {
  final DatabaseReference _guiaRef =
      FirebaseDatabase().reference().child('guias');

  Query getGuias() => _guiaRef;

  void guardarGuias(Guia guia) {
    _guiaRef.child(guia.numguia).set(guia.toJson());
  }
}
