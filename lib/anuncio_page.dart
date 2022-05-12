//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'menu.dart';
import 'screen_size.dart';

class AnuncioPage extends StatefulWidget {
  const AnuncioPage({Key? key}) : super(key: key);

  @override
  AnuncioPageState createState() => AnuncioPageState();
}

class AnuncioPageState extends State<AnuncioPage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundUsuario.jpg'),
                fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 50),
                width: ScreenSize.width / 1.107,
                height: ScreenSize.width / 1.107,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/casa7.jpg'),
                          fit: BoxFit.cover)),
                  child: IconButton(
                    alignment: const Alignment(1.0, 1.0),
                    icon: const Icon(Icons.favorite_border),
                    iconSize: ScreenSize.widthPlusHeight / 44.4,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                )),
            //Título
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  ScreenSize.widthPlusHeight / 200, 0),
              child: Text(
                'Casa no Centro da Cidade',
                style: TextStyle(
                    fontSize: ScreenSize.widthPlusHeight / 57,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Bairro
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  0, ScreenSize.widthPlusHeight / 100),
              child: Text(
                'Centro',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 100),
              ),
            ),
            //Mensalidade
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  0, ScreenSize.widthPlusHeight / 100),
              child: Text(
                'R\$ 500,00',
                style: TextStyle(
                    fontSize: ScreenSize.widthPlusHeight / 57,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Tipo (casa ou apartamento) e metragem
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 50,
                  0,
                  ScreenSize.widthPlusHeight / 200,
                  ScreenSize.widthPlusHeight / 100),
              child: Row(children: [
                Text(
                  'Casa',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
                ),
                SizedBox(
                  width: ScreenSize.widthPlusHeight / 66.6,
                ),
                Text(
                  '70m²',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
                ),
              ]),
            ),
            //Descrição da casa
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  0, ScreenSize.widthPlusHeight / 50),
              child: Text(
                'Casa em bom estado com sala de estar, sala de jantar, cozinha, três banheiros, quatro quartos, garagem, área de lazer, piscina, móveis embutidos',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
              ),
            ),
            //Botão 'Contatar Anunciante'
            Container(
              height: ScreenSize.widthPlusHeight / 22.2,
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 10,
                  ScreenSize.widthPlusHeight / 90,
                  ScreenSize.widthPlusHeight / 10,
                  0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                ScreenSize.widthPlusHeight / 40)))),
                child: Text(
                  'Contatar Anunciante',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      //drawer: const Menu(),
    );
  }
}
