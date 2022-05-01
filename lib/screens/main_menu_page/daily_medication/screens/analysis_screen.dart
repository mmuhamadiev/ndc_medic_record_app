import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class AnalysisScreen extends StatefulWidget {
  static const routeName = '/analysis_screen';

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final _firestore = FirebaseFirestore.instance;

  String? searchtxt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analysis List', style: TextStyle(fontSize: 25, fontFamily: 'Grotesque')
        ),
        backgroundColor: kStaticMainColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
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
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    StreamBuilder<QuerySnapshot>(
                        stream: (searchtxt != "" && searchtxt != null)
                            ? FirebaseFirestore.instance
                                .collection("lab")
                                .where("testName", isNotEqualTo: searchtxt)
                                .orderBy("testName")
                                .startAt([
                                searchtxt,
                              ]).endAt([
                                searchtxt! + '\uf8ff',
                              ]).snapshots()
                            : FirebaseFirestore.instance
                                .collection("lab")
                                .snapshots(),
                        //FirebaseFirestore.instance.collection('lab').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Column(
                                          children: [
                                            Text('Laboratory', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Grotesque')),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                subtitle: Text(doc['required'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                trailing:
                                                    Text('${doc['price']}\$', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Text('It\'s Error!', style: TextStyle(fontSize: 20, fontFamily: 'Grotesque'));
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: kStaticMainColor,
                            ),
                          );
                        }),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    StreamBuilder<QuerySnapshot>(
                        stream: (searchtxt != "" && searchtxt != null)
                            ? FirebaseFirestore.instance
                                .collection("ultrasound")
                                .where("testName", isNotEqualTo: searchtxt)
                                .orderBy("testName")
                                .startAt([
                                searchtxt,
                              ]).endAt([
                                searchtxt! + '\uf8ff',
                              ]).snapshots()
                            : FirebaseFirestore.instance
                                .collection("ultrasound")
                                .snapshots(),
                        //FirebaseFirestore.instance.collection('ultrasound').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Column(
                                          children: [
                                            Text('Ultrasound', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Grotesque')),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                subtitle: Text(doc['required'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                trailing:
                                                    Text('${doc['price']}\$', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Text('It\'s Error!', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque'));
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: kStaticMainColor,
                            ),
                          );
                        }),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    StreamBuilder<QuerySnapshot>(
                        stream: (searchtxt != "" && searchtxt != null)
                            ? FirebaseFirestore.instance
                                .collection("doppler")
                                .where("testName", isNotEqualTo: searchtxt)
                                .orderBy("testName")
                                .startAt([
                                searchtxt,
                              ]).endAt([
                                searchtxt! + '\uf8ff',
                              ]).snapshots()
                            : FirebaseFirestore.instance
                                .collection("doppler")
                                .snapshots(),
                        //FirebaseFirestore.instance.collection('doppler').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Column(
                                          children: [
                                            Text('Doppler', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Grotesque')),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                subtitle: Text(doc['required'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                trailing:
                                                    Text('${doc['price']}\$', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Text('It\'s Error!', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque'));
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: kStaticMainColor,
                            ),
                          );
                        }),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    StreamBuilder<QuerySnapshot>(
                        stream: (searchtxt != "" && searchtxt != null)
                            ? FirebaseFirestore.instance
                                .collection("xray")
                                .where("testName", isNotEqualTo: searchtxt)
                                .orderBy("testName")
                                .startAt([
                                searchtxt,
                              ]).endAt([
                                searchtxt! + '\uf8ff',
                              ]).snapshots()
                            : FirebaseFirestore.instance
                                .collection("xray")
                                .snapshots(),
                        //FirebaseFirestore.instance.collection('xray').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Column(
                                          children: [
                                            Text('X-Ray', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Grotesque')),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                subtitle: Text(doc['required'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                trailing:
                                                    Text('${doc['price']}\$', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Text('It\'s Error!', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque'));
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: kStaticMainColor,
                            ),
                          );
                        }),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    StreamBuilder<QuerySnapshot>(
                        stream: (searchtxt != "" && searchtxt != null)
                            ? FirebaseFirestore.instance
                                .collection("miscellenous")
                                .where("testName", isNotEqualTo: searchtxt)
                                .orderBy("testName")
                                .startAt([
                                searchtxt,
                              ]).endAt([
                                searchtxt! + '\uf8ff',
                              ]).snapshots()
                            : FirebaseFirestore.instance
                                .collection("miscellenous")
                                .snapshots(),
                        //FirebaseFirestore.instance.collection('miscellenous').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Column(
                                          children: [
                                            Text('Miscellenous', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Grotesque')),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                subtitle: Text(doc['required'], style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                                trailing:
                                                    Text('${doc['price']}\$', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque')),
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Text('It\'s Error!', style: TextStyle(fontSize: 15, fontFamily: 'Grotesque'));
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: kStaticMainColor,
                            ),
                          );
                        }),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
