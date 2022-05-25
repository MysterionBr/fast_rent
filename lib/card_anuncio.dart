import 'package:flutter/material.dart';
import 'package:projeto01/anuncio_page.dart';
import 'screen_size.dart';
import 'listas_anuncio.dart';

void abreDetalhes(Anuncio anuncio, BuildContext context) {
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
                    child: Image.asset(anuncio.imagem, fit: BoxFit.cover)),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '\n Bairro: ' +
                            anuncio.bairro +
                            '\n Mensalidade: R\$ ' +
                            anuncio.mensalidade,
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

class CardAnuncio extends StatelessWidget {
  final Anuncio anuncio;

  const CardAnuncio({Key? key, required this.anuncio}) : super(key: key);

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
          onTap: () => {abreDetalhes(anuncio, context)},
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Image.asset(anuncio.imagem, fit: BoxFit.cover),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'R\$ ' + anuncio.mensalidade,
                        style: TextStyle(fontSize: ScreenSize.width / 24),
                      ))
                ],
              )),
        ));
  }
}
