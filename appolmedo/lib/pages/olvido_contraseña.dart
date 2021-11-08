import 'package:appolmedo/pages/contrase%C3%B1a_solicitada.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/pages/widgets/logo_horizontal.dart';

class Solicitud extends StatefulWidget {
  const Solicitud({Key? key}) : super(key: key);

  @override
  _SolicitudState createState() => _SolicitudState();
}

class _SolicitudState extends State<Solicitud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoencabezadoWidget(),
              SizedBox(
                height: 100,
                width: 250,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Solicitud de nueva contraseña",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Sansation',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    textScaleFactor: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 260,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Una vez sea enviada la solicitud, se le hará llegar un correo con una nueva contreseña",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
                ),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "Ingrese su Rut",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SolicitudEnviada(),
                    ),
                  ),
                },
                height: 40.0,
                minWidth: 200,
                child: Text(
                  "Solicitar",
                  style: TextStyle(fontSize: 25),
                ),
                textColor: Colors.white,
                color: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
