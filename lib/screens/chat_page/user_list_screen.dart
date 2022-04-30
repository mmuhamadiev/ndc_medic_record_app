import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndc_medic_record_app/utils/auth_helper.dart';

User? loggedInUser;

class UserListScreen extends StatefulWidget {
  static const routeName = '/users_list';

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String messageText;
  List<String> list = [];
  String? searchtxt;

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
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 30,
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          searchtxt = text;
                        });
                      },
                    )),
                Container(
                    width: 70,
                    height: 30,
                    child: TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('Search'))),
              ],
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
                                            stream: FirebaseFirestore.instance
                                                .collection("messages")
                                                .where('sender',
                                                    isEqualTo: doc['email'])
                                                .where('receiver',
                                                    isEqualTo:
                                                        loggedInUser?.email)
                                                .where('unread',
                                                    isEqualTo: 'unread')
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        Colors.lightBlueAccent,
                                                  ),
                                                );
                                              }
                                              snapshot.data?.docs
                                                  .forEach((element) {
                                                list.add(element.id);
                                              });
                                              final unreadMessages =
                                                  snapshot.data?.docs.length;
                                              return Text(
                                                  unreadMessages.toString());
                                            }),
                                        Container(
                                          height: 65,
                                          child: ListTile(
                                            title: Text(
                                              doc['email'],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onTap: () {
                                              if (list
                                                      .toSet()
                                                      .toList()
                                                      .length ==
                                                  0) {
                                                final userData = FirebaseAuth
                                                    .instance.currentUser;
                                                UserHelper.updateUser(
                                                    userData, 'true');
                                                Navigator.pushNamed(
                                                    context, '/chat',
                                                    arguments: doc['email']);
                                              } else {
                                                for (var i = 0;
                                                    i <
                                                        list
                                                            .toSet()
                                                            .toList()
                                                            .length;
                                                    i++) {
                                                  UserHelper.updateMessage(
                                                      list.toSet().toList()[i]);
                                                }
                                                final userData = FirebaseAuth
                                                    .instance.currentUser;
                                                UserHelper.updateUser(
                                                    userData, 'true');
                                                Navigator.pushNamed(
                                                    context, '/chat',
                                                    arguments: doc['email']);
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
                    return Text('It\'s Error!');
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
