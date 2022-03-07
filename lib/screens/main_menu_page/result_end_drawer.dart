import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import '../../components/bottom_button.dart';
import '../login_registration_page/login_components/login_constraints.dart';
import '../login_registration_page/login_components/reusable_card.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.bmiResultText, required this.interpretation,});

  final String bmiResult;
  final String bmiResultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: kResultTextStyle,
              ),
            ),
            SizedBox(height: 20,),
            ReusableCard(
              colour: kStaticMainColorOpacity,
              cardChild: Column(
                children: [
                  SizedBox(height: 15,),
                  Text('${bmiResultText.toUpperCase()}', style: kResultSmallTextStyle),
                  SizedBox(height: 10,),
                  Text('$bmiResult', style: kResultLargeTextStyle),
                  SizedBox(height: 10,),
                  Text('$interpretation', style: kResultSmallTextStyle,textAlign: TextAlign.center,),
                  SizedBox(height: 15,),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}


