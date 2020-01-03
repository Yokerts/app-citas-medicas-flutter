import 'package:flutter/material.dart';
import 'package:citas_medicas/request.dart';

class Register extends StatelessWidget {
  // This widget is the root of your application.

  String pathFondo = "assets/img/fondo.png";
  String pathLogo = "assets/img/logo.png";

  @override
  Widget build(BuildContext context) {
    Future<void> info() async {
      var request = await Request().post('http://192.168.1.79:8000/api/_Log_In', {'telefono': '9612339116', 'password': '123123'});

      print("Datos:" + request.toString());

      return request['data'] as Object;
    }

    Future<void> citas() async {
      var request = await Request().post('http://192.168.1.79:8000/api/_Log_In', {'telefono': '9612339116', 'password': '123123'});

      print("Datos:" + request.toString());

      return request['data'] as Object;
    }

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
        height: MediaQuery.of(context).size.height / 3,
        padding: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        child: imgLogo
    );

    final form = new Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Nombre',
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 16),
          height: 42,
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Apellido Paterno',
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 16),
          height: 42,
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Apellido Materno',
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 16),
          height: 42,
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
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
          width: MediaQuery.of(context).size.width,
          height: 42,
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
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
      ],
    );

    final btnSalir = new Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 40.0,
            child: FlatButton.icon(
                color: const Color(0xFF107193),
                textColor: Colors.white,
                icon: Icon(Icons.account_box),
                label: Text('Regístrase'),
                onPressed: () {})));

    return Scaffold(
        /*appBar: AppBar(
      ),*/
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pathFondo),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                child: new Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: <Widget>[
              new Expanded(
                  child: new Container(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              slide,
                              new Container(
                                margin: EdgeInsets.all(16),
                                child: form,
                              )
                            ],
                          ),
                          Positioned(
                            child: AppBar(
                              title: Text("Regístro",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              /*actions: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: () {},
                                  tooltip: 'Share',
                                ),
                              ],*/
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width, margin: EdgeInsets.only(top: 2, bottom: 2), alignment: Alignment.center, child: btnSalir)
            ]))));
  }
}
