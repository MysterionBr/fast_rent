// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'screen_size.dart';
import 'card_anuncio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class Anuncio {
  int id_anuncio;
  String titulo;
  String descricao;
  String valor;
  String metros;
  String tipo;
  String cep;
  String rua;
  String numero;
  String bairro;
  String celular;

  Anuncio(
      {this.id_anuncio = 0,
      this.titulo = '',
      this.descricao = '',
      this.valor = '',
      this.metros = '',
      this.tipo = 'Casa',
      this.cep = '',
      this.rua = '',
      this.numero = '',
      this.bairro = '',
      this.celular = ''});

  Anuncio.fromJson(Map json)
      : id_anuncio = json['id_anuncio'],
        titulo = json['titulo'],
        descricao = json['descricao'],
        valor = json['valor'],
        metros = json['metros'],
        tipo = json['tipo'],
        cep = json['cep'],
        rua = json['rua'],
        numero = json['numero'],
        bairro = json['bairro'],
        celular = json['celular'] ?? '';

  Map toJson() {
    return {
      'id_anuncio': id_anuncio,
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'metros': metros,
      'tipo': tipo,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'celular': celular
    };
  }
}

//const urlBase = "https://my-json-server.typicode.com/NatanaelTavares/imoveis";
const urlBase = "http://localhost:5000";

class ListaAnuncios extends StatefulWidget {
  const ListaAnuncios({Key? key}) : super(key: key);

  @override
  createState() => _ListaAnunciosState();
}

//Página anúncios
class _ListaAnunciosState extends State {
  var anuncios = <Anuncio>[];

  _getAnuncios() {
    API.getAnuncios("/anuncios").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        anuncios = list.map((model) => Anuncio.fromJson(model)).toList();
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getAnuncios();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: ScreenSize.widthPlusHeight / 4,
          crossAxisSpacing: ScreenSize.widthPlusHeight / 100,
          mainAxisSpacing: ScreenSize.widthPlusHeight / 100),
      itemCount: anuncios.length,
      itemBuilder: (context, index) {
        return CardAnuncio(anuncio: anuncios[index]);
      },
    );
  }
}

//Anúncios do usuário
class ListaMeusAnuncios extends StatefulWidget {
  const ListaMeusAnuncios({Key? key}) : super(key: key);

  @override
  createState() => _ListaMeusAnunciosState();
}

class _ListaMeusAnunciosState extends _ListaAnunciosState {
  @override
  _getAnuncios() {
    API.getAnuncios("/meusAnuncios").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        //print(response.body);
        anuncios = list.map((model) => Anuncio.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: anuncios.length,
          itemBuilder: (context, index) {
            return MiniCardAnuncio(anuncio: anuncios[index]);
          },
        ));
  }
}

//Anúncios marcados como 'favorito'
class ListaAnunciosFavoritos extends StatefulWidget {
  const ListaAnunciosFavoritos({Key? key}) : super(key: key);

  @override
  createState() => _ListaAnunciosFavoritosState();
}

class _ListaAnunciosFavoritosState extends _ListaMeusAnunciosState {
  @override
  _getAnuncios() {
    API.getAnuncios("/meusFavoritos").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        anuncios = list.map((model) => Anuncio.fromJson(model)).toList();
      });
    });
  }
}

class API {
  static Future getAnuncios(String endpoint) {
    var url = urlBase + endpoint;
    return http.get(Uri.parse(url));
  }
}
