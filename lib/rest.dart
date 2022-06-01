import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'screen_size.dart';

class BackEnd {
  String address = 'http://localhost:5000';
  //String address = 'https://mock-json-service.glitch.me/';
}

String folderName = 'FastRent';

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

void respostaBack(String texto, String redirect, BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalhes',
            style: TextStyle(fontSize: ScreenSize.width / 24),
          ),
          content: Text(
            texto,
            style: (TextStyle(fontSize: ScreenSize.width / 28.8)),
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(fontSize: ScreenSize.width / 32.72),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/$redirect'),
            ),
          ],
        );
      });
}
