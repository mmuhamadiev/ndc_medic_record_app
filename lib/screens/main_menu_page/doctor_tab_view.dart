import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../constraints.dart';

class DoctorTabView extends StatefulWidget {

  @override
  State<DoctorTabView> createState() => _DoctorTabViewState();
}

class _DoctorTabViewState extends State<DoctorTabView> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
            return Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FutureBuilder<QuerySnapshot>(
                      future:
                      FirebaseFirestore.instance.collection('doctorInfo').get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          return ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                              children: documents
                                  .map((doc) => Container(
                                width: 300,
                                height: 200,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: kStaticMainColorOpacity,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: 100,
                                      height: 150,
                                      child: Image.network(
                                        doc['image'],
                                        scale: 1.4,
                                      ),
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(doc['docName']),
                                        Text(doc['specialist']),
                                        Text('${doc['experience']} years Experience'),
                                        Row(
                                          children: [
                                            Container(width: 50,height: 50,child: Icon(Icons.star_border)),
                                            Column(
                                              children: [
                                                Text('Rating'),
                                                Text(doc['rating']),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
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

                ],
              ),
            );
    // return StreamBuilder<QuerySnapshot>(
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
    //     List<DoctorList> messageBubbles = [];
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
    // );
  }
}

class DoctorList extends StatelessWidget {

  DoctorList({
    required this.image,
    required this.rating,
    required this.name,
    required this.experience,
    required this.specialist,

  });

  String name;
  String specialist;
  String image;
  String experience;
  String rating;

  @override
  Widget build(BuildContext context) {
    return
        Container(
          width: 300,
          height: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kStaticMainColorOpacity,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 100,
                height: 150,
                child: Image.network(
                  image,
                  scale: 1.4,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name),
                  Text(specialist),
                  Text('$experience years Experience'),
                  Row(
                    children: [
                      Container(width: 50,height: 50,child: Icon(Icons.star_border)),
                      Column(
                        children: [
                          Text('Rating'),
                          Text(rating),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
