import 'package:flutter/material.dart';
import 'screen_size.dart';

void abreDetalhes(
    String bairro, String mensalidade, String imagePath, BuildContext context) {
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
                    flex: 8, child: Image.asset(imagePath, fit: BoxFit.cover)),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '\n Bairro: ' +
                            bairro +
                            '\n Mensalidade: R\$ ' +
                            mensalidade,
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
              onPressed: () => Navigator.of(context).pushNamed('/anuncio'),
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
  final String bairro, mensalidade, imagePath;

  const CardAnuncio(
      {Key? key,
      required this.bairro,
      required this.mensalidade,
      required this.imagePath})
      : super(key: key);

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
          onTap: () => {abreDetalhes(bairro, mensalidade, imagePath, context)},
          child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'R\$ ' + mensalidade,
                        style: TextStyle(fontSize: ScreenSize.width / 24),
                      ))
                ],
              )),
        ));
  }
}
