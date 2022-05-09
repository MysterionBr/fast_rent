import 'package:flutter/material.dart';
import 'dart:math';

class ScreenSize {
  static double width = 0;
  static double height = 0;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

class NumeroAleatorio {
  static int random = 0;

  void init() {
    random = Random().nextInt(14);
  }
}

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    NumeroAleatorio().init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/backgroundSobre.jpg'),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize.width / 1.6,
                  ),
                  Text(
                    'Fast Rent',
                    style: TextStyle(
                        fontSize: ScreenSize.width / 14,
                        color: Colors.white,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 5.0),
                            blurRadius: 6.0,
                            color: Colors.black,
                          )
                        ]),
                  ),
                  Text(
                    'Versão 0.0.1',
                    style: TextStyle(
                      fontSize: ScreenSize.width / 38,
                      color: const Color.fromARGB(255, 150, 150, 150),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenSize.width / 14.4),
                    child: Text(
                      'Há ' +
                          NumeroAleatorio.random.toString() +
                          ' ano(s) a FastRent surgiu graças a um trabalho de faculdade do professor Gibão e atendendo à nescessidade de quem procura um cantinho para chamar de seu. Dessa forma conseguimos agregar todos os locais disponíveis tornando rápido e fácil a maneira de adquirir o seu imóvel. Com sede na cidade de Uberlândia-MG, a FastRent busca abranger o alcance de todos.\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: ScreenSize.width / 30,
                          color: Colors.white,
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 5.0),
                              blurRadius: 6.0,
                              color: Colors.black,
                            )
                          ]),
                    ),
                  ),
                  Text(
                    (2022 - NumeroAleatorio.random).toString() +
                        '-2022 FastRent Inc.',
                    style: TextStyle(
                        fontSize: ScreenSize.width / 36,
                        color: const Color.fromARGB(255, 200, 200, 200)),
                  )
                ],
              ))),
    );
  }
}
