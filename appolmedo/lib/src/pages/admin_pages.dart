import 'package:flutter/material.dart';

//Clase que se encarga de la vista o página del administrador, en donde tendrá su menu y funciones
class Administrador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Menu Administrador Transportes Olmedo'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Bienvenido al menu de Administrador!'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/LoginPage');
              },
              child: Text("Cerrar sesión"))
        ],
      ),
    );
  }
}
