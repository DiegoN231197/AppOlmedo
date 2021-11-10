//import 'dart:html';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/pages/chofer_pages.dart';
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
                    onPressed: _OpcionesAdjuntar),
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

  Future<void> _OpcionesAdjuntar() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Tomar foto"),
                    onTap: _ImagenCamara,
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                      child: Text("Seleccionar desde la galería"),
                      onTap: _ImagenGaleria),
                ],
              ),
            ),
          );
        });
  }

  //Funciones para escoger imágen o utilizar la cámara

  Future<void> _ImagenGaleria() async {
    final PickedFile = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    if (PickedFile != null) {
      setState(() => this._imageFile = File(PickedFile.path));
    }
  }

  Future<void> _ImagenCamara() async {
    final PickedFile = await _picker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (PickedFile != null) {
      setState(() => this._imageFile = File(PickedFile.path));
    }
  }
}
