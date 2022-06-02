import 'package:flutter/material.dart';
import 'menu.dart';
import 'screen_size.dart';
import 'package:http/http.dart' as http;
import 'rest.dart';
import 'dart:async';
import 'dart:convert';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var celularFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

void confirmarExlusao(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Excluir conta',
            style: TextStyle(fontSize: ScreenSize.width / 24),
          ),
          content: Text(
            'Tem certeza? Você perderá o plano contratado e seus anúncios serão excluídos',
            style: (TextStyle(fontSize: ScreenSize.width / 28.8)),
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
                child: Text(
                  'Sim',
                  style: TextStyle(fontSize: ScreenSize.width / 32.72),
                ),
                onPressed: () => {excluiUsuario(context)}),
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

void retornoBack(String texto, BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Mensagem',
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
                  'ok',
                  style: TextStyle(fontSize: ScreenSize.width / 32.72),
                ),
                onPressed: () => Navigator.pushNamed(context, '/')),
          ],
        );
      });
}

Future<http.Response> excluiUsuario(BuildContext context) async {
  String url = BackEnd().address;
  final response = await http.get(Uri.parse(url + '/deluser'));
  await http.get(Uri.parse(url + '/logout'));

  if (response.body == '"Sucess"') {
    retornoBack('Conta excluída com sucesso!', context);
  } else {
    retornoBack('Não foi possível excluir a conta', context);
  }
  return response;
}

Future<http.Response> postRequest(
    String email, String celular, BuildContext context) async {
  String url = BackEnd().address;

  Map dados = {
    'Email': email,
    'Celular': celular,
  };
  var body = json.encode(dados);
  var response = await http.post(Uri.parse(url + '/attuser'),
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.body == '"Sucesso"') {
    respostaBack('Dados editados com sucesso!', 'user', context);
  } else {
    respostaBack('Não foi possível editar os dados', 'attuser', context);
  }

  return response;
}

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  EditUserState createState() => EditUserState();
}

class EditUserState extends State<EditUser> {
  late Future<http.Response> response;
  TextEditingController celularController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    response = getLogin();
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
              child: FutureBuilder<http.Response>(
                  future: response,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.body == 'null') {
                        return const AcessoNegado();
                      } else if (snapshot.data!.body != 'null') {
                        return Container(
                          padding:
                              EdgeInsets.all(ScreenSize.widthPlusHeight / 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: ScreenSize.widthPlusHeight / 20),
                              CircleAvatar(
                                backgroundImage: const AssetImage(
                                    "assets/images/avatar.png"),
                                radius: ScreenSize.widthPlusHeight / 33.3,
                              ),
                              SizedBox(
                                  height: ScreenSize.widthPlusHeight / 100),
                              Text(
                                'Editar dados',
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
                                'Digite abaixo os dados para alteração',
                                style: TextStyle(
                                    fontSize:
                                        ScreenSize.widthPlusHeight / 66.6),
                              ),
                              SizedBox(height: ScreenSize.widthPlusHeight / 50),
                              //Campo de texto 'email'
                              TextField(
                                controller: emailController,
                                style: TextStyle(
                                    fontSize:
                                        ScreenSize.widthPlusHeight / 66.6),
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
                              //Campo de texto 'celular'
                              TextField(
                                inputFormatters: [celularFormatter],
                                controller: celularController,
                                style: TextStyle(
                                    fontSize:
                                        ScreenSize.widthPlusHeight / 66.6),
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
                              //Botões
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: ScreenSize.widthPlusHeight / 15,
                                    padding: EdgeInsets.all(
                                        ScreenSize.widthPlusHeight / 66.6),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(ScreenSize
                                                              .widthPlusHeight /
                                                          40)))),
                                      onPressed: () {
                                        confirmarExlusao(context);
                                      },
                                      child: Text(
                                        'Excluir conta',
                                        style: TextStyle(
                                            fontSize:
                                                ScreenSize.widthPlusHeight /
                                                    66.6),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenSize.widthPlusHeight / 15,
                                    padding: EdgeInsets.all(
                                        ScreenSize.widthPlusHeight / 66.6),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(ScreenSize
                                                              .widthPlusHeight /
                                                          40)))),
                                      onPressed: () {
                                        postRequest(emailController.text,
                                            celularController.text, context);
                                      },
                                      child: Text(
                                        'Enviar',
                                        style: TextStyle(
                                            fontSize:
                                                ScreenSize.widthPlusHeight /
                                                    66.6),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    }
                    return const CircularProgressIndicator();
                  })))),
      drawer: const Menu(),
    );
  }
}
