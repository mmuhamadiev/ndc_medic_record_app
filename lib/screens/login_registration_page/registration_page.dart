import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/bottom_button.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/image_content.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_components/reusable_card.dart';
import "dart:math" show pi;
import '../../utils/auth_helper.dart';

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
  final _messageTextController = TextEditingController();
  final _messagePasswordController = TextEditingController();
  bool showSpinner = false;
  Gender? selectedGender;
  int height = 180;
  int age = 18;
  int weight = 65;

  static email(String? txt) {
    if (txt == null || txt.isEmpty) {
      return;
    }
    if (!(txt.contains('@')) || !(txt.contains('.')) && txt.isNotEmpty) {
      return "Enter a valid email address!";
    }
    else
      return;
  }

  static password(String? txt) {
    if (txt == null || txt.isEmpty) {
      return;
    }
    if (txt.length < 8) {
      return "Password must has 8 characters";
    }
    if (!txt.contains(RegExp(r'[A-Z]'))) {
      return "Password must has uppercase";
    }
    if (!txt.contains(RegExp(r'[0-9]'))) {
      return "Password must has digits";
    }
    if (!txt.contains(RegExp(r'[a-z]'))) {
      return "Password must has lowercase";
    }
    else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'Login via ',
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Grotesque'),
            ),
            AnimatedTextKit(isRepeatingAnimation: true,
                repeatForever: true,animatedTexts: [WavyAnimatedText(
                'BMI',
                  textStyle: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Grotesque'),
            )]),
            Text(
              ' calculator ',
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Grotesque'),
            ),

          ],
        ),
        backgroundColor: kStaticMainColor,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
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
                          image: Image.asset(
                            'assets/images/male.png',
                            scale: 1.4,
                          ),
                          label: 'Male',
                        ),
                        colour: selectedGender == Gender.male
                            ? kOrange
                            : Color(0xff3F5B65)),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: ImageContent(
                        image: Image.asset(
                          'assets/images/female.png',
                          scale: 1.4,
                        ),
                        label: 'Female',
                      ),
                      colour: selectedGender == Gender.female
                          ? kOrange
                          : Color(0xff3F5B65),
                    ),
                  ),
                ],
              ),
              ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Height',
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        activeColor: kOrange,
                        inactiveColor: kWhite,
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
                colour: Color(0xff3F5B65),
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
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
                                color: kOrange,
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                color: kOrange,
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      colour: Color(0xff3F5B65),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
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
                                color: kOrange,
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                color: kOrange,
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      colour: Color(0xff3F5B65),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  maxLength: 35,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  decoration: kInputDecoration.copyWith(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    label: Text('User email address'),
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Grotesque',
                        color: kBlack
                    ),
                    errorText: email(_messageTextController.text),
                    hintText: 'sample@mail.com',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                  ),
                  controller: _messageTextController,
                  onChanged: (value) {
                    setState(() {
                      email(_messageTextController.text);
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  maxLength: 20,
                  obscuringCharacter: '*',
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  decoration: kInputDecoration.copyWith(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    label: Text('User password'),
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Grotesque',
                        color: kBlack
                    ),
                    errorText: password(_messagePasswordController.text),
                    hintText: 'Enter 8 digit password',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                  ),
                  controller: _messagePasswordController,
                  onChanged: (value) {
                    setState(() {
                      password(_messagePasswordController.text);
                    });
                  },
                ),
              ),
              BottomButton(
                buttonText: 'Sign-up',
                onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await AuthHelper.creteUserWithEmail(
                        email: _messageTextController.text,
                        password: _messagePasswordController.text);
                    final userData = await FirebaseAuth.instance.currentUser;
                    String gender() {
                      if (selectedGender == Gender.female) {
                        return 'female';
                      } else {
                        return 'male';
                      }
                    }

                    await UserHelper.saveUser(
                        userData, gender(), age, height, weight);
                    if (newUser != null) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/mainScreen', (Route<dynamic> route) => false);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpinner = false;
                    });
                    _messageTextController.clear();
                    _messagePasswordController.clear();
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Input Error'),
                        content: Text(e.toString()),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
