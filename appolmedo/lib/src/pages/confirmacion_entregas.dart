import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

///Clase correspondiente a la confirmación de las entregas
class ConfirmacionEntregas extends StatefulWidget {
  final String patente;
  final String fecha;
  ConfirmacionEntregas(this.patente, this.fecha, {Key? key}) : super(key: key);

  @override
  _ConfirmacionEntregasState createState() => _ConfirmacionEntregasState();
}

class _ConfirmacionEntregasState extends State<ConfirmacionEntregas> {
  File? _imageFile;
  final _picker = ImagePicker();

  //Opciones lista ESTADO ENTREGA
  var estado = ["Entregado", "Parcialmente Entregado", "No entregado"];
  String lista = "Estado de entrega";
  bool _guia = false;
  List guiasList = [];
  final _estadocontroller = TextEditingController();
  final _controllerNumGuia = TextEditingController();

  ///Función para obtener guías ingresadas en la base de datos
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

  ///Función para comparar si se encuentra la guía en la lista
  ///@param [idRef] argumento para comparar id de guía en guiasList
  ///@return [esIgual] booleano, si encuentra la guía true, sino false
  bool getData(String idRef) {
    String id = idRef;
    bool esIgual = false;

    for (int i = 0; i < guiasList.length; i++) {
      if ((guiasList[i]['id'] == id)) {
        print("validate");
        esIgual = true;
        i = guiasList.length;
      }
    }
    return esIgual;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    guiasList.clear();
    getGuias();

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Confirmación Entrega'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*Requerido';
                    } else {
                      return null;
                    }
                  },
                  controller: _controllerNumGuia,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(
                      Icons.content_paste,
                      color: Colors.black,
                    ),
                    labelText: "Número de guía o factura",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
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
                    iconSize: 40.0,
                    icon: const Icon(Icons.add_a_photo),
                    tooltip: 'Adjuntar imagen',
                    onPressed: _opcionesadjuntar,
                  ),
                ),
                Text("Adjuntar imagen"),
                const SizedBox(height: 20),
                if (this._imageFile == null)
                  Center()
                else
                  Image.file(this._imageFile!),
                const SizedBox(height: 20),
                new MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _guia = getData(_controllerNumGuia.text);
                      if (_guia == true) {
                        cargarimagen(
                            horaActual(), fechaActual(), valoritem.valorestado);
                        Route route = MaterialPageRoute(
                            builder: (contex) => Choferes(widget.fecha, ""));
                        Navigator.push(context, route);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blueGrey.shade600,
                            content: Text(
                              "N° de guía no encontrada",
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
                            "Ingrese los datos",
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
                  child: Text("Enviar información",
                      style: TextStyle(fontSize: 20)),
                  color: Colors.orange[600],
                  splashColor: Colors.blue,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Widget para mostrar la casilla para ingresar detalles de la entrega
  Widget mensajeEntrega() {
    return TextField(
      controller: this._estadocontroller,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '${this._estadocontroller.text.split('').length} words',
        border: const OutlineInputBorder(),
        hintText: "Ingrese detalle del motivo del estado de entrega",
      ),
      onChanged: (text) => setState(() {}),
    );
  }

  ///Función para actualizar los datos de confirmación de una guía con la imagen
  ///@param [hora] parámetro correspondiente a la hora de entrega de una guía
  ///@param [fecha] parámetro correspondiente a la fecha de entrega de una guía
  ///@param [estado] parámetro correspondiente al estado de la entrega
  void cargarimagen(String hora, String fecha, String estado) async {
    String horaEntrega = hora;
    String fechaEntrega = fecha;
    String estadoEntrega = estado;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("/imagenes");
    UploadTask uploadTask =
        ref.child(_controllerNumGuia.text + ".jpg").putFile(_imageFile!);
    String url = await (await uploadTask).ref.getDownloadURL();
    enviarimagen(
        url, horaEntrega, fechaEntrega, estadoEntrega, _estadocontroller.text);
    Route route =
        MaterialPageRoute(builder: (contex) => Choferes(widget.fecha, ""));
    Navigator.push(context, route);
  }

  ///Función para actualizar los datos de confirmación de una guía
  ///@param [url] parámetro de url de la imagen
  ///@param [hora] parámetro correspondiente a la hora de entrega de una guía
  ///@param [fecha] parámetro correspondiente a la fecha de entrega de una guía
  ///@param [estado] parámetro correspondiente al estado de la entrega
  ///@param [detalle] parámetro correspondiete al detalle de la entrega
  void enviarimagen(
      String url, String hora, String fecha, String estado, String detalle) {
    String horaEntrega = hora;
    String fechaEntrega = fecha;
    String estadoEntrega = estado;
    String detalleEstado = detalle;

    FirebaseFirestore imgref = FirebaseFirestore.instance;
    imgref.collection('guias').doc(_controllerNumGuia.text).update({
      'estado': estadoEntrega,
      "imagen": url,
      'fechaEntrega': fechaEntrega,
      'horaEntrega': horaEntrega,
      'detalle de entrega': detalleEstado
    });
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

  //Funciones para escoger imágen desde la galería
  Future<void> _imagengaleria() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    if (pickedfile != null) {
      setState(() => this._imageFile = File(pickedfile.path));
    }
  }

  //Funciones para tomar imágen desde la camara
  Future<void> _imagencamara() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedfile != null) {
      setState(() => this._imageFile = File(pickedfile.path));
    }
  }

  ///Función para obtener la fecha actual
  ///@return [dato] hora actual como String
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
}

//clase para obtener el valor seleccionado en el dropdownbutton de estado de entrega
// ignore: camel_case_types
class valoritem {
  static String valorestado = "";
}
