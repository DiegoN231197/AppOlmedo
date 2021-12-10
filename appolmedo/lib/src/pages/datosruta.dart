import 'dart:core';
import 'package:appolmedo/src/controller/guia/guia.dart';
import 'package:appolmedo/src/controller/guia/guia_acc.dart';
//import 'package:appolmedo/src/pages/confirmacion_entregas.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dart_rut_validator/dart_rut_validator.dart';

class Datosruta extends StatefulWidget {
  final String patent;
  final String fecha;
  final String rutChofer;
  Datosruta(this.patent, this.fecha, this.rutChofer, {Key? key})
      : super(key: key);

  @override
  _DatosrutaState createState() => _DatosrutaState();
}

class _DatosrutaState extends State<Datosruta> {
  TextEditingController _controllernumguia = TextEditingController();
  TextEditingController _controllerrutcliente = TextEditingController();
  TextEditingController _controllernombre = TextEditingController();
  TextEditingController _controllernumero = TextEditingController();
  TextEditingController _controllerdireccion = TextEditingController();
  TextEditingController _controllerncomuna = TextEditingController();

  var region = [
    "Arica y Parinacota",
    "Tarapacá",
    "Antofagasta",
    "Atacama",
    "Coquimbo",
    "Valparaíso",
    "Metropolitana",
    "O'Higgins",
    "Maule",
    "Nuble",
    "Bío-Bío",
    "Araucanía",
    "Los Ríos",
    "Los Lagos",
    "Aysén",
    "Magallanes y Antártica Chilena"
  ];
  String seleccion = "Seleccione región";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String idRuta = widget.fecha;

    print(widget.rutChofer);
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orange[600],
          title: Text("Datos Guía"),
          leading: const Icon(Icons.content_paste),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ingrese los siguientes datos",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange[600],
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(width: 90),
                          Text(
                            "Camión: ",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.orange[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            (widget.patent),
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.orange[600],
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //casilla n° guia
                  TextFormField(
                    controller: _controllernumguia,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.content_paste,
                        color: Colors.black,
                      ),
                      labelText: "Número de guía/factura",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  //casilla rut
                  TextFormField(
                    controller: _controllerrutcliente,
                    onChanged: onChangedApplyFormat,
                    validator:
                        RUTValidator(validationErrorText: "Ingrese RUT válido")
                            .validator,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.black,
                      ),
                      labelText: "Rut cliente",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  //casilla de nombre
                  TextFormField(
                    controller: _controllernombre,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelText: "Nombre del cliente",
                    ),
                  ),
                  const SizedBox(height: 20),
                  //casilla n° de contacto
                  TextFormField(
                    controller: _controllernumero,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      labelText: "Número de contacto",
                      prefixText: '+56',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  //casilla fecha
                  TextFormField(
                    //controller: _controllerfecha,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      labelText: "Fecha",
                    ),
                    initialValue: fechaActual(),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 20),
                  //casilla de dirección
                  TextFormField(
                    controller: _controllerdireccion,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.pin_drop,
                        color: Colors.black,
                      ),
                      labelText: "Dirección",
                    ),
                  ),
                  const SizedBox(height: 20),
                  //casilla de comuna
                  TextFormField(
                    controller: _controllerncomuna,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.map,
                        color: Colors.black,
                      ),
                      labelText: "Comuna",
                    ),
                  ),
                  const SizedBox(height: 20),
                  //casilla de region
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Icon(
                        Icons.map_outlined,
                      ),
                      const SizedBox(width: 30),
                      DropdownButton(
                        elevation: 30,
                        iconSize: 30,
                        items: region.map((String c) {
                          return DropdownMenuItem(value: c, child: Text(c));
                        }).toList(),
                        onChanged: (region) => {
                          setState(() {
                            seleccion = region.toString();
                            Valoritem.valorregion =
                                seleccion; //se guarda en valoritem.valorestado el estado seleccionado para trabajar con él
                          })
                        },
                        hint: Text(seleccion),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //boton generar ruta
                  Container(
                    child: Row(
                      children: [
                        const SizedBox(width: 30),
                        new MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final guia = Guia(
                                  _controllernumguia.text,
                                  _controllerrutcliente.text,
                                  _controllernombre.text,
                                  _controllernumero.text,
                                  fechaActual(),
                                  _controllerdireccion.text,
                                  _controllerncomuna.text,
                                  Valoritem.valorregion,
                                  widget.patent,
                                  widget.rutChofer,
                                  "");
                              GuiaAcc().guardarGuias(guia);

                              _controllernumguia.clear();
                              _controllerrutcliente.clear();
                              _controllernombre.clear();
                              _controllernumero.clear();
                              _controllerdireccion.clear();
                              _controllerncomuna.clear();

                              Route route = MaterialPageRoute(
                                  builder: (contex) => Datosruta(
                                      widget.patent, idRuta, widget.rutChofer));
                              Navigator.push(context, route);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.blueGrey.shade600,
                                  content: Text(
                                    "Ingrese todos los campos",
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
                          child: Text("Ingresar Guía",
                              style: TextStyle(fontSize: 20)),
                          color: Colors.orange[600],
                          splashColor: Colors.blue,
                          textColor: Colors.white,
                        ),
                        const SizedBox(width: 30),
                        new MaterialButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (contex) => Choferes(idRuta, ""));
                            Navigator.push(context, route);
                          },
                          height: 40,
                          minWidth: 60,
                          child:
                              Text("Finalizar", style: TextStyle(fontSize: 20)),
                          color: Colors.orange[600],
                          splashColor: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//llenado de puntos automaticos del rut
  void onChangedApplyFormat(String text) {
    RUTValidator.formatFromTextController(_controllerrutcliente);
  }
}

String fechaActual() {
  var now = new DateTime.now();
  var dato = (now.day.toString() +
      "-" +
      now.month.toString() +
      "-" +
      now.year.toString());
  return dato;
}

class Valoritem {
  static String valorregion = "";
}
