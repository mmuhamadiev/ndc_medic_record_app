import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class AnalysisScreen extends StatelessWidget {
  static const routeName = '/analysis_screen';

  final _firestore = FirebaseFirestore.instance;

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
                    FutureBuilder<QuerySnapshot>(
                        future:
                            FirebaseFirestore.instance.collection('lab').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Column(
                                          children: [
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
                CupertinoSliverNavigationBar(
                  transitionBetweenRoutes: false,
                  heroTag: 'uzi',
                  automaticallyImplyLeading: false,
                  largeTitle: Text('Ultrasound'),
                  backgroundColor: Colors.transparent,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    FutureBuilder<QuerySnapshot>(
                        future:
                            FirebaseFirestore.instance.collection('ultrasound').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Card(
                                          child: ListTile(
                                            title: Text(doc['testName']),
                                            subtitle: Text(doc['required']),
                                            trailing: Text('${doc['price']}\$'),
                                          ),
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
                CupertinoSliverNavigationBar(
                  transitionBetweenRoutes: false,
                  heroTag: 'doppler',
                  automaticallyImplyLeading: false,
                  largeTitle: Text('Doppler'),
                  backgroundColor: Colors.transparent,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    FutureBuilder<QuerySnapshot>(
                        future:
                        FirebaseFirestore.instance.collection('doppler').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Card(
                                  child: ListTile(
                                    title: Text(doc['testName']),
                                    subtitle: Text(doc['required']),
                                    trailing: Text('${doc['price']}\$'),
                                  ),
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
                CupertinoSliverNavigationBar(
                  transitionBetweenRoutes: false,
                  heroTag: 'xray',
                  automaticallyImplyLeading: false,
                  largeTitle: Text('X-Ray'),
                  backgroundColor: Colors.transparent,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    FutureBuilder<QuerySnapshot>(
                        future:
                        FirebaseFirestore.instance.collection('xray').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Card(
                                  child: ListTile(
                                    title: Text(doc['testName']),
                                    subtitle: Text(doc['required']),
                                    trailing: Text('${doc['price']}\$'),
                                  ),
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
                CupertinoSliverNavigationBar(
                  transitionBetweenRoutes: false,
                  heroTag: 'miscellenous',
                  automaticallyImplyLeading: false,
                  largeTitle: Text('Miscellenous'),
                  backgroundColor: Colors.transparent,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    FutureBuilder<QuerySnapshot>(
                        future:
                        FirebaseFirestore.instance.collection('miscellenous').get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return Column(
                                children: documents
                                    .map((doc) => Card(
                                  child: ListTile(
                                    title: Text(doc['testName']),
                                    subtitle: Text(doc['required']),
                                    trailing: Text('${doc['price']}\$'),
                                  ),
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
      // body: FutureBuilder<QuerySnapshot>(
      //     future: FirebaseFirestore.instance.collection('lab').get(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         final List<DocumentSnapshot> documents = snapshot.data!.docs;
      //         return Column(
      //               children: [
      //                 Expanded(
      //                   child: CustomScrollView(
      //                     shrinkWrap: true,
      //                     slivers: [
      //                       CupertinoSliverNavigationBar(
      //                         transitionBetweenRoutes: false,
      //                         heroTag: 'lab',
      //                         automaticallyImplyLeading: false,
      //                         largeTitle: Text('Laboratory'),
      //                         backgroundColor: Colors.transparent,
      //                       ),
      //                       SliverList(delegate: SliverChildListDelegate(
      //                           documents
      //                               .map((doc) {
      //                                 if(doc['title'] == 'Laboratory') {
      //                                   return Card(
      //                                       child: ListTile(
      //                                         title: Text(doc['testName']),
      //                                         subtitle: Text(doc['required']),
      //                                         trailing: Text('${doc['price']}\$'),
      //                                       ));
      //                                 }
      //                           return Card(
      //                           child: ListTile(
      //                           title: Text(doc['testName']),
      //                           subtitle: Text(doc['required']),
      //                           trailing: Text('${doc['price']}\$'),
      //                           ));
      //                               }
      //                       ).toList())),
      //                       CupertinoSliverNavigationBar(
      //                         transitionBetweenRoutes: false,
      //                         heroTag: 'uzi',
      //                         automaticallyImplyLeading: false,
      //                         largeTitle: Text('USI'),
      //                         backgroundColor: Colors.transparent,
      //                       ),
      //                       SliverList(delegate: SliverChildListDelegate(
      //                           documents
      //                               .map((doc) => Card(
      //                             child: ListTile(
      //                               title: Text(doc['testName']),
      //                               subtitle: Text(doc['required']),
      //                               trailing: Text('${doc['price']}\$'),
      //                             ),
      //                           )).toList()
      //                       ),),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             );
      //         // return ListView(
      //         //     children: documents
      //         //         .map((doc) => Card(
      //         //       child: ListTile(
      //         //         title: Text(doc['testName']),
      //         //         subtitle: Text(doc['required']),
      //         //         trailing: Text('${doc['price']}\$'),
      //         //       ),
      //         //     )).toList());
      //       } else if (snapshot.hasError) {
      //         return Text('It\'s Error!');
      //         }
      //       return Center(
      //                   child: CircularProgressIndicator(
      //                     backgroundColor: Colors.lightBlueAccent,
      //                   ),
      //                 );
      //         }),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: _firestore.collection('doctorInfo').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           backgroundColor: Colors.lightBlueAccent,
      //         ),
      //       );
      //     }
      //     final doctorInfo = snapshot.data.docs;
      //     List<AnalysisList> messageBubbles = [];
      //     for (var info in doctorInfo) {
      //       final name = info.data()['docName'];
      //       final experience = info.data()['experience'];
      //       final rating = info.data()['rating'];
      //       final specialist = info.data()['specialist'];
      //       final image = info.data()['image'];
      //
      //       final messageBubble =
      //       DoctorList(
      //         name: name,
      //         experience: experience,
      //         rating: rating,
      //         specialist: specialist,
      //         image: image,
      //       );
      //       messageBubbles.add(messageBubble);
      //     }
      //
      //     return Expanded(
      //       flex: 2,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: messageBubbles,
      //       ),
      //     );
      //   },
      // ),
      // body: Column(
      //     children: [
      //       Expanded(
      //         child: CustomScrollView(
      //           shrinkWrap: true,
      //           slivers: [
      //             CupertinoSliverNavigationBar(
      //               transitionBetweenRoutes: false,
      //               heroTag: 'lab',
      //               automaticallyImplyLeading: false,
      //               largeTitle: Text('Lab'),
      //               backgroundColor: Colors.transparent,
      //             ),
      //             SliverList(delegate: SliverChildListDelegate(
      //                 [
      //                   for (var item in listData) item,
      //                 ]
      //             ),),
      //             CupertinoSliverNavigationBar(
      //               transitionBetweenRoutes: false,
      //               heroTag: 'uzi',
      //               automaticallyImplyLeading: false,
      //               largeTitle: Text('USI'),
      //               backgroundColor: Colors.transparent,
      //             ),
      //             SliverList(delegate: SliverChildListDelegate(
      //                 [
      //                   for (var item in listData) item,
      //                 ]
      //             ),),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}
