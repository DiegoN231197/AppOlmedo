import 'package:flutter/material.dart';

class GuiaWidget extends StatelessWidget {
  late final String numguia;
  late final String estado;

  GuiaWidget(this.numguia, this.estado, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 2.0,
                  offset: const Offset(0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () => {},
              padding: const EdgeInsets.only(left: 15),
              child: Wrap(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(numguia),
                        Text(estado),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
