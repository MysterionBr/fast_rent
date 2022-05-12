//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'screen_size.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundUsuario.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            //Ícone e texto
            Container(
                padding: EdgeInsets.fromLTRB(
                    0, ScreenSize.widthPlusHeight / 15, 0, 0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/avatar.png'),
                    radius: ScreenSize.widthPlusHeight / 22.2,
                  ),
                )),
            SizedBox(height: ScreenSize.widthPlusHeight / 100),
            Text(
              'Usuário',
              style: TextStyle(
                fontSize: ScreenSize.widthPlusHeight / 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            //Texto 'Meus Anúncios'
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenSize.widthPlusHeight / 15, 0, 0),
              child: Text(
                'Meus Anúncios',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              height: ScreenSize.widthPlusHeight / 8,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //Card
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa6.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 2
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa7.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 3
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa8.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 4
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa9.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 5
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa10.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                ],
              ),
            )),
            //Texto 'Anúncios Favoritos'
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, ScreenSize.widthPlusHeight / 25, 0, 0),
              child: Text(
                'Anúncios Favoritos',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              height: ScreenSize.widthPlusHeight / 8,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //Card
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa1.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 2
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa2.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 3
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa3.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 4
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa4.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                  //Card 5
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200,
                        ScreenSize.widthPlusHeight / 100,
                        ScreenSize.widthPlusHeight / 200),
                    height: ScreenSize.widthPlusHeight / 10,
                    width: ScreenSize.widthPlusHeight / 10,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset('assets/images/casa5.jpg',
                                    fit: BoxFit.cover),
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
                  ),
                ],
              ),
            )),
          ],
        ),
      )),
      drawer: const Menu(),
    );
  }
}
