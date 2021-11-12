import 'package:appolmedo/main.dart';
import 'package:appolmedo/src/pages/widgets/logo_horizontal.dart';
import 'package:flutter/material.dart';

class SolicitudEnviada extends StatefulWidget {
  const SolicitudEnviada({Key? key}) : super(key: key);

  @override
  _SolicitudEnviadaState createState() => _SolicitudEnviadaState();
}

class _SolicitudEnviadaState extends State<SolicitudEnviada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoencabezadoWidget(),
              SizedBox(
                height: 120,
                width: 250,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "¡Solicitud enviada con éxito!",
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
                          blurRadius: 3,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    textScaleFactor: 1,
                  ),
                ),
              ),
              MaterialButton(
                height: 45,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  ),
                },
                child: const Text(
                  'Volver a Inicio',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Colors.blue.shade800,
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
