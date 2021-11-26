import 'package:flutter/material.dart';

class ListadoRutas extends StatefulWidget {
  final String nguia;
  final String rut;
  final String nombre;
  final String numero;
  final String fecha;
  final String direccion;
  final String comuna;
  final String region;
  final String patente;
  ListadoRutas(this.nguia, this.rut, this.nombre, this.numero, this.fecha,
      this.direccion, this.comuna, this.region, this.patente,
      {Key? key})
      : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState();
}

class _ListadoRutasState extends State<ListadoRutas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Listado de rutas generadas"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Rutas del día",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange[600],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              casillasRuta()
            ],
          ),
        ),
      ),
    );
  }

  Widget casillasRuta() {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.orange[600],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 250,
            height: 300,
            color: Colors.white,
            child: Text(widget.nguia),

            //codigo para ingresar los datos almacenados en la ruta generada.
          ),
        ),
      ),
    );
  }
}
