import 'dart:core';

import 'package:appolmedo/src/pages/datosruta.dart';
import 'package:appolmedo/src/pages/widgets/logo_horizontal_azul.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:appolmedo/src/controller/camion/camion_acc.dart';

class SelectCamion extends StatefulWidget {
  final camionAcc = CamionAcc();

  @override
  _SelectCamionState createState() => _SelectCamionState();
}

class _SelectCamionState extends State<SelectCamion> {
  //datos para usar en la lista desplegable de patente de camiones

/*   void initState() {
    super.initState();
  }

  void getChofer() async {
    CollectionReference choferesCollection =
        FirebaseFirestore.instance.collection("choferes");

    QuerySnapshot choferes = await choferesCollection.get();

    if (choferes.docs.length != 0) {
      for (var chofer in choferes.docs) {
        print(chofer.data());
      }
    }
  } */

  String datolista = 'Patente camión';

  //late Future<DropdownMenuItem<List<dynamic>>> camiones = _getPatente();

  TextEditingController _controllerpatente = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Generar Ruta'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 20),
              new Text(
                "Ingrese la patente del camión a utilizar",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange[600],
                    fontFamily: 'Sansation',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),

              //lista de patentes
              const SizedBox(height: 30),
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.all(50),
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: _controllerpatente,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.car_rental,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: "Patente del vehículo",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.local_shipping,
                    color: Colors.black,
                  ),
                  labelText: "Odometro inicial del camión",
                ),
              ),
              const SizedBox(height: 50),

              //boton continuar
              new MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Datosruta(_controllerpatente.text),
                    ),
                  );
                },
                height: 50,
                minWidth: 300,
                child: Text("Continuar", style: TextStyle(fontSize: 30)),
                textColor: Colors.white,
                color: Colors.orange[600],
                splashColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 120),
              LogoAzulWidget(),
            ],
          ),
        ),
      ),
    );
  }

  /* Future<DropdownMenuItem<List>> _getPatente() async {
    var patentes = widget.camionAcc.getCamiones() as DropdownMenuItem<List>;
    return patentes;
  } */
}
