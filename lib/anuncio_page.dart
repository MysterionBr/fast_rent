import 'package:flutter/material.dart';
import 'package:projeto01/rest.dart';
import 'screen_size.dart';
import 'listas_anuncio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

launchWhatsApp(String celular) async {
  var link = WhatsAppUnilink(
    phoneNumber: celular,
    text: "Vi seu anúncio no Fast Rent, estou interessado",
  );
  await launchUrl(Uri.parse('$link'));
}

Future<http.Response> getFavorito(Anuncio anuncio) async {
  String url = BackEnd().address;
  Map dados = {
    'id_anuncio': anuncio.id_anuncio,
  };
  var body = json.encode(dados);
  var response = await http.post(Uri.parse(url + '/verificaFavoritos'),
      headers: {"Content-Type": "application/json"}, body: body);

  return response;
}

Future<http.Response> addFavorito(Anuncio anuncio, BuildContext context) async {
  String url = BackEnd().address;
  Map dados = {
    'id_anuncio': anuncio.id_anuncio,
  };
  var body = json.encode(dados);
  var response = await http.post(Uri.parse(url + '/addFavoritos'),
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.body == '"Sucesso"') {
    respostaFavorito('Anúncio adicionado aos favoritos!', anuncio, context);
  } else {
    respostaFavorito(
        'Não foi possível adicionar o anúncio aos favoritos', anuncio, context);
  }
  return response;
}

Future<http.Response> removeFavorito(
    Anuncio anuncio, BuildContext context) async {
  String url = BackEnd().address;
  Map dados = {
    'id_anuncio': anuncio.id_anuncio,
  };
  var body = json.encode(dados);
  var response = await http.post(Uri.parse(url + '/delFavoritos'),
      headers: {"Content-Type": "application/json"}, body: body);

  if (response.body == '"Sucesso"') {
    respostaFavorito('Favorito removido com sucesso!', anuncio, context);
  } else {
    respostaFavorito(
        'Não foi possível remover o anúncio dos favoritos', anuncio, context);
  }

  return response;
}

void respostaFavorito(String texto, Anuncio anuncio, BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Mensagem',
            style: TextStyle(fontSize: ScreenSize.width / 24),
          ),
          content: Text(
            texto,
            style: (TextStyle(fontSize: ScreenSize.width / 28.8)),
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: ScreenSize.width / 32.72),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnuncioPage(anuncio: anuncio)));
                }),
          ],
        );
      });
}

Future<String> getDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

class AnuncioPage extends StatefulWidget {
  final Anuncio anuncio;

  const AnuncioPage({Key? key, required this.anuncio}) : super(key: key);

  @override
  AnuncioPageState createState() => AnuncioPageState();
}

class AnuncioPageState extends State<AnuncioPage> {
  late Future<String> futureDirectory;
  late Future<http.Response> response;

  @override
  void initState() {
    super.initState();
    futureDirectory = getDirectory();
    response = getFavorito(widget.anuncio);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroundLogin.jpg"),
                fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 50),
                width: ScreenSize.width / 1.107,
                height: ScreenSize.width / 1.107,
                child: FutureBuilder<String>(
                  future: futureDirectory,
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Image.file(
                        File(
                            '${snapshot.data}/$folderName/${widget.anuncio.titulo}.jpg'),
                        fit: BoxFit.cover,
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                )),
            //Título
            Row(
              children: [
                Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          ScreenSize.widthPlusHeight / 50,
                          0,
                          ScreenSize.widthPlusHeight / 200,
                          0),
                      child: Text(
                        widget.anuncio.titulo,
                        style: TextStyle(
                            fontSize: ScreenSize.widthPlusHeight / 57,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: FutureBuilder<http.Response>(
                      future: response,
                      builder:
                          (context, AsyncSnapshot<http.Response> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.body == 'null') {
                            return IconButton(
                              iconSize: ScreenSize.widthPlusHeight / 35,
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  addFavorito(widget.anuncio, context),
                            );
                          } else if (snapshot.data!.body == '"Sucesso"') {
                            return IconButton(
                              iconSize: ScreenSize.widthPlusHeight / 35,
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  removeFavorito(widget.anuncio, context),
                            );
                          } else {
                            return const SizedBox(
                              height: 1,
                              width: 1,
                            );
                          }
                        }
                        return const CircularProgressIndicator();
                      },
                    ))
              ],
            ),

            //Bairro
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  0, ScreenSize.widthPlusHeight / 100),
              child: Text(
                widget.anuncio.bairro,
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 100),
              ),
            ),
            //Mensalidade
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  0, ScreenSize.widthPlusHeight / 100),
              child: Text(
                'R\$ ' + widget.anuncio.valor,
                style: TextStyle(
                    fontSize: ScreenSize.widthPlusHeight / 57,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Tipo (casa ou apartamento) e metragem
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 50,
                  0,
                  ScreenSize.widthPlusHeight / 200,
                  ScreenSize.widthPlusHeight / 100),
              child: Row(children: [
                Text(
                  widget.anuncio.tipo,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
                ),
                SizedBox(
                  width: ScreenSize.widthPlusHeight / 66.6,
                ),
                Text(
                  '${widget.anuncio.metros}m²',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
                ),
              ]),
            ),
            //Descrição da casa
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  0, ScreenSize.widthPlusHeight / 50),
              child: Text(
                widget.anuncio.descricao,
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 80),
              ),
            ),
            //Botão 'Contatar Anunciante'
            Container(
              height: ScreenSize.widthPlusHeight / 22.2,
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 10,
                  ScreenSize.widthPlusHeight / 90,
                  ScreenSize.widthPlusHeight / 10,
                  0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                ScreenSize.widthPlusHeight / 40)))),
                child: Text(
                  'Contato',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                ),
                onPressed: () => {launchWhatsApp(widget.anuncio.celular)},
              ),
            ),
          ],
        ),
      ),
      //drawer: const Menu(),
    );
  }
}
