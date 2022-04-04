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
          'Analysis List',
        ),
        backgroundColor: kStaticMainColor,
      ),
      body: Column(
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
          Expanded(
            child: CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  transitionBetweenRoutes: false,
                  heroTag: 'lab',
                  automaticallyImplyLeading: false,
                  largeTitle: Text('Laboratory'),
                  backgroundColor: Colors.transparent,
                ),
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
                                            Text('Laboratory'),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName']),
                                                subtitle: Text(doc['required']),
                                                trailing:
                                                    Text('${doc['price']}\$'),
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
                            return Text('It\'s Error!');
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
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
                                            Text('Ultrasound'),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName']),
                                                subtitle: Text(doc['required']),
                                                trailing:
                                                    Text('${doc['price']}\$'),
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
                            return Text('It\'s Error!');
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
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
                                            Text('Doppler'),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName']),
                                                subtitle: Text(doc['required']),
                                                trailing:
                                                    Text('${doc['price']}\$'),
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
                            return Text('It\'s Error!');
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
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
                                            Text('X-Ray'),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName']),
                                                subtitle: Text(doc['required']),
                                                trailing:
                                                    Text('${doc['price']}\$'),
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
                            return Text('It\'s Error!');
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
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
                                            Text('Miscellenous'),
                                            Container(
                                              height: 65,
                                              child: ListTile(
                                                title: Text(doc['testName']),
                                                subtitle: Text(doc['required']),
                                                trailing:
                                                    Text('${doc['price']}\$'),
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
                            return Text('It\'s Error!');
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
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
