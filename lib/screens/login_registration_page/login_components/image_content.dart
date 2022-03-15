import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class ImageContent extends StatelessWidget {
  ImageContent({required this.image, required this.label});

  final Image image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        Text(label, style: kTextStyle),
        SizedBox(height: 10,)
      ],
    );
  }
}
