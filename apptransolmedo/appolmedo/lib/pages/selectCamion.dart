import 'package:flutter/material.dart';
import 'package:appolmedo/pages/choferPages.dart';

class selectCamion extends StatefulWidget {
  @override
  _selectCamionState createState() => _selectCamionState();
}

class _selectCamionState extends State<selectCamion> {
  @override
  //datos para usar en la lista desplegable de patente de camiones
  var camiones = ['camion1', 'camion 2', 'camion 3'];
  String datolista = 'Patente camión';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Generar Ruta'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 20),
            new Text(
              "Seleccione la patente del camión a utilizar",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange[600],
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),

            //lista de patentes
            const SizedBox(height: 50),
            Card(
              color: Colors.blue[700],
              elevation: 10.0,
              child: SizedBox(
                height: 130,
                width: 250,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      DropdownButton(
                        elevation: 30,
                        iconSize: 30,
                        items: camiones.map((String a) {
                          //camiones es declarada mas arriba como lista de strings, se declara como map, para utilizarlo, y luego se utiliza la variable a, para que al desplegar la lista arroje los datos que se encuentran en camiones
                          return DropdownMenuItem(
                              value: a,
                              child: Text(
                                  a)); //se retornan los datos contenidos en la lista antes declarada
                        }).toList(),
                        onChanged: (datonuevo) => {
                          setState(() {
                            datolista = datonuevo.toString();
                          })
                        },
                        hint: Text(datolista),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            //boton continuar
            new MaterialButton(
              onPressed: () {
                Navigator.push(context, datosRuta());
              },
              height: 50,
              minWidth: 300,
              child: Text("Continuar", style: TextStyle(fontSize: 30)),
              textColor: Colors.white,
              color: Colors.orange[600],
              splashColor: Colors.blue,
            ),
            const SizedBox(height: 90),
            Image.asset('assets/images/logoblanco.png'),
          ],
        ),
      ),
    );
  }
}

//Pantalla para llenar datos sobre la ruta y guia que se va a entregar
class datosRuta extends MaterialPageRoute<String> {
  bool numerovalido = true;
  datosRuta()
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
                      "Llene los siguientes datos",
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
                        labelText: "Número de guía",
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
                        prefixText: '+56',
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
                            MaterialPageRoute(builder: (contex) => choferes());
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
