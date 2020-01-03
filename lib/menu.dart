import 'package:flutter/material.dart';
import 'package:citas_medicas/request.dart';
import 'package:citas_medicas/main.dart';
import 'package:citas_medicas/info.dart';
import 'package:citas_medicas/agendar_cita.dart';
import 'package:page_transition/page_transition.dart';

class Menu extends StatelessWidget {
  // This widget is the root of your application.
  String pathSlide = "assets/img/slide-nurse.png";
  String pathFondo = "assets/img/fondo.png";


  @override
  Widget build(BuildContext context) {
    Future<void> info() async {
      var request = await Request().post('http://192.168.1.79:8000/api/_Log_In',
          {'telefono': '9612339116', 'password': '123123'});

      print("Datos:" + request.toString());

      return request['data'] as Object;
    }

    Future<void> citas() async {
      var request = await Request().post('http://192.168.1.79:8000/api/_Log_In',
          {'telefono': '9612339116', 'password': '123123'});

      print("Datos:" + request.toString());

      return request['data'] as Object;
    }

    final slide = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pathSlide)),
      ),
    );

    final btnAgendar = new ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5.5,
        child: MaterialButton(
          onPressed: () => {
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AgendarCita()))
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.event_note,
                size: 40,
                color: Colors.white,
              ),
              Text("Agendar Cita")
            ],
          ),
          splashColor: Colors.lightBlue,
        ));

    final btnCitas = new ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5.5,
        child: MaterialButton(
          onPressed: () => {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.format_list_numbered,
                size: 40,
                color: Colors.white,
              ),
              Text("Mis Citas")
            ],
          ),
          splashColor: Colors.lightBlue,
        ));

    final btnInfo = new ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5.5,
        child: MaterialButton(
          onPressed: () => {
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Info()))
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.business,
                size: 40,
                color: Colors.white,
              ),
              Text("Información")
            ],
          ),
          splashColor: Colors.lightBlue,
        ));

    final btnMap = new ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5.5,
        child: MaterialButton(
          onPressed: () => {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.place,
                size: 40,
                color: Colors.white,
              ),
              Text("Ubicación")
            ],
          ),
          splashColor: Colors.lightBlue,
        ));

    var botones = new Row(
      children: <Widget>[
        Expanded(
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: btnAgendar,
                    ),
                  ],
                ),
              )),
              new Expanded(
                  child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: btnInfo,
                    ),
                  ],
                ),
              )),
            ],
          ),
          flex: 2,
        ),
        Expanded(
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: btnCitas,
                    ),
                  ],
                ),
              )),
              new Expanded(
                  child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: btnMap,
                    ),
                  ],
                ),
              )),
            ],
          ),
          flex: 2,
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
              icon: Icon(
                Icons.exit_to_app), //`Icon` to display
              label: Text('Salir'), //`Text` to display
              onPressed: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: MyApp()));
                //Navigator.pop(context);
              })
      )
    );

    return Scaffold(
        //appBar: AppBar(
        //title: Text(widget.title),
        //),
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage(pathFondo),
            fit: BoxFit.cover,
            )
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          new Expanded(
            child: new Column(
              children: <Widget>[
                slide,
                new Expanded(
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Expanded(
                            child: new Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [1],
                                  colors: [
                                    Colors.white.withOpacity(0.3),
                                  ],
                                ),
                              ),
                              child: botones,
                            )
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            //margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            child: btnSalir
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ])
      )
    );
  }
}
