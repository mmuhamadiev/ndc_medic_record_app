import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('aboutClinic').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final aboutClinic = snapshot.data.docs;
          List values = [];
          for (var about in aboutClinic) {
            final history = about.data()['history'];
            final contacts = about.data()['contacts'];
            final latitude = about.data()['latitude'];
            final longitude = about.data()['longitude'];
            values.add(history);
            values.add(contacts);
            values.add(latitude);
            values.add(longitude);
          }

          return AboutClinic(lat: values[2], lon: values[3], history: values[0], contacts: values[1]);
        },
      ),
    );
  }
}

class AboutClinic extends StatelessWidget {

  double lat, lon;
  String history, contacts;

  AboutClinic({required this.lat,required this.lon, required this.history, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('About clinic',textAlign: TextAlign.center,),
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
          child: Text(history),
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
            child: Text(contacts),
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
              target: LatLng(lat, lon),
              zoom: 14.4746,
            ),
          ),
        ),
      ],
    );
  }
}
