import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';

class ContatoWidget extends StatelessWidget {
  const ContatoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fale Conosco'),
      ),
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundLogin.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            //Ícone e texto
            Container(
                padding: EdgeInsets.fromLTRB(
                    0, ScreenSize.widthPlusHeight / 40, 0, 0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage("assets/images/email.png"),
                    radius: ScreenSize.widthPlusHeight / 33.3,
                  ),
                )),
            SizedBox(height: ScreenSize.widthPlusHeight / 100),
            Text(
              'Contato',
              style: TextStyle(
                fontFamily: 'Mermaid1001',
                fontSize: ScreenSize.widthPlusHeight / 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            //Campo de texto 'nome'
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 40,
                  ScreenSize.widthPlusHeight / 20,
                  ScreenSize.widthPlusHeight / 40,
                  ScreenSize.widthPlusHeight / 100),
              child: TextFormField(
                keyboardType: TextInputType.text,
                maxLength: 50,
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.emoji_emotions,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
                  ),
                  labelText: 'Nome',
                ),
              ),
            ),
            //Campo de texto 'email'
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
                    Icons.contact_mail,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            //Campo de texto 'telefone'
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 40,
                  ScreenSize.widthPlusHeight / 100,
                  ScreenSize.widthPlusHeight / 40,
                  ScreenSize.widthPlusHeight / 100),
              child: TextFormField(
                keyboardType: TextInputType.text,
                maxLength: 20,
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.contact_phone,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
                  ),
                  labelText: 'Telefone',
                ),
              ),
            ),
            //Campo de texto 'assunto'
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 40,
                  ScreenSize.widthPlusHeight / 100,
                  ScreenSize.widthPlusHeight / 40,
                  ScreenSize.widthPlusHeight / 100),
              child: TextFormField(
                keyboardType: TextInputType.text,
                maxLength: 30,
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.draw_rounded,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
                  ),
                  labelText: 'Assunto',
                ),
              ),
            ),
            //Campo de texto 'Mensagem'
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
                    borderRadius:
                        BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
                  ),
                  labelText: 'Mensagem',
                ),
              ),
            ),
            //Botão 'enviar'
            Container(
              height: ScreenSize.widthPlusHeight / 22.2,
              padding: EdgeInsets.fromLTRB(
                  ScreenSize.widthPlusHeight / 8,
                  ScreenSize.widthPlusHeight / 100,
                  ScreenSize.widthPlusHeight / 8,
                  0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                ScreenSize.widthPlusHeight / 40)))),
                child: Text(
                  'Enviar',
                  style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      )),
      drawer: const Menu(),
    );
  }
}
