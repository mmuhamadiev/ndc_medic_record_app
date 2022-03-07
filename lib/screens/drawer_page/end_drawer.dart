import 'dart:ffi';

import 'package:flutter/material.dart';

import '../login_registration_page/login_components/calculator_brain.dart';
import '../main_menu_page/result_end_drawer.dart';

class EndDrawer extends StatefulWidget {

  String bmiResult;
  String bmiResultText;
  String interpretation;

  EndDrawer({required this.bmiResult, required this.bmiResultText, required this.interpretation});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ResultPage(bmiResult: widget.bmiResult, bmiResultText: widget.bmiResultText, interpretation: widget.interpretation,),
    );
  }
}
