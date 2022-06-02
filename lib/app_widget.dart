import 'package:flutter/material.dart';
import 'package:projeto01/home_page.dart';
import 'package:projeto01/login_page.dart';
import 'package:projeto01/contato_page.dart';
import 'package:projeto01/planos.dart';
import 'package:projeto01/cadastro.dart';
import 'package:projeto01/cadastro_anuncio.dart';
import 'package:projeto01/sobre_page.dart';
import 'package:projeto01/anuncios_page.dart';
import 'package:projeto01/usuario_page.dart';
import 'package:projeto01/edita_usuario.dart';
import 'package:desktop_window/desktop_window.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DesktopWindow.setWindowSize(const Size(405, 720));
    DesktopWindow.setMinWindowSize(const Size(405, 720));
    DesktopWindow.setMaxWindowSize(const Size(405, 720));
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/contato': (context) => ContatoWidget(),
        '/planos': (context) => const Plans(),
        '/cadastro': (context) => const Cadastro(),
        '/cadastroAnuncio': (context) => const CadastroAnuncios(),
        '/sobre': (context) => const Sobre(),
        '/anuncios': (context) => const Anuncios(),
        '/user': (context) => const UserPage(),
        '/attuser': (context) => const EditUser(),
      },
    );
  }
}
