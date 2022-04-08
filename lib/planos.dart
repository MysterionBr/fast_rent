// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto01/menu.dart';

import 'card_planos.dart';

class Plans extends StatelessWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos Profissionais'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(children: [
          SizedBox(height: 20),
          Card(
              color: Color.fromARGB(255, 214, 218, 31),
              child: Text('PLANO OURO',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))),
          CardPlans(quantPlan: 5, valorPlan: 99),
          SizedBox(height: 8),
          Card(
              color: Color.fromARGB(255, 10, 89, 207),
              child: Text('PLANO PLATINA',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))),
          CardPlans(quantPlan: 15, valorPlan: 260),
          SizedBox(height: 8),
          Card(
              color: Color.fromARGB(255, 94, 4, 153),
              child: Text('PLANO DIAMANTE',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))),
          CardPlans(quantPlan: 60, valorPlan: 475)
        ]),
      ),
      drawer: const Menu(),
    );
  }
}
