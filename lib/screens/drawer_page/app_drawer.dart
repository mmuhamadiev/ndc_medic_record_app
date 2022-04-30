import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constraints.dart';
import '../../utils/auth_helper.dart';
import '../login_registration_page/login_components/image_content.dart';
import '../login_registration_page/login_components/reusable_card.dart';
import '../login_registration_page/login_components/round_icon_button.dart';

class AppDrawer extends StatefulWidget {

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).get() ,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  Gender gender() {
                    if(user['gender'] == 'female') {
                      return Gender.female;
                    }
                    else {
                      return Gender.male;
                    }
                  }
                  int age = user['age'];
                  int height = user['height'];
                  int weight = user['weight'];
                  String email = user['email'];
                  if(snapshot.hasData && snapshot.data != null) {
                    return BMI(age: age, selectedGender: gender(), height: height, weight: weight, email: email,);
                  }
                  else {
                    return BMI(age: 18, selectedGender: Gender.male, height: 180, weight: 65,email: 'user email',);
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

enum Gender {
  male,
  female,
}

class BMI extends StatefulWidget {

  String email;
  Gender? selectedGender;
  int height;
  int age;
  int weight;

  BMI({Key? key,required this.email, required this.selectedGender, required this.height, required this.age, required this.weight}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

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
                    tileColor: kDarkBlue,
                    leading: Icon(Icons.account_circle_rounded,size: 35,color: kWhite,),
                    title: Text('${widget.email}',style: TextStyle(fontSize: 18, fontFamily: 'Grotesque',color: kWhite, fontWeight: FontWeight.bold),),
                  )
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            widget.selectedGender = Gender.male;
                          });
                        },
                        cardChild: ImageContent(
                          image: Image.asset('assets/images/male.png',scale: 1.4,),
                          label: 'Male',
                        ),
                        colour: widget.selectedGender == Gender.male
                            ? kOrange
                            : kDarkBlue),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          widget.selectedGender = Gender.female;
                        });
                      },
                      cardChild: ImageContent(
                        image: Image.asset('assets/images/female.png',scale: 1.4,),
                        label: 'Female',
                      ),
                      colour: widget.selectedGender == Gender.female
                          ? kOrange
                          : kDarkBlue,
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
                      'Height',
                      style: kTextStyle,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${widget.height}',
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
                        activeColor: kOrange,
                        inactiveColor: kWhite,
                        value: widget.height.toDouble(),
                        min: 50,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            widget.height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                colour: kDarkBlue,
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
                                '${widget.weight}',
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
                                    widget.weight--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                color: kOrange,
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    widget.weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                      colour: kDarkBlue,
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
                                '${widget.age}',
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
                                    widget.age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                color: kOrange,
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    widget.age++;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                      colour: kDarkBlue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Material(
                color: kOrange,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Builder(
                      builder: (context) {
                        return TextButton(
                          onPressed: () async{
                            final userData = await FirebaseAuth.instance.currentUser;
                            String gender() {
                              if(widget.selectedGender == Gender.female) {
                                return 'female';
                              }
                              else {
                                return 'male';
                              }
                            }
                            await UserHelper.updateUserBMI(userData, gender(), widget.age, widget.height, widget.weight);
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
