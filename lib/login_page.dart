import 'package:flutter/material.dart';
import 'menu.dart';
import 'screen_size.dart';
import 'campo_texto.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
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
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Mermaid1001',
                      fontSize: ScreenSize.widthPlusHeight / 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  //Texto 'digite seus dados abaixo'
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
                  //Campo de texto 'Nome'
                  const CampoTexto(
                      label: 'Nome*', icon: Icon(Icons.account_circle)),
                  //Campo de texto 'Senha'
                  const CampoTexto(label: 'Senha*', icon: Icon(Icons.lock)),
                  //Botão 'entrar'
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
                        'Entrar',
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 66.6),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  //Texto com link para a página 'cadastro'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, ScreenSize.widthPlusHeight / 100, 0, 0),
                    child: Row(
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
                  )
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
