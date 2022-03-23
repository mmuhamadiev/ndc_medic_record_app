import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constraints.dart';
import '../../utils/auth_helper.dart';
import '../login_registration_page/login_components/image_content.dart';
import '../login_registration_page/login_components/reusable_card.dart';
import '../login_registration_page/login_components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  Gender? selectedGender;
  int height = 180;
  int age = 18;
  int weight = 65;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    tileColor: kStaticMainColorOpacity,
                    leading: Icon(Icons.account_circle_rounded,size: 35,),
                    title: Text('user email',style: TextStyle(fontSize: 18),),
                  )
              ),
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
                            ? kStaticMainColor
                            : kStaticMainColorOpacity),
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
                          ? kStaticMainColor
                          : kStaticMainColorOpacity,
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
              SizedBox(height: 10,),
              Material(
                color: kStaticMainColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Builder(
                      builder: (context) {
                        return TextButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Text('Recalculate',style: TextStyle(color: Colors.white,fontSize: 15),),
                        );
                      }
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Material(
                color: kStaticMainColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextButton(
                    onPressed: () async{
                      //Navigator.pushNamed(context, '/login');
                      final user = await AuthHelper.logOut();
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                    child: Text('Log out',style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
