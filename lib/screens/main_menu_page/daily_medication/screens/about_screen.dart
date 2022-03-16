import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constraints.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about_screen';

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
        child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                          child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.'),
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
                          child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.'),
                        ),
                      ),
                      Text('Location',textAlign: TextAlign.left,),

                      Container(
                        width: 350,
                        height: 400,
                        child: GoogleMap(
                          tiltGesturesEnabled: false,
                          rotateGesturesEnabled: false,
                          scrollGesturesEnabled: false,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          myLocationButtonEnabled: false,
                          compassEnabled: false,
                          mapType: MapType.hybrid,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ],
                  ),
          ),
      ),
    );
  }
}
