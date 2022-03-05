import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.func});

  final IconData icon;
  final Function()? func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
      onPressed: func,
      shape: CircleBorder(),
      fillColor: Colors.green,
    );
  }
}