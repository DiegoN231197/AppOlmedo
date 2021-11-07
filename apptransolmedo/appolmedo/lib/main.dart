import 'dart:convert';

import 'package:appolmedo/pages/adminPages.dart';
import 'package:appolmedo/pages/choferPages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appolmedo/pages/selectCamion.dart';
import 'package:appolmedo/pages/confirmacionEntregas.dart';

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
          '/adminsPages': (BuildContext context) => new administrador(),
          '/choferPages': (BuildContext context) => new choferes(),
          '/LoginPage': (BuildContext context) => LoginPage(),
          '/selectCamion': (BuildContext context) => new selectCamion(),
          '/confirmacionEntregas': (BuildContext context) =>
              new confirmacionEntregas(),
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
            color: Colors.orange[600],
            //image: new DecorationImage(
            //image:
            //    new AssetImage("assets/images/viper.jpg"), //imagen de fondo
            //fit: BoxFit.cover),
          ),
          //Propiedades imagen de arriba
          child: Column(
            children: <Widget>[
              new Container(
                  margin: EdgeInsets.only(top: 140),
                  padding: EdgeInsets.only(top: 0),
                  child: new CircleAvatar(
                    backgroundColor: Colors.orange[700],
                    child: new Image(
                      width: 700,
                      height: 700,
                      image: new AssetImage('assets/images/transo.png'),
                    ),
                  ),
                  //Propiedades de espacio de texto usuario
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(shape: BoxShape.circle)),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 90),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        padding: EdgeInsets.only(
                            top: 0.2, left: 15, right: 15, bottom: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: TextFormField(
                            controller: controllerUser,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.account_circle,
                                  color: Colors.orange,
                                ),
                                hintText: "Usuario"))),
                    //CONTAINER PASSWORD
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      height: 50,
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.only(
                          top: 0.2, left: 15, right: 15, bottom: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5)
                          ]),
                      child: TextFormField(
                          controller: controllerPass,
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.orange,
                              ),
                              hintText: "Constraseña")),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6, right: 32),
                        child: Text(
                          "¿Olvidó su contraseña?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                    new ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => choferes()));
                      },
                      child: Text("INGRESAR"),
                    )
                    //new ElevatedButton
                    // child: new Text("Ingresar"),
                    //color: Colors.orangeAccent,
                    //shape: new RoundedRectangleBorder(
                    //  borderRadius: new BorderRadius.circular(60)
                    //  ),
                    //onPressed: () {
                    // login();
                    //Navigator.pop(context);
                    //},
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
