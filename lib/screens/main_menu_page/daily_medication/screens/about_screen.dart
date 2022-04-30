import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constraints.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about_screen';

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kStaticMainColor,
        title: Text(
          'About Clinic'
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot>(
            future:
            FirebaseFirestore.instance.collection('aboutClinic').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents =
                    snapshot.data!.docs;
                return Column(
                    children: documents
                        .map((doc) => Column(
                      children: [
                        Text('History',textAlign: TextAlign.left,),
                        Container(
                          width: 350,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kStaticMainColorOpacity,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(doc['history']),
                          ),
                        ),
                        Text('Contacts',textAlign: TextAlign.left,),
                        Container(
                          width: 350,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kStaticMainColorOpacity,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(doc['contacts']),
                          ),
                        ),
                        Text('Location',textAlign: TextAlign.left,),
                        Container(
                          width: 300,
                          height: 300,
                          child: GoogleMap(
                            buildingsEnabled: false,
                            mapToolbarEnabled: false,
                            tiltGesturesEnabled: false,
                            rotateGesturesEnabled: false,
                            scrollGesturesEnabled: false,
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: false,
                            myLocationButtonEnabled: false,
                            compassEnabled: false,
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(doc['latitude'], doc['longitude']),
                              zoom: 14.4746,
                            ),
                          ),
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
      ),
    );
  }
}