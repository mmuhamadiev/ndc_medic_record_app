import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/admin_panel/admin_screen.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_page.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/main_menu_page.dart';

import '../../utils/auth_helper.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            //UserHelper.saveUser(snapshot.data,'', '', '', '');
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("users").doc(snapshot.data?.uid).snapshots() ,
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(snapshot.hasData && snapshot.data != null) {
                  final userDoc = FirebaseFirestore.instance.collection("users").doc(snapshot.data?.id).collection('role');
                  //final user = userDoc?.data();
                  if(userDoc == 'admin') {
                    return AdminScreen();
                  }else{
                    return MainMenuPage();
                  }
                }else{
                  return Material(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              },
            );
          }
          return LoginPage();
        }
    );
  }
}