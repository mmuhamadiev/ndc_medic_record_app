import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.func, required this.color});

  final IconData icon;
  final Function()? func;
  Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: Icon(icon, color: Colors.white,),
      onPressed: func,
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}