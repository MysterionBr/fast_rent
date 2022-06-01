import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';
import 'dart:async';
import 'dart:convert';
import 'rest.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postRequest(String nome, String emailCliente,
    String assunto, String texto, BuildContext context) async {
  String url = BackEnd().address;

  Map dados = {
    'nome': nome,
    'emailCliente': emailCliente,
    'assunto': assunto,
    'texto': texto,
  };
  var body = json.encode(dados);

  //remover depois
  print(body);

  var response = await http.post(Uri.parse(url + '/mail'),
      headers: {"Content-Type": "application/json"}, body: body);
  print(response.statusCode);
  print(response.body);

  if (response.body == 'Sucesso') {
    respostaBack('O e-mail foi enviado com sucesso!', '', context);
  } else {
    respostaBack('Erro ao enviar o e-mail!', 'contato', context);
  }

  return response;
}

class ContatoWidget extends StatelessWidget {
  ContatoWidget({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final assuntoController = TextEditingController();
  final mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fale Conosco'),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 40),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundLogin.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: ScreenSize.widthPlusHeight / 20),
                CircleAvatar(
                  backgroundImage: const AssetImage("assets/images/email.png"),
                  radius: ScreenSize.widthPlusHeight / 33.3,
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 100),
                Text(
                  'Contato',
                  style: TextStyle(
                    fontFamily: 'Mermaid1001',
                    fontSize: ScreenSize.widthPlusHeight / 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 50),
                //Texto 'digite seus dados abaixo'
                Text(
                  'Digite seus dados abaixo',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 50),
                //Campo de texto 'Nome'
                TextField(
                  controller: nameController,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.emoji_emotions,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Nome*',
                  ),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 50),
                //Campo de texto 'Email'
                TextField(
                  controller: emailController,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Email*',
                  ),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 50),
                //Campo de texto 'assunto'
                TextField(
                  controller: assuntoController,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.draw_rounded,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Assunto*',
                  ),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 50),
                //Campo de texto 'mensagem'
                TextField(
                  controller: mensagemController,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.edit_note,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Mensagem*',
                  ),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 50),
                //Botão 'enviar'
                Container(
                  height: ScreenSize.widthPlusHeight / 22.2,
                  padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 200),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenSize.widthPlusHeight / 40)))),
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                    ),
                    onPressed: () {
                      postRequest(
                          nameController.text,
                          emailController.text,
                          assuntoController.text,
                          mensagemController.text,
                          context);
                    },
                  ),
                ),
                SizedBox(height: ScreenSize.widthPlusHeight / 150),
              ],
            ),
          ],
        ),
      )),
      drawer: const Menu(),
    );
  }
}
