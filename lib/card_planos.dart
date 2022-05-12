import 'package:flutter/material.dart';
import 'screen_size.dart';

class CardPlans extends StatelessWidget {
  final int quantPlan, valorPlan;

  const CardPlans({Key? key, required this.quantPlan, required this.valorPlan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$quantPlan ANÚNCIOS / MÊS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenSize.widthPlusHeight / 100)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('R\$',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 90)),
            Text('$valorPlan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenSize.widthPlusHeight / 55.5)),
            Text(', 99',
                style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 90)),
            Opacity(
                opacity: 0.4,
                child: Text(' / MÊS',
                    style:
                        TextStyle(fontSize: ScreenSize.widthPlusHeight / 90))),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
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
                  padding: EdgeInsets.all(ScreenSize.widthPlusHeight / 125),
                  primary: Colors.white,
                  textStyle:
                      TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
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
