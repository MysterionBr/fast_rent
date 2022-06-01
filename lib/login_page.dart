import 'package:flutter/material.dart';
import 'package:projeto01/rest.dart';
import 'menu.dart';
import 'screen_size.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postRequest(
    String username, String password, BuildContext context) async {
  String url = BackEnd().address;

  Map dados = {
    'Email': username,
    'Senha': password,
  };
  var body = json.encode(dados);

  //remover depois
  print(body);

  var response = await http.post(Uri.parse(url + '/login'),
      headers: {"Content-Type": "application/json"}, body: body);
  print(response.statusCode);
  print(response.body);

  if (response.body == '"Sucesso"') {
    respostaBack('Login realizado com sucesso!', 'user', context);
  } else {
    respostaBack('Não foi possível realizar o login', 'login', context);
  }

  return response;
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    backgroundImage:
                        const AssetImage("assets/images/avatar.png"),
                    radius: ScreenSize.widthPlusHeight / 33.3,
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 100),
                  Text(
                    'Login',
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
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'Email'
                  TextField(
                    controller: nameController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.account_circle,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Email*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'senha'
                  TextField(
                    controller: passwordController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Senha*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Botão 'entrar'
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
                        'Entrar',
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 66.6),
                      ),
                      onPressed: () {
                        postRequest(nameController.text,
                            passwordController.text, context);
                      },
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 150),
                  //Texto com link para a página 'cadastro'
                  Row(
                    children: <Widget>[
                      Text(
                        'Ainda não possui uma conta?',
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 100),
                      ),
                      TextButton(
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                              fontSize: ScreenSize.widthPlusHeight / 100,
                              color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cadastro');
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: const Menu(),
    );
  }
}
