import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../constraints.dart';

class DoctorTabView extends StatefulWidget {

  @override
  State<DoctorTabView> createState() => _DoctorTabViewState();
}

class _DoctorTabViewState extends State<DoctorTabView> {

  @override
  Widget build(BuildContext context) {
    final topStatusBarHeight = MediaQuery.of(context).viewPadding.top;
    final bottomNotchHeight = MediaQuery.of(context).viewPadding.bottom;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double scaleOfWidth = width / 930;
    final double scaleOfHeight = height / 410;
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
                                  boxShadow: [BoxShadow(color: Colors.grey.shade300, offset: Offset(5,5))],
                                  color: kDarkBlue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/doc${doc['image']}.png'),
                                    // CachedNetworkImage(
                                    //   imageUrl: doc['image'],
                                    //   progressIndicatorBuilder:
                                    //       (context, url, downloadProgress) =>
                                    //       CircularProgressIndicator(
                                    //           value: downloadProgress.progress),
                                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                                    // ),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(child: Text(doc['docName'],style: TextStyle(fontSize: 20, fontFamily: 'Grotesque',color: kWhite))),
                                Container(
                                  height: 60,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    pause: Duration(milliseconds: 0),
                                      animatedTexts: [
                                        RotateAnimatedText(doc['specialist'], textStyle: TextStyle(fontSize: scaleOfWidth * 18, fontFamily: 'Grotesque',color: kStaticMainColor)),
                                        RotateAnimatedText('with', textStyle: TextStyle(fontFamily: 'Grotesque', fontSize: scaleOfWidth * 15, color: kWhite)),
                                        RotateAnimatedText('     ${doc['experience']} years \n experience', textStyle: TextStyle(fontSize: scaleOfWidth * 18, fontFamily: 'Grotesque',color: kOrange)),
                                      ]
                              ),
                                ),
                                        //Text('${doc['specialist']} with\n${doc['experience']} years experience',style: TextStyle(fontSize: 15, fontFamily: 'Grotesque',color: kWhite)),
                                        Container(

                                          child: Row(
                                            children: [
                                              Text('Rating ',style: TextStyle(fontSize: 15, fontFamily: 'Grotesque',color: kWhite)),
                                                  Text(doc['rating'],style: TextStyle(fontSize: 25, fontFamily: 'Grotesque',color: kStaticMainColor)),
                                                  Container(width: 40,height: 40,child: Icon(Icons.star,color: kOrange,)),
                                            ],
                                          ),
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
                            backgroundColor: kStaticMainColor,
                          ),
                        );
                      }),

                ],
              ),
            );
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
