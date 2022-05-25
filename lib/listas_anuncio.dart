import 'package:flutter/material.dart';
import 'screen_size.dart';
import 'menu.dart';
import 'card_anuncio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'listas_anuncio.dart';
import 'dart:convert';

class Anuncio {
  String bairro;
  String mensalidade;
  String imagem;
  Anuncio({this.bairro = '', this.mensalidade = '', this.imagem = ''});

  Anuncio.fromJson(Map json)
      : bairro = json['bairro'],
        mensalidade = json['mensalidade'],
        imagem = json['imagem'];
  Map toJson() {
    return {'bairro': bairro, 'mensalidade': mensalidade, 'imagem': imagem};
  }
}

const urlBase = "https://my-json-server.typicode.com/NatanaelTavares/imoveis";

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
    API.getAnuncios("/anuncios").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        anuncios = list.map((model) => Anuncio.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: anuncios.length,
      itemBuilder: (context, index) {
        return CardAnuncio(anuncio: anuncios[index]);
      },
    );
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
    API.getAnuncios("/favoritos").then((response) {
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
