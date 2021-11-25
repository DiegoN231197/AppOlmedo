import 'dart:core';
import 'package:appolmedo/src/pages/widgets/logo_horizontal_azul.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';
import 'package:appolmedo/src/controller/camion/camion_acc.dart';
import 'package:appolmedo/src/pages/selectCamion.dart';

class Datosruta extends StatefulWidget {
  final String patent;
  Datosruta(this.patent, {Key? key}) : super(key: key);

  @override
  _DatosrutaState createState() => _DatosrutaState();
}

class _DatosrutaState extends State<Datosruta> {
  TextEditingController _controllernumguia = TextEditingController();
  TextEditingController _controllerrutcliente = TextEditingController();
  TextEditingController _controllernombre = TextEditingController();
  TextEditingController _controllernumero = TextEditingController();
  TextEditingController _controllerfecha = TextEditingController();
  TextEditingController _controllerdireccion = TextEditingController();
  TextEditingController _controllerncomuna = TextEditingController();
  TextEditingController _controllerregion = TextEditingController();
  //TextEditingController _controllerpatente = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Datos de Ruta"),
        leading: const Icon(Icons.content_paste),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
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
              /* TextFormField(
                        controller: _controllerregion,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          icon: Icon(
                            Icons.pin_drop,
                            color: Colors.black,
                          ),
                          labelText: "Región",
                        ),
                      ), */
              Row(
                children: [
                  Icon(
                    Icons.map_outlined,
                  ),
                  const SizedBox(width: 40),
                  DropdownButton(
                    elevation: 30,
                    iconSize: 30,
                    items: region.map((String c) {
                      return DropdownMenuItem(value: c, child: Text(c));
                    }).toList(),
                    onChanged: (region) => {
                      setState(() {
                        seleccion = region.toString();
                        valoritem.valorregion =
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
                        /*  Route route = MaterialPageRoute(
                                    builder: (contex) => DatosRuta()); */
                        Navigator.pushReplacementNamed(context, '/datosruta');
                      },
                      height: 40,
                      minWidth: 60,
                      child:
                          Text("Generar Ruta", style: TextStyle(fontSize: 20)),
                      color: Colors.orange[600],
                      splashColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 30),
                    new MaterialButton(
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (contex) => Choferes());
                        Navigator.push(context, route);
                      },
                      height: 40,
                      minWidth: 60,
                      child: Text("Finalizar", style: TextStyle(fontSize: 20)),
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
    );
  }
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

class valoritem {
  static String valorregion = "";
}