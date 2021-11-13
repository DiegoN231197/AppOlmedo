import 'dart:convert';

class Camiondb {
  final String marca;
  final String patente;

  Camiondb(this.marca, this.patente);

  Camiondb.fromJson(Map<dynamic, dynamic> json)
      : marca = json['marca'] as String,
        patente = json['patente'] as String;
}
