import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';
import 'campo_texto.dart';

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
                    0, ScreenSize.widthPlusHeight / 20, 0, 0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage("assets/images/email.png"),
                    radius: ScreenSize.widthPlusHeight / 33.3,
                  ),
                )),
            SizedBox(height: ScreenSize.widthPlusHeight / 100),
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, 0, 0, ScreenSize.widthPlusHeight / 40),
              child: Text(
                'Contato',
                style: TextStyle(
                  fontFamily: 'Mermaid1001',
                  fontSize: ScreenSize.widthPlusHeight / 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            //Campo de texto 'email'
            const CampoTexto(label: 'Nome*', icon: Icon(Icons.account_circle)),
            //Campo de texto 'senha'
            const CampoTexto(label: 'Email*', icon: Icon(Icons.email)),
            //Campo de texto 'nome'
            const CampoTexto(label: 'Telefone*', icon: Icon(Icons.call)),
            //Campo de texto 'cpf'
            const CampoTexto(label: 'Assunto*', icon: Icon(Icons.draw_rounded)),
            //Campo de texto 'celular'
            const CampoTexto(label: 'Mensagem*', icon: Icon(Icons.edit_note)),
            //Botão 'cadastrar'
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
