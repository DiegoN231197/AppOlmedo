import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appolmedo/src/pages/chofer_pages.dart';
import 'package:appolmedo/src/pages/olvido_contrase%C3%B1a.dart';

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

  /// función inicial para obtener los datos del chofer
  void getChofer() async {
    CollectionReference choferesCollection =
        FirebaseFirestore.instance.collection("choferes");

    QuerySnapshot choferes = await choferesCollection.get();

    if (choferes.docs.length != 0) {
      for (var chofer in choferes.docs) {
        choferesList.add(chofer.data());
      }
    }
  }

  bool _showPassword = false;
  bool _login = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Función para comparar datos ingresados en login, con la lista generada en getChofer()
  /// @param [name] argumento a comparar con datos ingresados en login
  /// @param [password] argumento a comparar con datos ingresados en login
  /// @return [esIgual] booleano, si es correcta la comparación, true
  bool getData(String name, String password) {
    String nombre = name;
    String contrasena = password;
    bool esIgual = false;

    for (int i = 0; i < choferesList.length; i++) {
      if ((choferesList[i]['nombre'] == nombre) &&
          (choferesList[i]['contrasena'] == contrasena)) {
        esIgual = true;
        i = choferesList.length;
      }
    }
    return esIgual;
  }

  //llave para validar el Formulario
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    choferesList.clear();
    getChofer();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.orange[700],
          ),
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
                      ),
                    ),
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
                        ],
                      ),
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
                                builder: (context) => Choferes(
                                    "", controllerUser.text.toString()),
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
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blueGrey.shade600,
                              content: Text(
                                "Ingrese los datos",
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
