//import 'package:appolmedo/src/controller/guia/guia_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ListadoRutas extends StatefulWidget {
  ListadoRutas({Key? key}) : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState();
}

class _ListadoRutasState extends State<ListadoRutas> {
  List guiasList = [];

  void getGuias() async {
    CollectionReference guiasCollection =
        FirebaseFirestore.instance.collection("guias");

    QuerySnapshot guias = await guiasCollection.get();

    if (guias.docs.length != 0) {
      for (var guia in guias.docs) {
        guiasList.add(guia.data());
      }
    }
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    //guiasList.clear();

    print(guiasList.length);
    getGuias();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Listado de Guías generadas"),
      ),
      body: ListView.builder(
        itemCount: guiasList.length,
        itemBuilder: (BuildContext context, int i) {
          if (guiasList.length == 0) {
            return MaterialButton(
              color: Colors.amber,
              height: 50,
              child: Text("VER LISTA"),
              onPressed: () => {setState(() {})},
            );
          } else {
            return guia(
                guiasList[i]['id'],
                guiasList[i]['estado'],
                guiasList[i]['contacto'],
                guiasList[i]['nombre'],
                guiasList[i]['direccion']);
          }
        },
      ),
    );
  }

  Widget guia(String id, String estadoguia, String estadotelefono,
      String estadonombre, String estadodireccion) {
    String numguia = id;
    String estado = estadoguia;
    String telefono = estadotelefono;
    String nombre = estadonombre;
    String direccion = estadodireccion;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350]!,
            blurRadius: 2.0,
            offset: Offset(0, 1.0),
          ),
        ],
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(50),
        color: Colors.orange[200],
      ),
      child: MaterialButton(
        onPressed: () => {},
        padding: const EdgeInsets.only(left: 15),
        child: Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Guía: " + numguia.toString()),
                      Text("N contacto: " + telefono),
                      Text("Cliente: " + nombre),
                      Text("Dirección: " + direccion),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Estado de entrega"),
                      Text(estado),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
