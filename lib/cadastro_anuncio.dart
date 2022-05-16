import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';
import 'campo_texto.dart';

class CadastroAnuncios extends StatefulWidget {
  const CadastroAnuncios({Key? key}) : super(key: key);

  @override
  State<CadastroAnuncios> createState() => _CadastroAnunciosState();
}

class _CadastroAnunciosState extends State<CadastroAnuncios> {
  late int selecionado;
  @override
  void initState() {
    super.initState();
    selecionado = 0;
  }

  selecaoradio(val) {
    setState(() {
      selecionado = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Anúncios'),
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgroundLogin.jpg'),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(
                          0, ScreenSize.widthPlusHeight / 40, 0, 10),
                      child: Center(
                        child: Image.asset(
                          'assets/images/casa-limpa.png',
                          width: ScreenSize.widthPlusHeight / 12,
                          height: ScreenSize.widthPlusHeight / 12,
                        ),
                      )),
                  SizedBox(height: ScreenSize.widthPlusHeight / 100),
                  Text(
                    'Faça o cadastro de seu anúncio',
                    style: TextStyle(
                      fontFamily: 'Mermaid1001',
                      fontSize: ScreenSize.widthPlusHeight / 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),

                  //Campo de texto 'título'
                  const CampoTexto(label: 'Título*', icon: Icon(Icons.title)),
                  //Campo de texto 'valor'
                  const CampoTexto(
                      label: 'Valor*', icon: Icon(Icons.attach_money)),
                  //Campo de texto 'bairro'
                  const CampoTexto(
                      label: 'Bairro*', icon: Icon(Icons.map_outlined)),
                  //Campo de texto 'm²'
                  const CampoTexto(
                      label: 'm²*', icon: Icon(Icons.draw_rounded)),
                  //Campo de texto 'descrição'
                  const CampoTexto(
                      label: 'Descrição*', icon: Icon(Icons.edit_note)),

                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 40,
                        ScreenSize.widthPlusHeight / 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RadioListTile(
                          title: Text('Casa',
                              style: TextStyle(
                                  fontSize: ScreenSize.widthPlusHeight / 66.6)),
                          subtitle: Text(
                            'Escolha uma opçao',
                            style: TextStyle(
                                fontSize: ScreenSize.widthPlusHeight / 100),
                          ),
                          value: 1,
                          groupValue: selecionado,
                          activeColor: Colors.blue,
                          onChanged: (val) {
                            print("Radio $val");
                            selecaoradio(val);
                          },
                        ),
                        const Divider(
                          height: 10,
                          color: Colors.red,
                        ),
                        RadioListTile(
                          title: Text('Apartamento',
                              style: TextStyle(
                                  fontSize: ScreenSize.widthPlusHeight / 66.6)),
                          subtitle: Text('Escolha uma opçao',
                              style: TextStyle(
                                  fontSize: ScreenSize.widthPlusHeight / 100)),
                          value: 2,
                          groupValue: selecionado,
                          activeColor: Colors.green,
                          onChanged: (val) {
                            print("Radio $val");
                            selecaoradio(val);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: ScreenSize.widthPlusHeight / 15,
                        padding:
                            EdgeInsets.all(ScreenSize.widthPlusHeight / 66.6),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          ScreenSize.widthPlusHeight / 40)))),
                          onPressed: () {},
                          child: Text(
                            'Selecionar imagem',
                            style: TextStyle(
                                fontSize: ScreenSize.widthPlusHeight / 66.6),
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenSize.widthPlusHeight / 15,
                        padding:
                            EdgeInsets.all(ScreenSize.widthPlusHeight / 66.6),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          ScreenSize.widthPlusHeight / 40)))),
                          onPressed: () {},
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                                fontSize: ScreenSize.widthPlusHeight / 66.6),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
      drawer: const Menu(),
    );
  }
}
