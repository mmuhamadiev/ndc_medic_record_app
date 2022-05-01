import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndc_medic_record_app/utils/auth_helper.dart';

import '../../constraints.dart';

User? loggedInUser;

class UserListResultScreen extends StatefulWidget {
  static const routeName = '/users_list_result';

  @override
  _UserListResultScreenState createState() => _UserListResultScreenState();
}

class _UserListResultScreenState extends State<UserListResultScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String messageText;
  String? searchtxt;
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    getCurrentVoid();
  }

  void getCurrentVoid() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: TextField(
                style: TextStyle(
                  fontFamily: 'Grotesque',
                  fontSize: 15,
                ),
                decoration: kInputDecoration.copyWith(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kDarkBlue),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kDarkBlue),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kDarkBlue),
                    borderRadius: BorderRadius.all(Radius.circular(20)
                    ),
                  ),
                  label: Text('Search'),
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Grotesque',
                      color: kBlack
                  ),
                  hintText: 'type analysis name',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Grotesque',
                    color: Colors.black38,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    searchtxt = text;
                  });
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: (searchtxt != "" && searchtxt != null)
                    ? FirebaseFirestore.instance
                    .collection("users")
                    .where("email", isNotEqualTo: searchtxt)
                    .orderBy("email")
                    .startAt([
                  searchtxt,
                ]).endAt([
                  searchtxt! + '\uf8ff',
                ]).snapshots()
                    : FirebaseFirestore.instance.collection("users").where('role', isNotEqualTo: 'admin').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    return Column(
                        children: documents
                            .map((doc) => Column(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection("messages").where('sender', isEqualTo: doc['email']).where('receiver', isEqualTo: loggedInUser?.email).where('unread', isEqualTo: 'unread').snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.lightBlueAccent,
                                          ),
                                        );
                                      }
                                      snapshot.data?.docs.forEach((element) {
                                      list.add(element.id);
                                      });
                                      final unreadMessages = snapshot.data?.docs.length;
                                      return Text(unreadMessages.toString(),style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Grotesque',
                                          color: kBlack
                                      ),);
                                    }
                                ),
                                Container(
                                  height: 65,
                                  child: ListTile(
                                    title: Text(doc['email'],style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Grotesque',
                                        color: kBlack
                                    ),),
                                    onTap: () {
                                      if(list.toSet().toList().length == 0) {
                                        final userData = FirebaseAuth.instance.currentUser;
                                        UserHelper.updateUser(userData, 'true');
                                        Navigator.pushNamed(context, '/record',arguments: doc['email']);
                                      }
                                      else{
                                        for(var i = 0; i < list.toSet().toList().length; i++) {
                                          UserHelper.updateMessage(list.toSet().toList()[i]);
                                        }
                                        final userData = FirebaseAuth.instance.currentUser;
                                        UserHelper.updateUser(userData, 'true');
                                        Navigator.pushNamed(context, '/record',arguments: doc['email']);
                                      }
                                    },
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.black45,
                                ),
                              ],
                            ),

                          ],
                        ))
                            .toList());
                  } else if (snapshot.hasError) {
                    return Text('It\'s Error!',style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Grotesque',
                        color: kBlack
                    ),);
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: kStaticMainColor,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}