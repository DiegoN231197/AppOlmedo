import 'package:appolmedo/src/pages/widgets/logo_horizontal_azul.dart';

import 'package:flutter/material.dart';

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

  //final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
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
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            //boton continuar
            new MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/datosruta');
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
}
