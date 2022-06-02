import 'package:flutter/material.dart';
import 'package:projeto01/anuncio_page.dart';
import 'screen_size.dart';
import 'listas_anuncio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'rest.dart';

Future<String> getDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

void abreDetalhes(Anuncio anuncio, BuildContext context) {
  Future<String> futureDirectory = getDirectory();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalhes',
            style: TextStyle(fontSize: ScreenSize.width / 24),
          ),
          content: SizedBox(
              width: ScreenSize.width / 1.107,
              height: ScreenSize.width / 1.107,
              child: Column(children: [
                Expanded(
                    flex: 8,
                    child: FutureBuilder<String>(
                      future: futureDirectory,
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Image.file(
                            File(
                                '${snapshot.data}/$folderName/${anuncio.titulo}.jpg'),
                            fit: BoxFit.cover,
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '\n Bairro: ' +
                            anuncio.bairro +
                            '\n Mensalidade: R\$ ' +
                            anuncio.valor,
                        style: (TextStyle(fontSize: ScreenSize.width / 28.8)),
                        textAlign: TextAlign.left,
                      ),
                    ))
              ])),
          actions: [
            TextButton(
              child: Text(
                'Mais detalhes',
                style: TextStyle(fontSize: ScreenSize.width / 32.72),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnuncioPage(anuncio: anuncio))),
            ),
            TextButton(
              child: Text(
                'Fechar',
                style: TextStyle(fontSize: ScreenSize.width / 32.72),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
}

class CardAnuncio extends StatefulWidget {
  final Anuncio anuncio;

  const CardAnuncio({Key? key, required this.anuncio}) : super(key: key);

  @override
  CardAnuncioState createState() => CardAnuncioState();
}

class CardAnuncioState extends State<CardAnuncio> {
  late Future<String> futureDirectory;

  @override
  void initState() {
    super.initState();
    futureDirectory = getDirectory();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
        padding: EdgeInsets.fromLTRB(
            ScreenSize.widthPlusHeight / 100,
            ScreenSize.widthPlusHeight / 200,
            ScreenSize.widthPlusHeight / 100,
            ScreenSize.widthPlusHeight / 200),
        height: ScreenSize.widthPlusHeight / 10,
        width: ScreenSize.widthPlusHeight / 10,
        child: GestureDetector(
          onTap: () => {abreDetalhes(widget.anuncio, context)},
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
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
                  Expanded(
                      flex: 2,
                      child: Text(
                        'R\$ ' + widget.anuncio.valor,
                        style: TextStyle(fontSize: ScreenSize.width / 24),
                      ))
                ],
              )),
        ));
  }
}

class MiniCardAnuncio extends StatefulWidget {
  final Anuncio anuncio;

  const MiniCardAnuncio({Key? key, required this.anuncio}) : super(key: key);

  @override
  MiniCardAnuncioState createState() => MiniCardAnuncioState();
}

class MiniCardAnuncioState extends State<MiniCardAnuncio> {
  late Future<String> futureDirectory;

  @override
  void initState() {
    super.initState();
    futureDirectory = getDirectory();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
        padding: EdgeInsets.fromLTRB(
            ScreenSize.widthPlusHeight / 100,
            ScreenSize.widthPlusHeight / 200,
            ScreenSize.widthPlusHeight / 100,
            ScreenSize.widthPlusHeight / 200),
        height: ScreenSize.widthPlusHeight / 10,
        width: ScreenSize.widthPlusHeight / 10,
        child: GestureDetector(
          onTap: () => {abreDetalhes(widget.anuncio, context)},
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
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
                  // Expanded(
                  //     flex: 2,
                  //     child: Text(
                  //       'R\$ ' + widget.anuncio.valor,
                  //       style: TextStyle(fontSize: ScreenSize.width / 24),
                  //     ))
                ],
              )),
        ));
  }
}
