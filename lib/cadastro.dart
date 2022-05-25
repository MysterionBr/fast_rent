import 'package:flutter/material.dart';
import 'menu.dart';
import 'screen_size.dart';
import 'rest.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postRequest(String nome, String cpf, String data,
    String email, String celular, String password) async {
  String url = BackEnd().address;

  Map dados = {
    'Nome': nome,
    'CPF': cpf,
    'Data': data,
    'Email': email,
    'Celular': celular,
    'Senha': password,
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

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Cadastro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
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
                      'Cadastro',
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
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                    ),
                    SizedBox(height: ScreenSize.widthPlusHeight / 50),
                    //Campo de texto 'email'
                    TextField(
                      controller: emailController,
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
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
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
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
                    //Campo de texto 'nome'
                    TextField(
                      controller: nameController,
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.account_circle,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Nome*',
                      ),
                    ),
                    SizedBox(height: ScreenSize.widthPlusHeight / 50),
                    //Campo de texto 'data de nascimento'
                    TextField(
                      controller: dataController,
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Data de nascimento*',
                      ),
                    ),
                    SizedBox(height: ScreenSize.widthPlusHeight / 50),
                    //Campo de texto 'CPF'
                    TextField(
                      controller: cpfController,
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.account_box_rounded,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'CPF*',
                      ),
                    ),
                    SizedBox(height: ScreenSize.widthPlusHeight / 50),
                    //Campo de texto 'celular'
                    TextField(
                      controller: celularController,
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.call,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Celular*',
                      ),
                    ),
                    SizedBox(height: ScreenSize.widthPlusHeight / 50),
                    //Botão 'entrar'
                    Container(
                      height: ScreenSize.widthPlusHeight / 22.2,
                      padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 200),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenSize.widthPlusHeight / 40)))),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                              fontSize: ScreenSize.widthPlusHeight / 66.6),
                        ),
                        onPressed: () {
                          postRequest(
                              nameController.text,
                              cpfController.text,
                              dataController.text,
                              emailController.text,
                              celularController.text,
                              passwordController.text);
                        },
                      ),
                    ),
                    SizedBox(height: ScreenSize.widthPlusHeight / 150),
                    //Texto com link para a página 'login'
                    Row(
                      children: <Widget>[
                        Text(
                          'Já possui uma conta?',
                          style: TextStyle(
                              fontSize: ScreenSize.widthPlusHeight / 100),
                        ),
                        TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: ScreenSize.widthPlusHeight / 100,
                                color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
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
        drawer: const Menu());
  }
}
