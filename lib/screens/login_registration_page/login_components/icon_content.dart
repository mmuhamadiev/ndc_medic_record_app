import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/constraints.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
          color: kTextBlackColor,
        ),
        Text(
          label,
          style: kTextStyle
        )
      ],
    );
  }
}
