//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto01/listas_anuncio.dart';
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
              child: const ListaMeusAnuncios(),
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
              child: const ListaAnunciosFavoritos(),
            )),
          ],
        ),
      )),
      drawer: const Menu(),
    );
  }
}
