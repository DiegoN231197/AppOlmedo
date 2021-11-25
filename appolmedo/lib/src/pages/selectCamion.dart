import 'dart:core';

import 'package:appolmedo/src/pages/datosruta.dart';
import 'package:appolmedo/src/pages/widgets/logo_horizontal_azul.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';

import 'package:appolmedo/src/controller/camion/camion_acc.dart';

class SelectCamion extends StatefulWidget {
  final camionAcc = CamionAcc();

  @override
  _SelectCamionState createState() => _SelectCamionState();
}

class _SelectCamionState extends State<SelectCamion> {
  //datos para usar en la lista desplegable de patente de camiones

  String datolista = 'Patente camión';

  late Future<DropdownMenuItem<List<dynamic>>> camiones = _getPatente();

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
                  child: Container(
                padding: EdgeInsets.all(50),
                width: 350,
                color: Colors.blue[700],
                /* elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ), */
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
                /* child: SizedBox(
                height: 150,
                width: 250,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      alignment: Alignment.center,
                      child: FutureBuilder<List>(
                        future: _getPatente() as Future<List>,
                        builder: (BuildContext context,
                            AsyncSnapshot<List> snapshot) {
                          if (!snapshot.hasData)
                            return CircularProgressIndicator();
                          return DropdownButtonFormField<List>(
                            items: [],
                            /* ((e) => Future<DropdownMenuItem>(
                                  child: Text(e.toString()),
                                )), */
                            hint: Text(
                              datolista,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ), */
              )),

              const SizedBox(height: 50),

              //boton continuar
              new MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Datosruta(_controllerpatente.text)));
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
              const SizedBox(height: 50),
              LogoAzulWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Future<DropdownMenuItem<List>> _getPatente() async {
    var patentes = widget.camionAcc.getCamiones() as DropdownMenuItem<List>;
    return patentes;
  }
}

TextEditingController _controllerpatente = TextEditingController();
/* TextEditingController _controllernumguia = TextEditingController();
TextEditingController _controllerrutcliente = TextEditingController();
TextEditingController _controllernombre = TextEditingController();
TextEditingController _controllernumero = TextEditingController();
TextEditingController _controllerfecha = TextEditingController();
TextEditingController _controllerdireccion = TextEditingController();
TextEditingController _controllerncomuna = TextEditingController();
TextEditingController _controllerregion = TextEditingController();


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
String seleccion = "Seleccione la región de despacho";

//Pantalla para llenar datos sobre la ruta y guia que se va a entregar
class DatosRuta extends MaterialPageRoute<String> {  
  DatosRuta()
      : super(
          builder: (BuildContext context) {
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
                                _controllerpatente.text,
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
                            Icons.pin_drop,
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
                                Navigator.push(context, DatosRuta());
                              },
                              height: 40,
                              minWidth: 60,
                              child: Text("Generar Ruta",
                                  style: TextStyle(fontSize: 20)),
                              color: Colors.orange[600],
                              splashColor: Colors.blue,
                              textColor: Colors.white,
                            ),
                            const SizedBox(width: 30),
                            new MaterialButton(
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (contex) => Choferes());
                                Navigator.push(context, route);
                              },
                              height: 40,
                              minWidth: 60,
                              child: Text("Finalizar",
                                  style: TextStyle(fontSize: 20)),
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
          },
        );
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
 */