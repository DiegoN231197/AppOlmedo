//import 'dart:collection';
//import 'dart:ffi';

//import 'package:appolmedo/src/controller/camion/widget_camion.dart';
import 'package:appolmedo/src/pages/selectCamion.dart';
import 'package:appolmedo/src/pages/widgets/logo_horizontal_azul.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

//import 'camion.dart';
//import 'camion_acc.dart';

// ignore: must_be_immutable
class ListaCamiones extends StatefulWidget {
  ListaCamiones(this.patentes2, {Key? key}) : super(key: key);
  //final camionAcc = CamionAcc();
  var patentes2;

  @override
  _ListaCamionesState createState() => _ListaCamionesState(patentes2);
}

class _ListaCamionesState extends State<ListaCamiones> {
  //final ScrollController _scrollController = ScrollController();

  String datolista = "patente camion";

  List<DropdownMenuItem<Object>> patentes;
  _ListaCamionesState(this.patentes);

  //List patentes2 = [];
  /* Widget _getListaCamiones() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.camionAcc.getCamiones(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final camion = Camiondb.fromJson(json);
          patentes.add(camion.patente);
          return WidgetCamiones(camion.patente);
        },
      ),
    );
  } */

  void verpatentes() {
    print('patentes2:');
    print(patentes);
  }

  //final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    verpatentes();
    //guardarLista();
    //_getListaCamiones();
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Generar Ruta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //_getListaCamiones(),
            const SizedBox(height: 20),
            new Text(
              "Seleccione la patente del camión a utilizar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange[600],
                  fontFamily: 'Sansation',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            //lista de patentes
            const SizedBox(height: 30),
            Card(
              color: Colors.blue[700],
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox(
                height: 150,
                width: 250,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    /* child: DropdownButtonFormField(
                      elevation: 50,
                      iconSize: 30,
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      /* items: patentes.map((String a) {
                        //camiones es declarada mas arriba como lista de strings, se declara como map, para utilizarlo, y luego se utiliza la variable a, para que al desplegar la lista arroje los datos que se encuentran en camiones
                        return DropdownMenuItem(
                          value: a,
                          child: Text(
                            a,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ); //se retornan los datos contenidos en la lista antes declarada
                      }).toList(), */
                      onChanged: (datonuevo) => {
                        setState(
                          () {
                            datolista = datonuevo.toString();
                          },
                        ),
                      },
                      hint: Text(
                        datolista,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), */
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            //boton continuar
            new MaterialButton(
              onPressed: () {
                Navigator.push(context, DatosRuta());
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
    );
  }

  /* void guardarLista() {
    databaseReference.child('camiones').once().then((DataSnapshot snapshot) {
      print('Data :  ${snapshot.value} ');
      Map<String, Object> lista = new HashMap();
      //String patente = snapshot.value['patente'];
      lista.addAll(snapshot.value['patente']);
      print(lista);
    });
    //patentes.add(patente);
  } */

}
