import 'package:cloud_firestore/cloud_firestore.dart';

import 'guia.dart';

class GuiaAcc {
  FirebaseFirestore guiasRef = FirebaseFirestore.instance;

  void guardarGuias(Guia guia) {
    guiasRef.collection('guias').doc(guia.numguia).set({
      "id": guia.numguia,
      "rut": guia.rut,
      'nombre': guia.nombrecliente,
      'contacto': guia.numcontacto,
      'fecha': guia.fecha,
      'direccion': guia.direccion,
      'comuna': guia.comuna,
      'region': guia.region,
      'estado': "false",
      'camion': guia.patente,
      'chofer': guia.chofer
    });
  }
}
