import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListadoRutas extends StatefulWidget {
  final List guias;
  ListadoRutas(this.guias, {Key? key}) : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState();
}

class _ListadoRutasState extends State<ListadoRutas> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    print(widget.guias.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Listado de Guías generadas"),
      ),
      body: ListView.builder(
        itemCount: widget.guias.length,
        itemBuilder: (context, i) {
          Map<String, dynamic> guiass =
              new Map<String, dynamic>.from(widget.guias[i]);
          if (i == 0) {
            return guia(guiass['id'], guiass['estado'], guiass['contacto'],
                guiass['nombre'], guiass['direccion']);
          } else {
            return guia(guiass['id'], guiass['estado'], guiass['contacto'],
                guiass['nombre'], guiass['direccion']);
          }
        },
      ),
    );
  }

  ///Widget para mostrar datos de una guía
  ///@param [id] parámetro correspondiente al id de la guía
  ///@param [estadoguia] parámetro correspondiente al estado de una guía
  ///@param [estadotelefono] parámetro correspondiente es teléfono de contacto del cliente
  ///@param [estadonombre] parámetro correspondiente al nombre del cliente
  ///@param [estadodireccion] parámetro correspondiente a la dirección del cliente
  ///@return [Widget] widget generado
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
