import 'package:flutter/material.dart';
import 'menu.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_sobre.jpeg'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Text(
              'Há 16 anos a FastRent surgiu graças a um trabalho de faculdade do professor Gibão e atendendo à nescessidade de quem procura um cantinho para chamar de seu. Dessa forma conseguimos agregar todos os locais disponíveis tornando rápido e fácil a maneira de adquirir o seu imóvel. Com sede na cidade de Uberlândia-MG, a FastRent busca abranger o alcance de todos.',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                fontFamily: 'FredokaOne',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: const Menu(),
    );
  }
}
