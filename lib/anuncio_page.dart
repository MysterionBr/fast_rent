import 'package:flutter/material.dart';
import 'package:projeto01/rest.dart';
import 'screen_size.dart';
import 'listas_anuncio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

//Trocar o número por uma variável
launchWhatsApp() async {
  const link = WhatsAppUnilink(
    phoneNumber: '5534997815761',
    text: "Vi seu anúncio no Fast Rent, estou interessado",
  );
  await launchUrl(Uri.parse('$link'));
}

Future<String> getDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

class AnuncioPage extends StatefulWidget {
  final Anuncio anuncio;

  const AnuncioPage({Key? key, required this.anuncio}) : super(key: key);
  //const AnuncioPage({super.key, required this.anuncio});

  @override
  AnuncioPageState createState() => AnuncioPageState();
}

class AnuncioPageState extends State<AnuncioPage> {
  late Future<String> futureDirectory;

  @override
  void initState() {
    super.initState();
    futureDirectory = getDirectory();
  }

  @override
  Widget build(BuildContext context) {
    getDirectory();

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
            Padding(
              padding: EdgeInsets.fromLTRB(ScreenSize.widthPlusHeight / 50, 0,
                  ScreenSize.widthPlusHeight / 200, 0),
              child: Text(
                widget.anuncio.titulo,
                style: TextStyle(
                    fontSize: ScreenSize.widthPlusHeight / 57,
                    fontWeight: FontWeight.bold),
              ),
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
                onPressed: () => {launchWhatsApp()},
              ),
            ),
          ],
        ),
      ),
      //drawer: const Menu(),
    );
  }
}
