import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';
import 'package:appolmedo/src/pages/olvido_contrase%C3%B1a.dart';
import 'package:appolmedo/src/pages/selectCamion.dart';
import 'package:appolmedo/src/pages/confirmacion_entregas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppOlmedo());
}

class AppOlmedo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App TransOlemdo',
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginPage(),
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

  void initState() {
    super.initState();
  }

  List choferesList = [];

  void getChofer() async {
    CollectionReference choferesCollection =
        FirebaseFirestore.instance.collection("choferes");

    QuerySnapshot choferes = await choferesCollection.get();

    if (choferes.docs.length != 0) {
      for (var chofer in choferes.docs) {
        choferesList.add(chofer.data());
      }
    }
    print(choferesList);
  }

  bool _showPassword = false;
  bool _login = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // función inicial para obtener los datos del chofer, despues
  // hay que obtener una lista de los choferes e ir comprobando cada uno, quizás ahi usar clases
  bool getData(String name, String password) {
    String nombre = name;
    String contrasena = password;
    bool verdadero = false;

    for (int i = 0; i < choferesList.length; i++) {
      if ((choferesList[i]['nombre'] == nombre) &&
          (choferesList[i]['password'] == contrasena)) {
        i = choferesList.length;
        print("validate");
        verdadero = true;
      } else {
        print("error");
      }
    }
    return verdadero;
  }

  //llave para validar el Form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    choferesList.clear();
    getChofer();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*Requerido';
                          } else {
                            return null;
                          }
                        },
                        controller: controllerUser,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.grey.shade900,
                          ),
                          border: InputBorder.none,
                          hintText: "Usuario",
                        ),
                        //keyboardType: TextInputType.number,
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
                        validator: (valor) {
                          if (valor!.isEmpty) {
                            return '*Requerido';
                          } else {
                            return null;
                          }
                        },
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
                    SizedBox(height: 5),
                    new MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _login =
                              getData(controllerUser.text, controllerPass.text);
                          if (_login == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Choferes(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.blueGrey.shade600,
                                content: Text(
                                  "Datos Incorrectos",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        }
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
