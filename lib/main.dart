import 'package:flutter/material.dart';
import 'package:citas_medicas/request.dart';
import 'package:citas_medicas/register.dart';
import 'package:citas_medicas/menu.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citas medicas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Citas medicas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pathFondo = "assets/img/fondo.png";
  String pathLogo = "assets/img/logo.png";

  @override
  void initState() {
    // TODO: implement initState
    insertarDatos();
    super.initState();
  }

  void insertarDatos() async {
    await login();
  }

  Future<void> login() async {
    var request = await Request().post('http://192.168.1.79:8000/api/_Log_In',
        {'telefono': '9612339116', 'password': '123123'});

    print("Datos:" + request.toString());

    return request['data'] as Object;
  }


  @override
  Widget build(BuildContext context) {

    final imgLogo = new Container(
        child: new Center(
            child: new Image.asset(
                pathLogo,
                width: 120,
                height: 120
            )
        )
    );
    var slide =  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        padding: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        child: imgLogo
    );

    final btnSesion = MaterialButton(
      onPressed: () => {
        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Menu()))
      },
      minWidth: MediaQuery.of(context).size.width / 1.2,
      height: 40.0,
      color: Colors.blue,
      textColor: Colors.white,
      child: new Text("Iniciar Sesión"),
      splashColor: Colors.lightBlue,
    );

    final btnRegister = MaterialButton(
    onPressed: () => {
      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Register()))
    },
    minWidth: MediaQuery.of(context).size.width / 1.2,
    height: 40.0,
    color: Colors.orange,
    textColor: Colors.white,
    child: new Text("Nuevo regístro"),
    splashColor: Colors.orangeAccent,
    );

    return Scaffold(
      //appBar: AppBar(
      //title: Text(widget.title),
      //),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathFondo),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: slide
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 42,
                    padding:
                        EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 6)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        hintText: 'Teléfono',

                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 42,
                    margin: EdgeInsets.only(top: 16),
                    padding:
                        EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 6)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Contraseña',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, right: 32, bottom: 16),
                      child: Text(
                        'Recuperar contraseña',
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          btnSesion,
                          new Container(
                            margin: EdgeInsets.only(top: 6),
                            child: btnRegister,
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
