import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';
import 'rest.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<http.Response> postRequest(
    String titulo,
    String descricao,
    String valor,
    String metros,
    String tipo,
    String cep,
    String rua,
    String numero,
    String bairro,
    String imagem,
    BuildContext context) async {
  String url = BackEnd().address;

  Map dados = {
    'Titulo': titulo,
    'Descricao': descricao,
    'Valor': valor,
    'Metros': metros,
    'Tipo': 'Casa',
    'Cep': cep,
    'Rua': rua,
    'Numero': numero,
    'Bairro': bairro,
    'Imagem': imagem,
  };
  var body = json.encode(dados);

  salvaImagem(titulo);
  //remover depois
  print(body);

  var response = await http.post(Uri.parse(url + '/addAnuncio'),
      headers: {"Content-Type": "application/json"}, body: body);
  print(response.statusCode);
  print(response.body);

  if (response.body == '"Sucesso"') {
    respostaBack('Cadastro realizado com sucesso!', 'anuncios', context);
  } else {
    respostaBack(
        'Não foi possível realizar o cadastro', 'cadastroAnuncio', context);
  }

  return response;
}

class CadastroAnuncios extends StatefulWidget {
  const CadastroAnuncios({Key? key}) : super(key: key);

  @override
  State<CadastroAnuncios> createState() => _CadastroAnunciosState();
}

dynamic arquivoImagem;

void escolheImagem() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    arquivoImagem = File(result.files.single.path.toString());
  } else {
    // User canceled the picker
  }
}

void salvaImagem(String titulo) async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  //String folderName = "FastRent";
  Directory path = Directory(documentDirectory.path + '/$folderName');
  if ((await path.exists())) {
    await arquivoImagem
        .copy(documentDirectory.path + '/$folderName/$titulo.jpg');
  } else {
    path.create();
    await arquivoImagem
        .copy(documentDirectory.path + '/$folderName/$titulo.jpg');
  }
}

class _CadastroAnunciosState extends State<CadastroAnuncios> {
  late int selecionado;
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  final bairroController = TextEditingController();
  final metragemController = TextEditingController();
  final descricaoController = TextEditingController();
  final ruaController = TextEditingController();
  final numeroController = TextEditingController();
  final cepController = TextEditingController();
  final tipoController = TextEditingController();

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
          padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 40),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgroundLogin.jpg'),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: ScreenSize.widthPlusHeight / 20),
                  Center(
                    child: Image.asset(
                      'assets/images/casa-limpa.png',
                      width: ScreenSize.widthPlusHeight / 12,
                      height: ScreenSize.widthPlusHeight / 12,
                    ),
                  ),
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
                  TextField(
                    controller: tituloController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.title,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Título*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'valor'
                  TextField(
                    controller: valorController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Valor*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'rua'
                  TextField(
                    controller: ruaController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.edit_road,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Rua*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'numero'
                  TextField(
                    controller: numeroController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.numbers,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Número*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'bairro'
                  TextField(
                    controller: bairroController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.map_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Bairro*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'cep'
                  TextField(
                    controller: cepController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.location_city,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'CEP*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'm²'
                  TextField(
                    controller: metragemController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.draw_rounded,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'm²*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //Campo de texto 'descrição'
                  TextField(
                    controller: descricaoController,
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.edit_note,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ScreenSize.widthPlusHeight / 40),
                      ),
                      labelText: 'Descrição*',
                    ),
                  ),
                  SizedBox(height: ScreenSize.widthPlusHeight / 50),
                  //casa ou apartamento
                  Container(
                    padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 100),
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
                          onPressed: () {
                            escolheImagem();
                          },
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
                          onPressed: () {
                            postRequest(
                                tituloController.text,
                                descricaoController.text,
                                valorController.text,
                                metragemController.text,
                                tipoController.text,
                                cepController.text,
                                ruaController.text,
                                numeroController.text,
                                bairroController.text,
                                '$folderName/' + tituloController.text + '.jpg',
                                context);
                          },
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
