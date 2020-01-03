import 'package:flutter/material.dart';
import 'package:citas_medicas/request.dart';

Future<List<dynamic>> getHorarios() async {
  var result = await Request().get('_cat_horarios');

  //print("Datos:" + result.toString());

  return result['data'] as List<dynamic>;
}

typedef void ObjCallbackHorario(int id, String hora, Object obj);

class ModalHorarios {
  final myController = TextEditingController();

  mainBottomSheet(BuildContext context, ObjCallbackHorario onSeleccionado) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return
            FutureBuilder<List<dynamic>>(
                future: getHorarios(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  return !snapshot.hasData
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                            _createTile(
                                context,
                                'De '+ snapshot.data[index]['hora_inicio'] + " a " + snapshot.data[index]['hora_fin'],
                                Icons.access_time,
                                snapshot.data[index],
                                (id, hora, obj){
                                 onSeleccionado(snapshot.data[index]['id'],snapshot.data[index]['hora_inicio'],obj);
                                }
                            )
                            ]);
                      });
                });
        });
  }

  ListTile _createTile(BuildContext context, String name, IconData icon, var obj, ObjCallbackHorario onSeleccionado) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        onSeleccionado(obj['id'],obj['hora_inicio'],obj);
      },
    );
  }
}