import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/components/bottom_button.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/on_generate_route.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
              SizedBox(
                height: 50,
              ),
          Flexible(
            flex: 1,
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  'assets/images/img.png',
                ),
              ),
            ),
          ),
                  SizedBox(
                    height: 50,
                  ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: kInputDecoration.copyWith(
                      hintText: 'sample@mail.com',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  alignment: Alignment.bottomLeft,
                  child: Text('User password'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    obscuringCharacter: '*',
                    obscureText: true,
                    decoration: kInputDecoration.copyWith(
                      hintText: 'Enter 8 digit password',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('New here?'),
                      SizedBox(width: 10,),
                      Material(
                        color: kStaticMainColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/registration');
                            },
                            child: Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(flex: 0,child: BottomButton(onPress: () {}, buttonText: 'Sign-in')),
        ]),
      ),
    );
  }
}
