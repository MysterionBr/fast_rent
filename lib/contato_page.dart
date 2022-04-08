import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';

class ContatoWidget extends StatelessWidget {
  const ContatoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fale Conosco'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                maxLength: 50,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.emoji_emotions),
                    hintText: 'Nome')),
            const SizedBox(height: 5),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                maxLength: 50,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.contact_mail),
                    hintText: 'Email')),
            const SizedBox(height: 5),
            TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 20,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.contact_phone),
                    hintText: 'Telefone')),
            const SizedBox(height: 5),
            TextFormField(
                maxLength: 30,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.draw_rounded),
                    hintText: 'Assunto')),
            const SizedBox(height: 5),
            TextFormField(
                maxLines: null,
                maxLength: 200,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.edit_note),
                    hintText: 'Mensagem')),
            const SizedBox(height: 30),
            ElevatedButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    elevation: 15,
                    shadowColor: Colors.grey,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  debugPrint('toquei no drawer');
                },
                child: const Text('Enviar'))
          ],
        ),
      ),
      drawer: const Menu(),
    );
  }
}
