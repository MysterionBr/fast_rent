import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Text('Fast Rent',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontStyle: FontStyle.italic)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/menuImage.jpg'))),
        ),
        ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Menu"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/');
              //debugPrint('toquei no drawer');
            }),
        ListTile(
            leading: const Icon(Icons.home_work_rounded),
            title: const Text("Ver Imóveis"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        ListTile(
            leading: const Icon(Icons.now_widgets_outlined),
            title: const Text("Meus Anúncios"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        ListTile(
            leading: const Icon(Icons.interests_outlined),
            title: const Text("Sobre"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/sobre');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        ListTile(
            leading: const Icon(Icons.email_rounded),
            title: const Text("Contato"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/contato');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        ListTile(
            leading: const Icon(Icons.work),
            title: const Text("Pacotes"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/planos');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            }),
        ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Meu perfil"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
              //debugPrint('toquei no drawer');
              //Navigator.pop(context);
            })
      ],
    ));
  }
}
