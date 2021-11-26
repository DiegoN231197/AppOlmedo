class Choferdb {
  final String nombre;
  final String rut;
  final String contrasena;
  final int id;

  Choferdb(this.nombre, this.rut, this.contrasena, this.id);

  Choferdb.fromJson(Map<dynamic, dynamic> json)
      : nombre = json['nombre'] as String,
        rut = json['rut'] as String,
        contrasena = json['contrasena'] as String,
        id = json['id'] as int;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        "nombre": nombre,
        "rut": rut,
        "contrasena": contrasena,
        "id": id
      };
}
