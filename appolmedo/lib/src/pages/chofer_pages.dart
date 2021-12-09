import 'package:appolmedo/src/controller/camion/camion_acc.dart';
import 'package:appolmedo/src/pages/cerrarsesion.dart';
import 'package:appolmedo/src/pages/selectCamion.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/confirmacion_entregas.dart';
import 'package:appolmedo/src/pages/listado_rutas.dart';

import 'widgets/logo_horizontal_azul.dart';

//Clase que se encarga de la vista o página del chofer, en donde tendrá su menu y funciones

// ignore: must_be_immutable
class Choferes extends StatefulWidget {
  Choferes({Key? key}) : super(key: key);

  final camionAcc = CamionAcc();

  @override
  _ChoferesState createState() => _ChoferesState();
}

class _ChoferesState extends State<Choferes> {
  //Future TextEditingController _lista = TextEditingController();

  var patentes = ["Lista de camiones"];

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cerrarsesion(),
                  ),
                );
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),

        //body botones opciones chofer

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
                  "Listado Rutas",
                  style: TextStyle(fontSize: 25),
                ),
                textColor: Colors.white,
                color: Colors.orange[600],
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (contex) => ListadoRutas()),
                  ),
                },
                splashColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),
              //_getListaCamiones(),
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
                  //verpatentes();
                  Route route =
                      MaterialPageRoute(builder: (contex) => SelectCamion());
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
                      builder: (contex) => ConfirmacionEntregas(),
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
