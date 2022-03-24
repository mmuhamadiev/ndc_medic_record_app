import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/components/bottom_button.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/auth_helper.dart';
import '../admin_panel/admin_screen.dart';
import '../main_menu_page/main_menu_page.dart';

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

    print(allData);
  }

  final messageTextController = TextEditingController();
  final messagePasswordController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
            child: Image.asset(
              'assets/images/img.png',
              scale: 1.3,
            ),
              ),
                  SizedBox(
                    height: 50,
                  ),
              Column(
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

                  controller: messageTextController,
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
                  controller: messagePasswordController,
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
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
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
                  SizedBox(
                    height: 100,
                  ),
              BottomButton(onPress: ()
                async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    //final existUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    final existUser = await AuthHelper.signInWithEmail(
                        email: messageTextController.text,
                        password: messagePasswordController.text);
                    if(existUser != null) {
                      // final userID = await FirebaseAuth.instance.currentUser?.uid;
                      // print(userID);
                      // print(FirebaseFirestore.instance.collection("users").doc(userID).snapshots());
                      // getData();
                      //await StreamBuilder<DocumentSnapshot>(
                      //  stream: FirebaseFirestore.instance.collection("users").doc(userID).snapshots(),
                      //  builder: (BuildContext context, AsyncSnapshot snapshot) {
                        //  if(snapshot.hasData && snapshot.data != null) {
                       //     final role = snapshot.data?.docs.data()['role'];
                       //     print(role);
                            //if(role == 'admin') {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/mainScreen',
                                      (Route<dynamic> route) => false);
                            //}else{
                            //  Navigator.of(context).pushNamedAndRemoveUntil(
                            //      '/main_menu',
                            //          (Route<dynamic> route) => false);
                            //}
                          //}else{
                          //  return Material(
                          //    child: Center(child: CircularProgressIndicator(),),
                          //  );
                          //}
                          //return Material(
                         //   child: Center(child: CircularProgressIndicator(),),
                        //  );
                       // },
                      //);
                      // if(role == 'admin') {
                      //   Navigator.of(context).pushNamedAndRemoveUntil(
                      //       '/adminScreen',
                      //           (Route<dynamic> route) => false);
                      // }else{
                      //   Navigator.of(context).pushNamedAndRemoveUntil(
                      //       '/main_menu',
                      //           (Route<dynamic> route) => false);
                      // }
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }
                  catch(e) {
                    setState(() {
                      showSpinner = false;
                    });
                    messageTextController.clear();
                    messagePasswordController.clear();
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



              }, buttonText: 'Sign-in'),
            ]),
          ),
        ),
      ),
    );
  }
}
