import 'package:flutter/material.dart';

class ScreenSize {
  static double width = 0;
  static double height = 0;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

class Detalhes {
  void abreDetalhes(String endereco, String bairro, String mensalidade,
      String imagePath, BuildContext context) {
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
                      flex: 8, child: Image.asset(imagePath, fit: BoxFit.fill)),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          '\n Endereço: ' +
                              endereco +
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
                  'Contatar Anunciante',
                  style: TextStyle(fontSize: ScreenSize.width / 32.72),
                ),
                onPressed: () => Navigator.pop(context),
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
}

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
                      image: AssetImage('assets/images/backgroundAnuncios.jpg'),
                      fit: BoxFit.fill)),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 999', 'Centro',
                          '500,00', 'assets/images/casa1.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa1.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 500,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 998', 'Centro',
                          '800,00', 'assets/images/casa2.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa2.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 800,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 997', 'Centro',
                          '1200,00', 'assets/images/casa3.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa3.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 1200,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 996', 'Centro',
                          '2000,00', 'assets/images/casa4.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa4.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 2000,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 995', 'Centro',
                          '3000,00', 'assets/images/casa5.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa5.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 3000,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 994', 'Centro',
                          '5000,00', 'assets/images/casa6.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa6.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 5000,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 993', 'Centro',
                          '7000,00', 'assets/images/casa7.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa7.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 7000,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 992', 'Centro',
                          '5000,00', 'assets/images/casa8.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa8.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 5000,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 991', 'Centro',
                          '4500,00', 'assets/images/casa9.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa9.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 4500,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Detalhes().abreDetalhes('Avenida Exemplo, 990', 'Centro',
                          '4600,00', 'assets/images/casa10.jpg', context)
                    },
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Image.asset('assets/images/casa10.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'R\$ 4600,00',
                                  style: TextStyle(
                                      fontSize: ScreenSize.width / 24),
                                ))
                          ],
                        )),
                  ),
                ],
              ))),
    );
  }
}
