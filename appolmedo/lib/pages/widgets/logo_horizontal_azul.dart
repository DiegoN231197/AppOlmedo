import 'package:flutter/material.dart';
import 'dart:math' as math;

class LogoAzulWidget extends StatefulWidget {
  const LogoAzulWidget({Key? key}) : super(key: key);

  @override
  _LogoAzulWidgetState createState() => _LogoAzulWidgetState();
}

class _LogoAzulWidgetState extends State<LogoAzulWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LogoencabezadoWidget - COMPONENT

    return SizedBox(
      width: 300,
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: SizedBox(
              width: 300,
              child: Transform.rotate(
                angle: 2.4848083448933725e-17 * (math.pi / 180),
                child: const Divider(
                  color: Color.fromRGBO(61, 97, 150, 1),
                  thickness: 2,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 15,
            child: Container(
              width: 122,
              height: 114,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/LogoAzul.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 100,
            child: Container(
              height: 80,
              width: 220,
              alignment: Alignment.topCenter,
              child: Text(
                'TRANSPORTES PATRICIO OLMEDO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontFamily: 'Sansation',
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(-1, 1),
                      blurRadius: 3,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
