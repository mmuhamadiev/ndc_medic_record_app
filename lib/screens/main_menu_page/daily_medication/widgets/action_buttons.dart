import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.onCreate,
    required this.onCancel,
  }) : super(key: key);
  final VoidCallback onCreate;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: onCancel,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: kDarkBlue,
          ),
          child: Text(
            "Cancel",
              style: TextStyle(
                fontFamily: 'Grotesque',
                fontSize: 18.0,
                color: kWhite
              )
          ),
        ),
        SizedBox(width: 12.0),
        ElevatedButton(style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kOrange)
        ),
          onPressed: onCreate,
          child: Text("Create",
    style: TextStyle(
    fontFamily: 'Grotesque',
    fontSize: 18.0,
    color: kWhite,
    )),
        ),
      ],
    );
  }
}
