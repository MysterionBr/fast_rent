import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class ScreenSize {
  static double width = 0;
  static double height = 0;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/backgroundHome.jpg'),
                          fit: BoxFit.cover)),
                  child: Text(
                    'Quer alugar ou \nanunciar um imóvel?\n A resposta está aqui!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 2,
                        fontSize: ScreenSize.width / 14.4,
                        fontFamily: 'FredokaOne',
                        color: Colors.white,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 5.0),
                            blurRadius: 6.0,
                            color: Colors.black,
                          )
                        ]),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all(ScreenSize.width / 9),
                  child: SizedBox(
                    width: ScreenSize.width / 3,
                    height: ScreenSize.width / 72,
                    child: ElevatedButton(
                      child: Text(
                        'Ver Anúncios',
                        style: TextStyle(fontSize: ScreenSize.width / 24),
                      ),
                      onPressed: () {},
                    ),
                  )),
            ),
            Expanded(
                flex: 2,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Não é cadastrado? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSize.width / 30)),
                    TextSpan(
                      text: 'Crie uma conta',
                      style: TextStyle(
                          color: Colors.blue, fontSize: ScreenSize.width / 30),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                    )
                  ]),
                ))
          ],
        ),
      ),
      drawer: const Menu(),
    );
  }
}
