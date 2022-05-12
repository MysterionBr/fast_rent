import 'package:flutter/material.dart';
import 'menu.dart';
import 'screen_size.dart';

class CadastroAnuncio extends StatefulWidget {
  const CadastroAnuncio({Key? key}) : super(key: key);

  @override
  State<CadastroAnuncio> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<CadastroAnuncio> {
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
          title: const Text('Cadastrar Anúncio'),
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
                  //Texto 'Digite os dados do imóvel'
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 20,
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 100),
                      child: Text(
                        'Digite os dados do imóvel',
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 66.6),
                      )),
                  //Campo de texto 'Título'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100),
                    child: TextField(
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Título*',
                      ),
                    ),
                  ),
                  //Campo de texto 'Preço'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100),
                    child: TextField(
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Preço*',
                      ),
                    ),
                  ),
                  //Campo de texto 'Bairro'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100),
                    child: TextField(
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Bairro*',
                      ),
                    ),
                  ),
                  //Campo de texto 'Metragem'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100),
                    child: TextField(
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      controller: cpfController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Metragem*',
                      ),
                    ),
                  ),
                  //Campo de texto 'Descrição'
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100),
                    child: TextField(
                      style: TextStyle(
                          fontSize: ScreenSize.widthPlusHeight / 66.6),
                      controller: celularController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              ScreenSize.widthPlusHeight / 40),
                        ),
                        labelText: 'Descrição*',
                      ),
                    ),
                  ),
                  //Casa ou apartamento
                  Container(
                      padding: EdgeInsets.fromLTRB(
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 100,
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 100),
                      child: DropdownButton<String>(
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 66.6,
                            color: Colors.black),
                        onChanged: ((value) => ''),
                        value: 'Casa',
                        items: <String>['Casa', 'Apartamento']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
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
                        'Anunciar',
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
