import 'dart:convert';

import 'package:http/http.dart' as http;
class Request{

  static const url_api = "http://192.168.0.10:8000/api/";

  Future<dynamic> get(String url) async {
    var request = await http.get(url_api+url, headers: {
      'Accept': 'Application/json',
    });

    if(request.statusCode == 200){
      var response = jsonDecode(request.body);
      return response;
    }
    else{
      print(request.toString());
      return null;
    }
  }

  Future<dynamic> post(url, Map<String,String> values) async {
    print("Request POST");

    var request = await http.post(url_api+url,
    headers: {
      'Accept':'Application/json',
    },
    body: json.encode(values)
    );
    print("Request "+ request.toString());

    if(request.statusCode == 200 || request.statusCode == 201){
      var response = jsonDecode(request.body);
      return response;
    }
    else{
      print("Ocurrio un Error");
      return null;
    }
  }

}