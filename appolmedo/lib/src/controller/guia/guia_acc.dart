import 'package:cloud_firestore/cloud_firestore.dart';
import 'guia.dart';

class GuiaAcc {
  FirebaseFirestore guiasRef = FirebaseFirestore.instance;

  ///Función para ingresar una guía a la base de datos
  ///@param [guia] correspondiente a una Guía
  void guardarGuias(Guia guia) {
    guiasRef.collection('guias').doc(guia.numguia).set({
      "id": guia.numguia,
      "rut": guia.rut,
      'nombre': guia.nombrecliente,
      'contacto': "+56 " + guia.numcontacto,
      'fecha': guia.fecha,
      'direccion': guia.direccion,
      'comuna': guia.comuna,
      'region': guia.region,
      'estado': "pendiente",
      'camion': guia.patente,
      'chofer': guia.chofer
    });
  }
}
