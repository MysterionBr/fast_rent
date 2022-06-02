import 'package:flutter/material.dart';
import 'screen_size.dart';
import 'package:http/http.dart' as http;
import 'rest.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  late Future<http.Response> response;

  @override
  void initState() {
    super.initState();
    response = getLogin();
  }

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
        FutureBuilder<http.Response>(
            future: response,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.body == 'null') {
                  return ListTile(
                      leading: const Icon(Icons.now_widgets_outlined),
                      title: Text(
                        "Anunciar",
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 80,
                            color: const Color.fromARGB(255, 170, 170, 170)),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {});
                } else {
                  return ListTile(
                      leading: const Icon(Icons.now_widgets_outlined),
                      title: Text("Anunciar",
                          style: TextStyle(
                              fontSize: ScreenSize.widthPlusHeight / 80)),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.of(context).pushNamed('/cadastroAnuncio');
                      });
                }
              }
              return const CircularProgressIndicator();
            }),
        SizedBox(height: ScreenSize.widthPlusHeight / 100),
        FutureBuilder<http.Response>(
            future: response,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.body == 'null') {
                  return ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(
                        "Meu perfil",
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 80,
                            color: const Color.fromARGB(255, 170, 170, 170)),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {});
                } else {
                  return ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text("Meu perfil",
                          style: TextStyle(
                              fontSize: ScreenSize.widthPlusHeight / 80)),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.of(context).pushNamed('/user');
                      });
                }
              }
              return const CircularProgressIndicator();
            }),
      ],
    ));
  }
}
