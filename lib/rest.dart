import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BackEnd {
  //String address = 'http://localhost:3000';
  String address = 'https://mock-json-service.glitch.me/';
}

class Requests {
  Future<http.Response> get() {
    String url = BackEnd().address;
    return http.get(Uri.parse(url + '/url'));
  }

  Future<http.Response> post(String username, String password) async {
    String url = BackEnd().address;

    Map dados = {
      'nome': username,
      'senha': password,
    };
    var body = json.encode(dados);

    //remover depois
    print(body);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print(response.statusCode);
    print(response.body);

    return response;
  }

  void put() {}

  void delete() {}
}
