//import 'dart:html';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmacionEntregas extends StatefulWidget {
  ConfirmacionEntregas({Key? key}) : super(key: key);

  @override
  _ConfirmacionEntregasState createState() => _ConfirmacionEntregasState();
}

class _ConfirmacionEntregasState extends State<ConfirmacionEntregas> {
  File? _imageFile;
  final _picker = ImagePicker();

  //Opciones lista ESTADO ENTREGA
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
        hintText: "Ingrese detalle del motivo del estado de entrega",
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
                initialValue: fechaActual(),
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
                initialValue: horaActual(),
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
                    valoritem.valorestado =
                        lista; //se guarda en valoritem.valorestado el estado seleccionado para trabajar con él
                  })
                },
                hint: Text(lista),
              ),
              if (valoritem.valorestado == "Parcialmente Entregado" ||
                  valoritem.valorestado == "No entregado")
                mensajeEntrega(),

              Center(
                child: IconButton(
                    iconSize: 32.0,
                    icon: const Icon(Icons.attach_file),
                    tooltip: 'Adjuntar imágen',
                    onPressed: _opcionesadjuntar),
              ),
              Text("Adjuntar imágen"),
              const SizedBox(height: 20),

              //condicion para que aparezca la imagen cuando se selecciona una debajo del boton de adjuntar
              if (this._imageFile == null)
                Center()
              else
                Image.file(this._imageFile!),

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

  //Función que arroja opciones al apretar el botón de adjuntar imagen

  Future<void> _opcionesadjuntar() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Tomar foto"),
                    onTap: _imagencamara,
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                      child: Text("Seleccionar desde la galería"),
                      onTap: _imagengaleria),
                ],
              ),
            ),
          );
        });
  }

  //Funciones para escoger imágen o utilizar la cámara

  Future<void> _imagengaleria() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    if (pickedfile != null) {
      setState(() => this._imageFile = File(pickedfile.path));
    }
  }

  Future<void> _imagencamara() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedfile != null) {
      setState(() => this._imageFile = File(pickedfile.path));
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

  String horaActual() {
    var now = new DateTime.now();
    var hora = (now.hour.toString() + ":" + now.minute.toString());
    return hora;
  }
}

//clase para obtener el valor seleccionado en el dropdownbutton de estado de entrega
// ignore: camel_case_types
class valoritem {
  static String valorestado = "";
}
