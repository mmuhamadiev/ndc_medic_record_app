import 'package:flutter/material.dart';
import '../../constraints.dart';
import '../login_registration_page/login_components/reusable_card.dart';

class EndDrawer extends StatelessWidget {

  String bmiResult;
  String bmiResultText;
  String interpretation;

  EndDrawer({required this.bmiResult, required this.bmiResultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Text('${bmiResult}', style: kResultLargeTextStyle),
                SizedBox(height: 10,),
                Text('${interpretation}', style: kResultSmallTextStyle,textAlign: TextAlign.center,),
                SizedBox(height: 15,),
              ],
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
      //ResultPage(bmiResult: widget.bmiResult, bmiResultText: widget.bmiResultText, interpretation: widget.interpretation,),
    );
  }
}
