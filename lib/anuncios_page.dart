import 'package:flutter/material.dart';
import 'screen_size.dart';
import 'menu.dart';
import 'card_anuncio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'listas_anuncio.dart';
import 'dart:convert';

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
                      fit: BoxFit.cover)),
              child: const ListaAnuncios())),
      drawer: const Menu(),
    );
  }
}
