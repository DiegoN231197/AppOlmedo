import 'package:flutter/material.dart';
import 'dart:math' as math;

class LogoencabezadoWidget extends StatefulWidget {
  const LogoencabezadoWidget({Key? key}) : super(key: key);

  @override
  _LogoencabezadoWidgetState createState() => _LogoencabezadoWidgetState();
}

class _LogoencabezadoWidgetState extends State<LogoencabezadoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
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
            top: 25,
            left: 100,
            child: Container(
              height: 80,
              width: 220,
              alignment: Alignment.topCenter,
              child: const Text(
                'TRANSPORTES PATRICIO OLMEDO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Sansation',
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(-1, 2),
                      blurRadius: 4,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            child: SizedBox(
              width: 300,
              child: Transform.rotate(
                angle: 2.4848083448933725e-17 * (math.pi / 180),
                child: const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
