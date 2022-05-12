// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';
import 'screen_size.dart';
import 'card_planos.dart';

class Plans extends StatelessWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init;
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos Profissionais'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundUsuario.jpg'),
                fit: BoxFit.cover)),
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(children: [
          SizedBox(height: ScreenSize.widthPlusHeight / 6.6),
          Card(
              color: Color.fromARGB(255, 214, 218, 31),
              child: Text('PLANO OURO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSize.widthPlusHeight / 66.6))),
          CardPlans(quantPlan: 5, valorPlan: 99),
          SizedBox(height: ScreenSize.widthPlusHeight / 250),
          Card(
              color: Color.fromARGB(255, 10, 89, 207),
              child: Text('PLANO PLATINA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSize.widthPlusHeight / 66.6))),
          CardPlans(quantPlan: 15, valorPlan: 260),
          SizedBox(height: ScreenSize.widthPlusHeight / 250),
          Card(
              color: Color.fromARGB(255, 153, 31, 235),
              child: Text('PLANO DIAMANTE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSize.widthPlusHeight / 66.6))),
          CardPlans(quantPlan: 60, valorPlan: 475)
        ]),
      ),
      drawer: const Menu(),
    );
  }
}
