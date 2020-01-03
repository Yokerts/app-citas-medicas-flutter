import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:citas_medicas/request.dart';


class Info extends StatelessWidget {
  // This widget is the root of your application.

  var textoInfo = {
    "data": [
      { "icon": "", "text": "01 800 123 4567"},
      { "icon": "", "text": "+52 012 345 6789"},
      { "icon": "", "text": "citas_medicas@gmail.com"},
      { "icon": "", "text": "www.citas_medicas.com.mx"},
    ]
  };

  Future<void> login() async {
    var request = await Request().post('http://192.168.1.79:8000/api/_Log_In',
        {'telefono': '9612339116', 'password': '123123'});

    print("Datos:" + request.toString());

    return request['data'] as Object;
  }

  @override
  Widget build(BuildContext context) {
    String pathFondo = "assets/img/fondo.png";
    String pathLogo = "assets/img/logo.png";

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

    var rowInfo = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: new Icon(
                      Icons.phone_in_talk,
                      size: 24,
                      color: Colors.white,
                    )
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "01 800 123 4567",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    )
                  ),
                  flex: 6,
                ),
              ],
            )
          ),
          Align(
            alignment: Alignment.center,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: new Icon(
                      MdiIcons.whatsapp,
                      size: 24,
                      color: Colors.white,
                    )
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "+52 012 345 6789",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    )
                  ),
                  flex: 6,
                ),
              ],
            )
          ),
          Align(
            alignment: Alignment.center,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: new Icon(
                      Icons.email,
                      size: 24,
                      color: Colors.white,
                    )
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "citas_medicas@gmail.com",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    )
                  ),
                  flex: 6,
                ),
              ],
            )
          ),
          Align(
            alignment: Alignment.center,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: new Icon(
                      Icons.language,
                      size: 24,
                      color: Colors.white,
                    )
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "www.citas_medicas.com.mx",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    )
                  ),
                  flex: 6,
                ),
              ],
            )
          ),
        ],
      ),
    );

    var ubicacion = new Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      color: Colors.white,
      child: new  Align(
          alignment: Alignment.center,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    child: new Icon(
                      Icons.location_on,
                      size: 24,
                      color: Colors.blue,
                    )
                ),
                flex: 1,
              ),
              Expanded(
                child: new Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: new Text(
                        "Calle Balderas #123, Centro de Tuxtla Gutierrez, Chiapas. CP: 29000",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                        style: TextStyle( fontWeight: FontWeight.normal)
                    )
                ),
                flex: 6,
              ),
            ],
          )
      )
    );

    final btnMenu= new Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 40.0,
            child: FlatButton.icon(
                color: const Color(0xFF107193),
                textColor: Colors.white,
                icon: Icon(Icons.arrow_back),
                label: Text('Menu'),
                onPressed: () {})));

    return Scaffold(
      //appBar: AppBar(
      //title: Text(widget.title),
      //),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathFondo),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      slide,
                      Positioned(
                        child: AppBar(
                          title: Text("Información",
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
                      )
                    ],
                  ),
                  rowInfo,
                  ubicacion
                ],
              ),

            ),
            Container(
                width: MediaQuery.of(context).size.width, margin: EdgeInsets.only(top: 2, bottom: 2), alignment: Alignment.center, child: btnMenu)
          ],
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
