//import 'dart:html';
import 'package:appolmedo/src/controller/camion/camion.dart';
import 'package:appolmedo/src/controller/camion/camion_acc.dart';
import 'package:appolmedo/src/controller/camion/lista_camiones.dart';
import 'package:appolmedo/src/controller/camion/widget_camion.dart';
import 'package:appolmedo/src/pages/selectCamion.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
//import 'package:appolmedo/src/pages/selectCamion.dart';
import 'package:appolmedo/src/pages/confirmacion_entregas.dart';
import 'package:appolmedo/src/pages/listado_rutas.dart';

import 'widgets/logo_horizontal_azul.dart';

//Clase que se encarga de la vista o página del chofer, en donde tendrá su menu y funciones

class Choferes extends StatefulWidget {
  Choferes({Key? key}) : super(key: key);
  final camionAcc = CamionAcc();

  @override
  _ChoferesState createState() => _ChoferesState();
}

class _ChoferesState extends State<Choferes> {
  final ScrollController _scrollController = ScrollController();
  //Future TextEditingController _lista = TextEditingController();

  var patentes = ["Lista de camiones"];

  Widget _getListaCamiones() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.camionAcc.getCamiones(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final camion = Camiondb.fromJson(json);
          patentes.add(camion.patente);

          return WidgetCamiones(camion.patente);
        },
      ),
    );
  }

  void verpatentes() {
    //_getListaCamiones();
    print(patentes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        leading: const Icon(Icons.person_pin),
        title: Text('Choferes Trans. P. Olmedo'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/LoginPage');
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
                    MaterialPageRoute(
                      builder: (contex) => ListadoRutas(),
                    ))
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
                fechaActual(),
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
    );
  }

  void fechaActual() {
    var now = new DateTime.now();
    print(now.day.toString() +
        "/" +
        now.month.toString() +
        "/" +
        now.year.toString());
  }
}
