import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  void Function() ?onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade300, offset: Offset(5,5))],
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}