//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:appolmedo/pages/chofer_pages.dart';

class ConfirmacionEntregas extends StatefulWidget {
  ConfirmacionEntregas({Key? key}) : super(key: key);

  @override
  _ConfirmacionEntregasState createState() => _ConfirmacionEntregasState();
}

class _ConfirmacionEntregasState extends State<ConfirmacionEntregas> {
  double opacidad = 1.0, opacidad2 = 1.0, opacidad3 = 1.0;

  var estado = ["Entregado", "Parcialmente Entregado", "No entregado"];
  String lista = "Estado de entrega";

  Widget estados(Color color) {
    return Container(
      height: 10,
      width: 10,
      color: color,
    );
  }

  //casilla de texto grande para poner datos sobre la entrega
  final controller = TextEditingController();
  Widget mensajeEntrega() {
    return TextField(
      controller: this.controller,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '${this.controller.text.split('').length} words',
        border: const OutlineInputBorder(),
      ),
      onChanged: (text) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Confirmación Entrega'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 20),
              //casilla n° guia
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.content_paste,
                    color: Colors.black,
                  ),
                  labelText: "Número de guía",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              //casilla fecha de entrega
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  labelText: "Fecha de entrega",
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 20),
              //casilla hora de entrega
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
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 20),
              Text(
                "Estado de la entrega",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange[600],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              /* Container(
                child: Row(
                  children: [
                    const SizedBox(height: 30),
                    const SizedBox(width: 55),
                    GestureDetector(
                      onTap: () {
                        setState(() => this.opacidad = 1.0 - this.opacidad);
                      },
                      child: Opacity(
                        opacity: opacidad,
                        child: estados(Colors.green),
                      ),
                    ),
                    const SizedBox(width: 130),
                    GestureDetector(
                      onTap: () {
                        setState(() => this.opacidad2 = 1.0 - this.opacidad2);
                      },
                      child: Opacity(
                        opacity: opacidad2,
                        child: estados(Colors.yellow),
                      ),
                    ),
                    const SizedBox(width: 130),
                    GestureDetector(
                      onTap: () {
                        setState(() => this.opacidad3 = 1.0 - this.opacidad3);
                      },
                      child: Opacity(
                        opacity: opacidad3,
                        child: estados(Colors.red),
                      ),
                    ),
                  ],
                ),
              ), */
              /*Container(
                child: Row(
                  children: [
                    const SizedBox(width: 25),
                    Text("Entregado"),
                    const SizedBox(width: 30),
                    Text("Parcialmente entregado"),
                    const SizedBox(width: 30),
                    Text("No entregado"),
                  ],
                ),
              ),*/
              const SizedBox(height: 20),
              DropdownButton(
                elevation: 30,
                iconSize: 30,
                items: estado.map((String b) {
                  return DropdownMenuItem(value: b, child: Text(b));
                }).toList(),
                onChanged: (datonuevo) => {
                  setState(() {
                    lista = datonuevo.toString();
                  })
                },
                hint: Text(lista),
              ),
              const ListTile(title: Text('Ingrese detalles sobre la entrega')),
              mensajeEntrega(),
              Center(
                child: IconButton(
                  iconSize: 32.0,
                  icon: const Icon(Icons.attach_file),
                  tooltip: 'Adjuntar imágen',
                  onPressed: () {},
                ),
              ),
              Text("Adjuntar imágen"),
              const SizedBox(height: 20),

              //boton enviar info
              new MaterialButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (contex) => Choferes());
                  Navigator.push(context, route);
                },
                height: 40,
                minWidth: 60,
                child:
                    Text("Enviar información", style: TextStyle(fontSize: 20)),
                color: Colors.orange[600],
                splashColor: Colors.blue,
                textColor: Colors.white,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagenGuia extends StatefulWidget {
  ImagenGuia({Key? key}) : super(key: key);

  @override
  _ImagenGuiaState createState() => _ImagenGuiaState();
}

class _ImagenGuiaState extends State<ImagenGuia> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
