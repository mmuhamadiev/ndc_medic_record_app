import 'dart:async';
import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constraints.dart';

class AboutScreen extends StatefulWidget {
  static const routeName = '/about_screen';

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final _firestore = FirebaseFirestore.instance;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kStaticMainColor,
        title: Text('About Clinic',
            style: TextStyle(fontSize: 25, fontFamily: 'Grotesque')),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('aboutClinic').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return Column(
                    children: documents
                        .map((doc) => Column(
                              children: [
                                Card(
                                  margin: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: kDarkBlue,
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text('History',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: kWhite,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Grotesque')),
                                        Text(doc['history'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: kWhite,
                                                fontFamily: 'Grotesque')),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  margin: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: kDarkBlue,
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text('Contacts & Address',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: kWhite,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Grotesque')),
                                        Text('Address: ${doc['address']}\n\nTel. number: ${doc['contacts']}\n\nEmail: ${doc['email']}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: kWhite,
                                                fontFamily: 'Grotesque')),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  'Location',
                                  textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: kBlack,
                                        fontFamily: 'Grotesque')
                                ),
                                Container(
                                  width: 300,
                                  height: 300,
                                  child: GoogleMap(
                                    markers: _markers,
                                    buildingsEnabled: false,
                                    mapToolbarEnabled: false,
                                    tiltGesturesEnabled: false,
                                    rotateGesturesEnabled: false,
                                    scrollGesturesEnabled: false,
                                    myLocationButtonEnabled: false,
                                    compassEnabled: false,
                                    mapType: MapType.normal,
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          doc['latitude'], doc['longitude']),
                                      zoom: 14.4746,
                                    ),
                                    onMapCreated: (GoogleMapController controller) async{
                                      _controller.complete(controller);
                                      final Uint8List markerIcon = await getBytesFromAsset('assets/images/hospital.png', 200);
                                      setState(() {
                                        _markers.add(
                                            Marker(
                                                markerId: MarkerId('<MARKER_ID>'),
                                                position: LatLng(
                                                    doc['latitude'], doc['longitude']),
                                                icon: BitmapDescriptor.fromBytes(markerIcon)
                                            )
                                        );
                                      });
                                    },
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
                  backgroundColor: kStaticMainColor,
                ),
              );
            }),
      ),
    );
  }
}
