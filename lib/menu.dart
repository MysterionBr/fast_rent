import 'package:flutter/material.dart';
import 'screen_size.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init;
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('Fast Rent',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenSize.widthPlusHeight / 66.6,
                  fontStyle: FontStyle.italic,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 5.0),
                      blurRadius: 6.0,
                      color: Colors.black,
                    )
                  ])),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/menuImage.jpg'))),
        ),
        ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              "Menu",
              style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/');
              //debugPrint('toquei no drawer');
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        ListTile(
            leading: const Icon(Icons.home_work_rounded),
            title: Text("Ver Imóveis",
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/anuncios');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        ListTile(
            leading: const Icon(Icons.interests_outlined),
            title: Text("Sobre",
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/sobre');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        ListTile(
            leading: const Icon(Icons.email_rounded),
            title: Text("Contato",
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/contato');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        ListTile(
            leading: const Icon(Icons.work),
            title: Text("Pacotes",
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/planos');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        ListTile(
            leading: const Icon(Icons.now_widgets_outlined),
            title: Text("Anunciar",
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/cadastroAnuncio');
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text("Meu perfil",
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/user');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            })
      ],
    ));
  }
}
