import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/constraints.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onPress,required this.buttonText});

  final String buttonText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 80,
      color: Colors.green,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          '$buttonText',
          style: kBottomTextStyle,
        ),
      ),
    );
  }
}