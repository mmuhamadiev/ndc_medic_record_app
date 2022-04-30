import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constraints.dart';
import '../login_registration_page/login_components/calculator_brain.dart';
import '../login_registration_page/login_components/reusable_card.dart';

class EndDrawer extends StatefulWidget {

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).get() ,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();


                  int height = user['height'];
                  int weight = user['weight'];
                  CalculatorBrain calcBrain = CalculatorBrain(height: height, weight: weight);
                  if(snapshot.hasData && snapshot.data != null) {
                    return BMIresul(bmiResult: calcBrain.calculateBMI(), bmiResultText: calcBrain.getResult(), interpretation: calcBrain.getResultInterpretation());
                  }
                  else {
                    return BMIresul(bmiResult: '20.1', bmiResultText: 'Overweight', interpretation: 'You have a lower than normal body weight. You can eat bit more');
                  }
                }else{
                  return Material(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              },
            );
          }
}



class BMIresul extends StatefulWidget {

  String bmiResult;
  String bmiResultText;
  String interpretation;

  BMIresul({required this.bmiResult, required this.bmiResultText, required this.interpretation});

  @override
  State<BMIresul> createState() => _BMIresulState();
}

class _BMIresulState extends State<BMIresul> {
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
            colour: kDarkBlue,
            cardChild: Column(
              children: [
                SizedBox(height: 15,),
                AnimatedTextKit(isRepeatingAnimation: true,
                    repeatForever: true,animatedTexts: [WavyAnimatedText(
                      widget.bmiResultText.toUpperCase(),
                      textStyle: kResultSmallTextStyle.copyWith(color: kOrange),
                    )]),
                SizedBox(height: 10,),
                Text('${widget.bmiResult}', style: kResultLargeTextStyle),
                SizedBox(height: 10,),
                Text('${widget.interpretation}', style: kResultSmallTextStyle,textAlign: TextAlign.center,),
                SizedBox(height: 15,),
              ],
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
