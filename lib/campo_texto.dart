import 'package:flutter/material.dart';
import 'screen_size.dart';

class CampoTexto extends StatelessWidget {
  final String label;
  final Icon icon;

  const CampoTexto({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenSize.widthPlusHeight / 40,
          ScreenSize.widthPlusHeight / 100,
          ScreenSize.widthPlusHeight / 40,
          ScreenSize.widthPlusHeight / 100),
      child: TextFormField(
        style: TextStyle(fontSize: ScreenSize.widthPlusHeight / 66.6),
        decoration: InputDecoration(
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ScreenSize.widthPlusHeight / 40),
          ),
          labelText: label,
        ),
      ),
    );
  }
}
