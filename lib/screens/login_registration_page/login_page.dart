import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/components/bottom_button.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/registration_page.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/MainScreen.dart';
import '../../utils/auth_helper.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  final _messageTextController = TextEditingController();
  final _messagePasswordController = TextEditingController();
  bool showSpinner = false;

  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 10);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () async{
      final existUser = await AuthHelper.signInWithEmail(
          email: 'user@gmail.com',
          password: '12345678');
      if (existUser != null) {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return MainScreen();
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return Align(
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: child,
                  ),
                );
              },
              transitionDuration:
              Duration(milliseconds: 1000),
            ),
                (Route<dynamic> route) => false);
      }
      setState(() {
        showSpinner = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TweenAnimationBuilder(
                    tween: _scaleTween,
                    duration: Duration(milliseconds: 500),
                    builder: (context, double scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: child,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/images/logo.png',
                        //scale: 1.3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          style: TextStyle(
                            fontFamily: 'Grotesque',
                            fontSize: 15,
                          ),
                          decoration: kInputDecoration.copyWith(
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                           label: Text('User email address'),
                            labelStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Grotesque',
                              color: kBlack
                            ),
                            hintText: 'sample@mail.com',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Grotesque',
                              color: Colors.black38,
                            ),
                          ),
                          controller: _messageTextController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Grotesque',
                            fontSize: 15,
                          ),
                          obscuringCharacter: '*',
                          obscureText: true,
                          decoration: kInputDecoration.copyWith(
                            floatingLabelAlignment: FloatingLabelAlignment.start,
                            label: Text('User password'),
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Grotesque',
                              color: kBlack
                            ),
                            hintText: 'Enter 8 digit password',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Grotesque',
                              color: Colors.black38,
                            ),
                          ),
                          controller: _messagePasswordController,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'New here?',
                                style:
                                    TextStyle(fontSize: 15, fontFamily: 'Grotesque'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Material(
                              color: kOrange,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                child: AnimatedTextKit(
                                  pause: Duration(milliseconds: 200),
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      Navigator.of(context)
                                          .push(PageRouteBuilder(
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return RegistrationPage();
                                        },
                                        transitionsBuilder:
                                            (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation,
                                                Widget child) {
                                          return Align(
                                            child: SizeTransition(
                                              sizeFactor: animation,
                                              child: child,
                                            ),
                                          );
                                        },
                                        transitionDuration:
                                            Duration(milliseconds: 1000),
                                      ));
                                    },
                                    isRepeatingAnimation: true,
                                    repeatForever: true,
                                    animatedTexts: [
                                      ColorizeAnimatedText(
                                        'Sign-up',
                                        speed: Duration(milliseconds: 500),
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Grotesque'),
                                        colors: colorizeColors,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  BottomButton(
                      onPress: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final existUser = await AuthHelper.signInWithEmail(
                              email: _messageTextController.text,
                              password: _messagePasswordController.text);
                          if (existUser != null) {
                            Navigator.of(context).pushAndRemoveUntil(
                                PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return MainScreen();
                                  },
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
                                    return Align(
                                      child: SizeTransition(
                                        sizeFactor: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 1000),
                                ),
                                (Route<dynamic> route) => false);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                          _messageTextController.clear();
                          _messagePasswordController.clear();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              contentTextStyle: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Grotesque',
                              ),
                              title: const Text(
                                'Input Error',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Grotesque',
                                ),
                              ),
                              content: Text(
                                e.toString(),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontFamily: 'Grotesque',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'Grotesque',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      buttonText: 'Sign-in'),
                ]),
          ),
        ),
      ),
    );
  }
}
