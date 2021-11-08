import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appolmedo/pages/admin_pages.dart';
import 'package:appolmedo/pages/chofer_pages.dart';
import 'package:appolmedo/pages/olvido_contrase%C3%B1a.dart';
import 'package:appolmedo/pages/selectCamion.dart';
import 'package:appolmedo/pages/confirmacion_entregas.dart';

void main() => runApp(AppOlmedo());

String username = '';

class AppOlmedo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App TransOlemdo',
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/adminsPages': (BuildContext context) => new Administrador(),
          '/choferPages': (BuildContext context) => new Choferes(),
          '/LoginPage': (BuildContext context) => LoginPage(),
          '/selectCamion': (BuildContext context) => new SelectCamion(),
          '/confirmacionEntregas': (BuildContext context) =>
              new ConfirmacionEntregas(),
          '/solicitud': (BuildContext context) => new Solicitud()
        });
  }
}

// Creación de la clase Login

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  bool _showPassword = false;
  String mensaje = '';

  Future<List> login() async {
    final response = await http
        .post(Uri.parse("http://192.168.1.135/transolmedo/login.php"), body: {
      "USERNAME": controllerUser.text,
      "PASSWORD": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.lenght == 0) {
      setState(() {
        mensaje = "usuario o contraseña incorrectos";
      });
    } else {
      if (datauser[0]['PERFIL'] == 'administrador') {
        Navigator.pushReplacementNamed(context,
            '/adminPages'); //si el dato leido de la base de datos es correcto, llevame a la pagina de admin
      } else if (datauser[0]['PERFIL'] == 'chofer') {
        Navigator.pushReplacementNamed(context,
            '/choferPages'); //si el dato leido de la base de datos es correcto, llevame a la pagina de chofer
      }
      setState(() {
        username = datauser[0]['USUARIO'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        //Fondo
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.orange[700],
          ),
          //Propiedades imagen de arriba
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              new Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      "assets/images/Logo.png",
                      height: 250,
                    ),
                  ],
                ),
                //Propiedades de espacio de texto usuario
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      height: 50,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ],
                      ),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.grey.shade900,
                          ),
                          border: InputBorder.none,
                          hintText: "Usuario",
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    //CONTAINER PASSWORD
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      height: 50,
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: controllerPass,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey.shade900,
                          ),
                          border: InputBorder.none,
                          hintText: "Contraseña",
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _showPassword
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade500,
                            ),
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                          ),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Solicitud(),
                              ),
                            ),
                          },
                          child: const Text(
                            "¿Olvidó su contraseña?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 01),
                                  blurRadius: 1,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    new MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Choferes()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 50,
                      minWidth: 200,
                      color: Colors.blue[800],
                      child: Text(
                        "INGRESAR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
