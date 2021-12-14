import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:masked_text/masked_text.dart';

class Cerrarsesion extends StatefulWidget {
  Cerrarsesion({Key? key}) : super(key: key);

  @override
  _CerrarsesionState createState() => _CerrarsesionState();
}

final _controllerPatFinal = TextEditingController();
final _controllerOdoFinal = TextEditingController();
final _controllerfechainicio = TextEditingController();

List camionesList = [];
bool _camion = false;

///Función para obtener las patentes de los camiones
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

GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*Requerido';
                    } else {
                      return null;
                    }
                  },
                  controller: _controllerPatFinal,
                  textCapitalization: TextCapitalization.characters,
                  maxLength: 6,
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
                const SizedBox(height: 10),
                new MaskedTextField(
                  maskedTextFieldController: _controllerfechainicio,
                  mask: "xx-xx-xxxx",
                  maxLength: 10,
                  keyboardType: TextInputType.datetime,
                  inputDecoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(
                      Icons.date_range_outlined,
                      color: Colors.black,
                    ),
                    labelText: "Fecha toma de camión",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    labelText: "Fecha de entrega de camión",
                  ),
                  initialValue: fechaActual(),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*Requerido';
                    } else {
                      return null;
                    }
                  },
                  controller: _controllerOdoFinal,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(
                      Icons.local_shipping,
                      color: Colors.black,
                    ),
                    labelText: "Odometro final del camión",
                    hintText: "KM: ",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                mensajeDetalle(),
                const SizedBox(height: 20),
                new MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _camion = getData(_controllerPatFinal.text);
                      if (_camion == true) {
                        finalizarRuta(
                            _controllerOdoFinal.text,
                            _controllerPatFinal.text,
                            detallecontroller.text,
                            _controllerfechainicio.text);
                        Navigator.pushReplacementNamed(context, '/login');
                        _controllerOdoFinal.clear();
                        _controllerPatFinal.clear();
                        _controllerfechainicio.clear();
                        detallecontroller.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blueGrey.shade600,
                            content: Text(
                              "Patente no encontrada",
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
                            "Ingrese todos los datos",
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
      ),
    );
  }

  final detallecontroller = TextEditingController();

  ///Widget para generar casilla en donde escribe el detalle de la ruta
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

  ///Función para obtener la fecha actual
  ///@return [dato] fecha actual como String
  String fechaActual() {
    var now = new DateTime.now();
    var dato = (now.day.toString() +
        "-" +
        now.month.toString() +
        "-" +
        now.year.toString());
    return dato;
  }

  ///Función para obtener la hora actual
  ///@return [hora] hora actual como String
  String horaActual() {
    var now = new DateTime.now();
    var hora = (now.hour.toString() + ":" + now.minute.toString());
    return hora;
  }

  ///Función para finalizar una ruta, donde se actualizan los datos de la ruta de un camion
  ///@param [odometro] parametro correspondiente al odómetro final del camión
  ///@param [patente] parámetro correspondiente a la patente de un camión
  ///@param [datos] parámetro correspondiente a los datos de la ruta
  ///@param [fechainicial] parámetro correspondiente a la fecha de inicio de la ruta
  void finalizarRuta(
      String odometro, String patente, String datos, String fechainicial) {
    String odometroFinal = odometro;
    String patenteCamion = patente;
    String datosRuta = datos;
    String idRuta = fechainicial;

    FirebaseFirestore ref = FirebaseFirestore.instance;
    ref
        .collection('camiones')
        .doc(patenteCamion)
        .collection('historial')
        .doc(idRuta + patenteCamion)
        .update({
      'odometro final': odometroFinal,
      'fecha final': fechaActual(),
      'Hora de entrega': horaActual(),
      'detalles ruta': datosRuta
    });
  }
}
