import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';

class Cerrarsesion extends StatefulWidget {
  Cerrarsesion({Key? key}) : super(key: key);

  @override
  _CerrarsesionState createState() => _CerrarsesionState();
}

final _controllerPatFinal = TextEditingController();
final _controllerOdoFinal = TextEditingController();

class _CerrarsesionState extends State<Cerrarsesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Cerrar sesión'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 10),
              new Text(
                "Para cerrar sesión ingrese los siguientes datos",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange[600],
                    fontFamily: 'Sansation',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 20),
              //casilla patente
              TextFormField(
                controller: _controllerPatFinal,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.car_repair_rounded,
                    color: Colors.black,
                  ),
                  labelText: "Camión utilizado",
                ),
              ),
              const SizedBox(height: 20),
              //casilla fecha de entrega
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  labelText: "Fecha de entrega",
                ),
                initialValue: fechaActual(),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 20),
              //casilla hora de entrega
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.timer,
                    color: Colors.black,
                  ),
                  labelText: "Hora de entrega",
                ),
                initialValue: horaActual(),
                keyboardType: TextInputType.datetime,
              ),

              //casilla odometro
              const SizedBox(height: 20),
              TextFormField(
                controller: _controllerOdoFinal,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.local_shipping,
                    color: Colors.black,
                  ),
                  labelText: "Odometro final del camión",
                  prefixText: "KM: ",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              mensajeDetalle(),
              const SizedBox(height: 20),
              new MaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                height: 40,
                minWidth: 60,
                child: Text("Enviar y cerrar sesión",
                    style: TextStyle(fontSize: 20)),
                color: Colors.orange[600],
                splashColor: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final detallecontroller = TextEditingController();
  Widget mensajeDetalle() {
    return TextField(
      controller: this.detallecontroller,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '${this.detallecontroller.text.split('').length} words',
        border: const OutlineInputBorder(),
        hintText: "Detalles de ruta",
      ),
      onChanged: (text) => setState(() {}),
    );
  }

  String fechaActual() {
    var now = new DateTime.now();
    var dato = (now.day.toString() +
        "/" +
        now.month.toString() +
        "/" +
        now.year.toString());
    return dato;
  }

  String horaActual() {
    var now = new DateTime.now();
    var hora = (now.hour.toString() + ":" + now.minute.toString());
    return hora;
  }
}
