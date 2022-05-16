import 'package:flutter/material.dart';
import 'screen_size.dart';
import 'menu.dart';
import 'card_anuncio.dart';

class Anuncios extends StatefulWidget {
  const Anuncios({Key? key}) : super(key: key);

  @override
  State<Anuncios> createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anúncios'),
      ),
      body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/backgroundLogin.jpg'),
                      fit: BoxFit.fill)),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: const <Widget>[
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '500,00',
                      imagePath: 'assets/images/casa1.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '550,00',
                      imagePath: 'assets/images/casa2.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '700,00',
                      imagePath: 'assets/images/casa3.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '1000,00',
                      imagePath: 'assets/images/casa4.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '1500,00',
                      imagePath: 'assets/images/casa5.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '3000,00',
                      imagePath: 'assets/images/casa6.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '2800,00',
                      imagePath: 'assets/images/casa7.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '2000,00',
                      imagePath: 'assets/images/casa8.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '1900,00',
                      imagePath: 'assets/images/casa9.jpg'),
                  CardAnuncio(
                      bairro: 'Centro',
                      mensalidade: '2100,00',
                      imagePath: 'assets/images/casa10.jpg'),
                ],
              ))),
      drawer: const Menu(),
    );
  }
}
