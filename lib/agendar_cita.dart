import 'dart:convert';

import 'package:citas_medicas/modals/list_horarios.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';


class AgendarCita extends StatefulWidget {
  // This widget is the root of your application.

  AgendarCita();

  @override
  _AgendarCita createState() => _AgendarCita();
}


class _AgendarCita extends State<AgendarCita> {
  _AgendarCita();

  String pathSlide = "assets/img/slide-medical.png";
  String pathFondo = "assets/img/fondo.png";
  String pathLogo = "assets/img/logo.png";

  ModalHorarios modalHorarios = new ModalHorarios();

  DateTime _date = new DateTime.now();
  DateTime _firstDate = new DateTime(2019);
  DateTime _lastDate = new DateTime(2050);
  TimeOfDay _time = new TimeOfDay.now();

  var _dateSelected = 'Selecciona Fecha';
  var _timeSelected = 'Selecciona Horario';

  @override
  Widget build(BuildContext context) {
    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: _firstDate,
          lastDate: _lastDate
      );

      if (picked != null && picked != _date) {
        print('Date Selected: ${_date.toString()}');
        setState(() {
          _dateSelected = new DateFormat("dd/MM/yyyy").format(picked);
        });
      }
    }


    final imgLogo = new Container(child: new Center(child: new Image.asset(pathLogo, width: 120, height: 120)));

    final slide = Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pathSlide)),
      ),
    );

    final btnFecha = new Container(
        margin: EdgeInsets.only(left: 0, right: 10),
        alignment: Alignment.centerLeft,
        child: ButtonTheme(
          //minWidth: MediaQuery.of(context).size.width,
            height: 42,
            child: FlatButton.icon(
                color: Colors.white,
                textColor: Colors.grey,
                icon: Icon(Icons.account_box),
                label: Text('Selecciona Fecha'),
                onPressed: () {})));

    final btnHorario = new Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ButtonTheme(
            minWidth: MediaQuery
                .of(context)
                .size
                .width,
            height: 40.0,
            child: FlatButton.icon(
                color: Colors.white,
                textColor: Colors.grey,
                icon: Icon(Icons.account_box),
                label: Text('Selecciona Horario'),
                onPressed: () {})));

    final form = new Column(
      children: <Widget>[
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
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
              hintText: 'Nombre(s)',
            ),
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 42,
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
          child: new TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.date_range),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              border: InputBorder.none,
              hintText: _dateSelected,
            ),
            readOnly: true,
          ),
        ),
        Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 42,
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
            child: new TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {
                    modalHorarios.mainBottomSheet(context, (id,hora,obj){
                      print(obj);
                      setState(() {
                        _timeSelected = hora.toString();
                      });
                    });

                  },
                ),
                border: InputBorder.none,
                hintText: _timeSelected,
              ),
              readOnly: true,
            ))
      ],
    );

    final btnSalir = new Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ButtonTheme(
            minWidth: MediaQuery
                .of(context)
                .size
                .width,
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                      iconTheme: IconThemeData(
                                        color: Colors.blue, //change your color here
                                      ),
                                      title: Text(
                                        "Agendar Cita",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.blue, fontFamily: "Lato", fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width, margin: EdgeInsets.only(top: 2, bottom: 2), alignment: Alignment.center, child: btnSalir)
                ]))));
  }

}


