//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto01/listas_anuncio.dart';
import 'menu.dart';
import 'screen_size.dart';
//import 'card_anuncio.dart';
import 'package:http/http.dart' as http;
//import 'package:sync_http/sync_http.dart';
import 'rest.dart';
import 'dart:async';
import 'dart:convert';

class Usuario {
  final String nome;
  final String cpf;
  final String dataNasc;
  final String email;
  final String celular;

  Usuario({
    required this.nome,
    required this.cpf,
    required this.dataNasc,
    required this.email,
    required this.celular,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      cpf: json['cpf'],
      dataNasc: json['dataNasc'],
      email: json['email'],
      celular: json['celular'],
    );
  }
}

Future<Usuario> fetchUsuario() async {
  String url = BackEnd().address;
  final response = await http.get(Uri.parse(url + '/usuario'));

  if (response.statusCode == 200) {
    return Usuario.fromJson(jsonDecode(response.body)[0]);
  } else {
    throw Exception('Não foi possível carregar os dados do usuário');
  }
}

Future<void> encerraSessao(BuildContext context) async {
  String url = BackEnd().address;
  final response = await http.get(Uri.parse(url + '/logout'));

  if (response.body == '"Sessão finalizada"') {
    respostaBack('Sessão finalizada com sucesso!', '', context);
  } else {
    respostaBack('Não foi possível finalizar a sessão', '', context);
  }
}

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  late Future<Usuario> futureUsuario;

  @override
  void initState() {
    super.initState();
    futureUsuario = fetchUsuario();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundUsuario.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            //Ícone e texto
            Container(
                padding: EdgeInsets.fromLTRB(
                    0, ScreenSize.widthPlusHeight / 15, 0, 0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/avatar.png'),
                    radius: ScreenSize.widthPlusHeight / 22.2,
                  ),
                )),
            SizedBox(height: ScreenSize.widthPlusHeight / 100),
            FutureBuilder<Usuario>(
                future: futureUsuario,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          snapshot.data!.nome,
                          style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'Encerrar sessão',
                            style: TextStyle(
                                fontSize: ScreenSize.widthPlusHeight / 100,
                                color: Colors.blue),
                          ),
                          onPressed: () {
                            encerraSessao(context);
                          },
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Usuário',
                        style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ));
                  }
                  return const CircularProgressIndicator();
                }),
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenSize.widthPlusHeight / 15, 0, 0),
              child: Text(
                'Meus Anúncios',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              height: ScreenSize.widthPlusHeight / 8,
              child: const ListaMeusAnuncios(),
            )),
            //Texto 'Anúncios Favoritos'
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenSize.widthPlusHeight / 25, 0, 0),
              child: Text(
                'Anúncios Favoritos',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              height: ScreenSize.widthPlusHeight / 8,
              child: const ListaAnunciosFavoritos(),
            )),
          ],
        ),
      )),
      drawer: const Menu(),
    );
  }
}
