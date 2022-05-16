//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'screen_size.dart';
import 'card_anuncio.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
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
        child: Column(
          children: [
            //Ícone e texto
            Container(
                padding: EdgeInsets.fromLTRB(
                    0, ScreenSize.widthPlusHeight / 15, 0, 0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/avatar.png'),
                    radius: ScreenSize.widthPlusHeight / 22.2,
                  ),
                )),
            SizedBox(height: ScreenSize.widthPlusHeight / 100),
            Text(
              'Usuário',
              style: TextStyle(
                fontSize: ScreenSize.widthPlusHeight / 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            //Texto 'Meus Anúncios'
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenSize.widthPlusHeight / 15, 0, 0),
              child: Text(
                'Meus Anúncios',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              height: ScreenSize.widthPlusHeight / 8,
              child: ListView(
                scrollDirection: Axis.horizontal,
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
                ],
              ),
            )),
            //Texto 'Anúncios Favoritos'
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenSize.widthPlusHeight / 25, 0, 0),
              child: Text(
                'Anúncios Favoritos',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              height: ScreenSize.widthPlusHeight / 8,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
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
              ),
            )),
          ],
        ),
      )),
      drawer: const Menu(),
    );
  }
}
