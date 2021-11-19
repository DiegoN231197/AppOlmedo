import 'package:flutter/material.dart';

class WidgetCamiones extends StatelessWidget {
  final String patente;

  const WidgetCamiones(this.patente, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Text(
        patente,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
