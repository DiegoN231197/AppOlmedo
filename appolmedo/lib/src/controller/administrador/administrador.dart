class Administradordb {
  final String nombre;
  final String rut;

  Administradordb(this.nombre, this.rut);

  Administradordb.fromJson(Map<dynamic, dynamic> json)
      : nombre = json['nombre'] as String,
        rut = json['rut'] as String;
}
