import 'dart:core';
import 'package:appolmedo/src/pages/datosruta.dart';
import 'package:appolmedo/src/pages/widgets/logo_horizontal_azul.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCamion extends StatefulWidget {
  final String rutChofer;

  SelectCamion(this.rutChofer, {Key? key}) : super(key: key);

  @override
  _SelectCamionState createState() => _SelectCamionState();
}

class _SelectCamionState extends State<SelectCamion> {
  TextEditingController _controllerpatente = TextEditingController();
  TextEditingController _controllerodo = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List camionesList = [];
  bool _camion = false;

  ///Función para obtener los camiones ingresadas en la base de datos
  void getCamion() async {
    CollectionReference camionesCollection =
        FirebaseFirestore.instance.collection("camiones");

    QuerySnapshot camiones = await camionesCollection.get();

    if (camiones.docs.length != 0) {
      for (var camion in camiones.docs) {
        camionesList.add(camion.data());
      }
    }
    print(camionesList);
  }

  ///Función para comparar si se encuentra la patente en la lista
  ///@param [idRef] argumento para comparar patente en camionesList
  ///@return [esIgual] booleano, si encuentra la patente true, sino false
  bool getData(String idRef) {
    String id = idRef;
    bool esIgual = false;

    for (int i = 0; i < camionesList.length; i++) {
      if ((camionesList[i]['patente'] == id)) {
        print("validate");
        esIgual = true;
        i = camionesList.length;
      }
    }
    return esIgual;
  }

  @override
  Widget build(BuildContext context) {
    camionesList.clear();
    getCamion();

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Generar Ruta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Form(
            key: formKey,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*Requerido';
                        } else {
                          return null;
                        }
                      },
                      controller: _controllerpatente,
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 6,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*Requerido';
                    } else {
                      return null;
                    }
                  },
                  controller: _controllerodo,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(
                      Icons.local_shipping,
                      color: Colors.black,
                    ),
                    labelText: "Odometro inicial del camión",
                    prefixText: "KM: ",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                new MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _camion = getData(_controllerpatente.text);
                      if (_camion == true) {
                        iniciarRuta(
                            _controllerodo.text, _controllerpatente.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Datosruta(
                                _controllerpatente.text,
                                fechaActual(),
                                widget.rutChofer),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blueGrey.shade600,
                            content: Text(
                              "Patente de camión no encontrada",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blueGrey.shade600,
                          content: Text(
                            "Ingrese los datos requeridos",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
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
                const SizedBox(height: 35),
                LogoAzulWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Función para guardar datos ingresados al iniciar una ruta
  ///@param [odometro] parámetro correspondiente al odometro inicial del camión
  ///@param [patente] parámetro correspondiente a la patente de un camión
  void iniciarRuta(String odometro, String patente) {
    String odometroInicial = odometro;
    String patenteCamion = patente;
    String fecha = fechaActual();
    FirebaseFirestore ref = FirebaseFirestore.instance;
    ref
        .collection('camiones')
        .doc(patenteCamion)
        .collection('historial')
        .doc(fecha + patenteCamion)
        .set({
      'patente': patenteCamion,
      'odometro inicial': odometroInicial,
      'fecha inicial': fechaActual()
    });
  }
}
