import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/bottom_button.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'result_page.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/image_content.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/reusable_card.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/login_constraints.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class RegistrationPage extends StatefulWidget {

  static const routeName = '/registration';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Gender? selectedGender;
  int height = 180;
  int age = 18;
  int weight = 65;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Login via BMI calculator',
            style: TextStyle(
                color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        //resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          cardChild: ImageContent(
                            image: Image.asset('assets/images/male.png',scale: 1.4,),
                            label: 'Male',
                          ),
                          colour: selectedGender == Gender.male
                              ? kActiveColor
                              : kInactiveColor),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        cardChild: ImageContent(
                          image: Image.asset('assets/images/female.png',scale: 1.4,),
                          label: 'Female',
                        ),
                        colour: selectedGender == Gender.female
                            ? kActiveColor
                            : kInactiveColor,
                      ),
                    ),
                  ],
                ),
                ReusableCard(   
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        'HEIGHT',
                        style: kTextStyle,
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          activeColor: Colors.green,
                          inactiveColor: Color(0xFFFFFFFF),
                          value: height.toDouble(),
                          min: 50,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  colour: kStaticMainColorOpacity,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Weight',
                              style: kTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$weight',
                                  style: kNumberTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  func: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  func: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        colour: kStaticMainColorOpacity,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'Age',
                              style: kTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$age',
                                  style: kNumberTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  func: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  func: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        colour: kStaticMainColorOpacity,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  alignment: Alignment.bottomLeft,
                  child: Text('User email address'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    enableSuggestions: false,
                    autocorrect: false,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    decoration: kInputDecoration.copyWith(
                      filled: true,
                      hintText: 'sample@mail.com',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  alignment: Alignment.bottomLeft,
                  child: Text('User password'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    obscuringCharacter: '*',
                    cursorColor: Colors.white,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    decoration: kInputDecoration.copyWith(
                      filled: true,
                      hintText: 'Enter 8 digit password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                BottomButton(
                  buttonText: 'Sing-up',
                  onPress: () {
                    CalculatorBrain calcBrain = CalculatorBrain(height: height, weight: weight);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/main_menu',
                            (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
