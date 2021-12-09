import 'package:appolmedo/src/controller/guia/guia_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ListadoRutas extends StatefulWidget {
  ListadoRutas({Key? key}) : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState();
}

class _ListadoRutasState extends State<ListadoRutas> {
  final List guiasList = [];

  void getGuias() async {
    CollectionReference guiasCollection =
        FirebaseFirestore.instance.collection("guias");

    QuerySnapshot guias = await guiasCollection.get();

    if (guias.docs.length != 0) {
      for (var guia in guias.docs) {
        guiasList.add(guia.data());
      }
    }
    print("------------------Lista Guias--------------------");
    print(guiasList);
  }

  /* dynamic getGuia() {
    //guiasList.clear();
    print("recorrido");
    print(guiasList);
    if (guiasList.length != 0) {
      for (int i = 0; i < guiasList.length; i++) {
        print(guiasList[i]['id']);
        return GuiaWidget(guiasList[i]['id'], guiasList[i]['estado']);
      }
      return GuiaWidget("8", "LISTO");
    } else {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Text("no se han ingresado guías"),
        ),
      );
    }
  } */

  @override
  Widget build(BuildContext context) {
    getGuias();
    /* return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Listado de rutas generadas"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Rutas del día",
            style: TextStyle(
                fontSize: 30,
                color: Colors.orange[600],
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        getGuia(),
      ]),
    ); */
    print("guias");
    print(guiasList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Listado de rutas generadas"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return const Divider();
          if (guiasList.length != 0) {
            final index = i ~/ 2 + 1;
            return GuiaWidget(
                guiasList[index]['id'].toString(), guiasList[index]['estado']);
          } else {
            return Text("error");
          }
        },
      ),
    );
  }
}
