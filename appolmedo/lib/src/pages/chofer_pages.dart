import 'package:appolmedo/src/pages/cerrarsesion.dart';
import 'package:appolmedo/src/pages/selectCamion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/confirmacion_entregas.dart';
import 'package:appolmedo/src/pages/listado_rutas.dart';
import 'widgets/logo_horizontal_azul.dart';

///Clase que se encarga de la vista o página del chofer, en donde tendrá su menu y funciones
// ignore: must_be_immutable
class Choferes extends StatefulWidget {
  String fecha;
  String rutChofer;
  Choferes(this.fecha, this.rutChofer, {Key? key}) : super(key: key);

  @override
  _ChoferesState createState() => _ChoferesState();
}

class _ChoferesState extends State<Choferes> {
  var patentes = ["Lista de camiones"];
  List guiasList = [];

  //Función para obtener Guías ingresadas en la base de datos
  void getGuias() async {
    CollectionReference guiasCollection =
        FirebaseFirestore.instance.collection("guias");

    QuerySnapshot guias = await guiasCollection.get();

    if (guias.docs.length != 0) {
      for (var guia in guias.docs) {
        guiasList.add(guia.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    guiasList.clear();
    getGuias();
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orange[600],
          leading: const Icon(Icons.person_pin),
          title: Text('Choferes Trans. P. Olmedo'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (contex) => Cerrarsesion());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 10),
              new Text(
                "Seleccione la opción que desea realizar",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange[600],
                    fontFamily: 'Sansation',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              new MaterialButton(
                height: 50.0,
                minWidth: 300,
                child: Text(
                  "Listado Guías",
                  style: TextStyle(fontSize: 25),
                ),
                textColor: Colors.white,
                color: Colors.orange[600],
                onPressed: () {
                  Route route = MaterialPageRoute(
                    builder: (contex) => ListadoRutas(guiasList),
                  );
                  Navigator.push(context, route);
                },
                splashColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),
              new MaterialButton(
                height: 50.0,
                minWidth: 300,
                child: Text(
                  "Generar Ruta",
                  style: TextStyle(fontSize: 25),
                ),
                textColor: Colors.white,
                color: Colors.orange[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (contex) => SelectCamion(widget.rutChofer));
                  Navigator.push(context, route);
                },
                splashColor: Colors.blue,
              ),
              const SizedBox(height: 30),
              new MaterialButton(
                height: 50.0,
                minWidth: 300,
                child: Text(
                  "Confirmar Entrega",
                  style: TextStyle(fontSize: 25),
                ),
                textColor: Colors.white,
                color: Colors.orange[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => ConfirmacionEntregas("", ""),
                    ),
                  ),
                },
                splashColor: Colors.blue,
              ),
              const SizedBox(height: 50),
              LogoAzulWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
