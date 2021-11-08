import 'package:appolmedo/pages/widgets/logo_horizontal_azul.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/pages/chofer_pages.dart';

class SelectCamion extends StatefulWidget {
  @override
  _SelectCamionState createState() => _SelectCamionState();
}

class _SelectCamionState extends State<SelectCamion> {
  //datos para usar en la lista desplegable de patente de camiones
  var camiones = ['camion1', 'camion 2', 'camion 3', 'camion 4', 'camion 5'];
  String datolista = 'Patente camión';

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
                    child: DropdownButtonFormField(
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
                      items: camiones.map((String a) {
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
                      }).toList(),
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
                    ),
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
}

//Pantalla para llenar datos sobre la ruta y guia que se va a entregar
class DatosRuta extends MaterialPageRoute<String> {
  bool numerovalido = true;
  DatosRuta()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.orange[600],
              title: Text("Datos de Ruta"),
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
                    const SizedBox(height: 30),
                    //casilla n° guia
                    TextFormField(
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
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        labelText: "Número de contacto",
                        prefixText: '+569',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    //casilla fecha
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.black,
                        ),
                        labelText: "Fecha",
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 20),
                    //casilla de dirección
                    TextFormField(
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
                    TextFormField(
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
                    ),
                    const SizedBox(height: 20),
                    //boton generar ruta
                    new MaterialButton(
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (contex) => Choferes());
                        Navigator.push(context, route);
                      },
                      height: 40,
                      minWidth: 60,
                      child:
                          Text("Generar Ruta", style: TextStyle(fontSize: 20)),
                      color: Colors.orange[600],
                      splashColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
}
