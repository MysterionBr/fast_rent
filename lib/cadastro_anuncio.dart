import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';

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
      body: Center(
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
                'Faça o cadastro de seus anúncios',
                style: TextStyle(
                  fontFamily: 'Mermaid1001',
                  fontSize: ScreenSize.widthPlusHeight / 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 20,
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Título',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100,
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 9,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.attach_money,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Valor',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100,
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  maxLength: 20,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.map_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Bairro',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100,
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.draw_rounded,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'm²',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100,
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.edit_note,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.widthPlusHeight / 40),
                    ),
                    labelText: 'Descrição',
                  ),
                ),
              ),
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
                      title: const Text('Casa'),
                      subtitle: const Text('Escolha uma opçao'),
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
                      title: const Text('Apartamento'),
                      subtitle: const Text('Escolha uma opçao'),
                      value: 2,
                      groupValue: selecionado,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                        selecaoradio(val);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 100,
                          ScreenSize.widthPlusHeight / 40,
                          ScreenSize.widthPlusHeight / 100),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Selecionar imagens'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100,
                    ScreenSize.widthPlusHeight / 40,
                    ScreenSize.widthPlusHeight / 100),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: ScreenSize.widthPlusHeight / 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
      drawer: const Menu(),
    );
  }
}
