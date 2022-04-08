import 'package:flutter/material.dart';

class CardPlans extends StatelessWidget {
  final int quantPlan, valorPlan;

  const CardPlans({Key? key, required this.quantPlan, required this.valorPlan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$quantPlan ANÚNCIOS / MÊS',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('R\$', style: TextStyle(fontSize: 12)),
            Text('$valorPlan',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            const Text(', 99', style: TextStyle(fontSize: 11)),
            const Opacity(
                opacity: 0.4,
                child: Text(' / MÊS', style: TextStyle(fontSize: 11))),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(243, 228, 111, 111),
                        Color.fromARGB(255, 236, 62, 62),
                        Color.fromARGB(255, 245, 10, 10),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Contratar'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
      ],
    ));
  }
}
