//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:appolmedo/pages/selectCamion.dart';
import 'package:appolmedo/pages/confirmacionEntregas.dart';

//Clase que se encarga de la vista o página del chofer, en donde tendrá su menu y funciones

class choferes extends StatelessWidget {
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
                icon: const Icon(Icons.exit_to_app)),
          ],
        ),

        //body botones opciones chofer

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 20),
              new Text(
                "Seleccione la opción que desea realizar",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange[600],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80),
              new MaterialButton(
                height: 70.0,
                minWidth: 350,
                child: Text("Listado Guias", style: TextStyle(fontSize: 30)),
                textColor: Colors.white,
                color: Colors.orange[600],
                onPressed: () => {},
                splashColor: Colors.blue,
              ),
              const SizedBox(height: 20),
              new MaterialButton(
                height: 70.0,
                minWidth: 350,
                child: Text("Generar Ruta", style: TextStyle(fontSize: 30)),
                textColor: Colors.white,
                color: Colors.orange[600],
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (contex) => selectCamion());
                  Navigator.push(context, route);
                },
                splashColor: Colors.blue,
              ),
              const SizedBox(height: 20),
              new MaterialButton(
                height: 70.0,
                minWidth: 350,
                child:
                    Text("Confirmar Entrega", style: TextStyle(fontSize: 30)),
                textColor: Colors.white,
                color: Colors.orange[600],
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => confirmacionEntregas())),
                },
                splashColor: Colors.blue,
              ),
              const SizedBox(height: 50),
              Image.asset('assets/images/logoblanco.png'),
            ],
          ),
        ));
  }
}
