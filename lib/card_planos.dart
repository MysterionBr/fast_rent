// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'screen_size.dart';
import 'package:http/http.dart' as http;
import 'rest.dart';
import 'dart:convert';

void confirmaDelete(int quantPlan, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Mensagem',
            style: TextStyle(fontSize: ScreenSize.width / 24),
          ),
          content: Text(
            'Se você continuar todos os seus anúncios serão apagados, deseja continuar?',
            style: (TextStyle(fontSize: ScreenSize.width / 28.8)),
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
                child: Text(
                  'Sim',
                  style: TextStyle(fontSize: ScreenSize.width / 32.72),
                ),
                onPressed: () => {
                      //Navigator.pop(context),
                      deletaAnuncios(quantPlan, context),
                    }),
            TextButton(
              child: Text(
                'Não',
                style: TextStyle(fontSize: ScreenSize.width / 32.72),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
}

Future<http.Response> deletaAnuncios(
    int quantPlan, BuildContext context) async {
  String url = BackEnd().address;
  final response = await http.get(Uri.parse(url + '/delMeusAnuncios'));
  if (response.body == '"Sucesso"') {
    addPlano(quantPlan, context);
  } else {
    print(response.body);
    respostaBack('Não foi possível deletar os anúncios', 'planos', context);
  }
  return response;
}

Future<http.Response> addPlano(int quantPlan, BuildContext context) async {
  String url = BackEnd().address;
  var id_plano = 0;
  if (quantPlan == 5) {
    id_plano = 1;
  } else if (quantPlan == 15) {
    id_plano = 2;
  } else if (quantPlan == 60) {
    id_plano = 3;
  }

  Map dados = {
    'id_plano': id_plano,
  };
  var body = json.encode(dados);
  var response = await http.post(Uri.parse(url + '/addPlano'),
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.body == '"ADD"') {
    respostaBack('Plano contratado com sucesso!', 'user', context);
  } else if (response.body == '"ALTER"') {
    respostaBack('Plano alterado com sucesso!', 'user', context);
  } else if (response.body == '"DEL"') {
    confirmaDelete(quantPlan, context);
  } else {
    respostaBack('Erro ao contratar plano', 'planos', context);
  }

  return response;
}

Future<http.Response> verificaLogin(int quantPlan, BuildContext context) async {
  String url = BackEnd().address;
  final response = await http.get(Uri.parse(url + '/login'));

  if (response.body == 'null') {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Mensagem',
              style: TextStyle(fontSize: ScreenSize.width / 24),
            ),
            content: Text(
              'Você deve realizar o login para contratar um plano',
              style: (TextStyle(fontSize: ScreenSize.width / 28.8)),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: ScreenSize.width / 32.72),
                ),
                onPressed: () => Navigator.of(context).pushNamed('/login'),
              )
            ],
          );
        });
  } else {
    addPlano(quantPlan, context);
  }

  return response;
}

class CardPlans extends StatelessWidget {
  final int quantPlan, valorPlan;

  const CardPlans({Key? key, required this.quantPlan, required this.valorPlan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$quantPlan ANÚNCIOS / MÊS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenSize.widthPlusHeight / 100)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('R\$',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 90)),
            Text('$valorPlan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenSize.widthPlusHeight / 55.5)),
            Text(', 99',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 90)),
            Opacity(
                opacity: 0.4,
                child: Text(' / MÊS',
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 90))),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(243, 228, 111, 111),
                        Color.fromARGB(255, 236, 62, 62),
                        Color.fromARGB(255, 245, 10, 10),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 125),
                  primary: Colors.white,
                  textStyle:
                      TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                ),
                onPressed: () {
                  verificaLogin(quantPlan, context);
                },
                child: const Text('Contratar'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
      ],
    ));
  }
}
