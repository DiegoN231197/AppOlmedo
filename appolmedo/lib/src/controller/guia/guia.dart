class Guia {
  final String numguia;
  final String rut;
  final String nombrecliente;
  final String numcontacto;
  final String fecha;
  final String direccion;
  final String comuna;
  final String region;
  final String patente;
  final String chofer;

  Guia(this.numguia, this.rut, this.nombrecliente, this.numcontacto, this.fecha,
      this.direccion, this.comuna, this.region, this.patente, this.chofer);

  /* Guia.fromJson(Map<dynamic, dynamic> json)
      : numguia = json['num_guia'] as String,
        rut = json['rut'] as String,
        nombrecliente = json['nombre_contacto'] as String,
        numcontacto = json['num_contacto'] as int,
        fecha = json['fecha'] as DateTime,
        direccion = json['direccion'] as String,
        comuna = json['comuna'] as String,
        region = json['region'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'num_guia': numguia,
        'rut': rut,
        'nombre_cliente': nombrecliente,
        'num_contacto': numcontacto,
        'fecha': fecha,
        'direccion': direccion,
        'comuna': comuna,
        'region': region
  }; */

}
