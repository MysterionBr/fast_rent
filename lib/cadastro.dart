import 'package:flutter/material.dart';
import 'menu.dart';
import 'campo_texto.dart';
import 'screen_size.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Cadastro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
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
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgroundLogin.jpg'),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Ícone e texto
                  Container(
                      padding: EdgeInsets.fromLTRB(
                          0, ScreenSize.widthPlusHeight / 40, 0, 0),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage("assets/images/avatar.png"),
                          radius: ScreenSize.widthPlusHeight / 33.3,
                        ),
                      )),
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
                  //Texto 'Digite seu dados abaixo'
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 20,
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 100),
                      child: Text(
                        'Digite seus dados abaixo',
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 66.6),
                      )),
                  //Campo de texto 'email'
                  const CampoTexto(label: 'Email*', icon: Icon(Icons.email)),
                  //Campo de texto 'senha'
                  const CampoTexto(label: 'Senha*', icon: Icon(Icons.lock)),
                  //Campo de texto 'nome'
                  const CampoTexto(
                      label: 'Nome*', icon: Icon(Icons.account_circle)),
                  //Campo de texto 'cpf'
                  const CampoTexto(
                      label: 'CPF*', icon: Icon(Icons.account_box_rounded)),
                  //Campo de texto 'celular'
                  const CampoTexto(label: 'Celular*', icon: Icon(Icons.call)),
                  //Botão 'cadastrar'
                  Container(
                    height: ScreenSize.widthPlusHeight / 22.2,
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 10,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 10,
                        0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          ScreenSize.widthPlusHeight / 40)))),
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 66.6),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  //Texto com link para a página 'login'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, ScreenSize.widthPlusHeight / 100, 0, 0),
                    child: Row(
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
                  )
                ],
              )
            ],
          ),
        )),
        drawer: const Menu());
  }
}
