import 'package:firebase_database/firebase_database.dart';
import 'camion.dart';

class CamionAcc {
  final DatabaseReference _camionRef =
      FirebaseDatabase.instance.reference().child('camiones');

  Query getCamiones() => _camionRef;

  void guardarCamion(Camiondb camion) {
    _camionRef.child(camion.patente).set(camion.toJson());
  }
}
