import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/doctor_tab_view.dart';

import '../../constraints.dart';
import 'daily_medication/screens/task_screen.dart';

class FirstTabView extends StatefulWidget {
  const FirstTabView({Key? key}) : super(key: key);

  @override
  State<FirstTabView> createState() => _FirstTabViewState();
}

class _FirstTabViewState extends State<FirstTabView> with TickerProviderStateMixin{

  // Completer<GoogleMapController> _controller = Completer();
  //
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  late TabController _tabController1;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var listData = List.generate(
    10,
        (index) => Column(
      children: [
        Container(
          height: 65,
          child: ListTile(
            title: Text(index.toString()),
            trailing: Text('4\$'),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black45,
        ),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(
        length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Our Doctor\'s'),
        DoctorTabView(),
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 300,
                height: 200,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kStaticMainColorOpacity,
                  borderRadius: BorderRadius.circular(30),
                ),
                //color: kStaticMainColorOpacity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/male.png',
                          scale: 1.4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Doctor Name'),
                        Text('Doctor information'),
                      ],
                    ),
                  ],
                ),
              ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/male.png',
                          scale: 1.4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Doctor Name'),
                        Text('Doctor information'),
                      ],
                    ),
                  ],
                ),
              ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/male.png',
                          scale: 1.4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Doctor Name'),
                        Text('Doctor information'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: TabBarView(controller: _tabController1,children: [
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: TaskScreen(),
            ),
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Text('Analysis List',style: TextStyle(
                      fontSize: 30,
                      backgroundColor: Colors.grey.shade200
                  ),),
                  Expanded(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        CupertinoSliverNavigationBar(
                          largeTitle: Text('Lab'),
                          backgroundColor: Colors.transparent,
                        ),
                        SliverList(delegate: SliverChildListDelegate(
                            [
                              for (var item in listData) item,
                            ]
                        ),),
                        CupertinoSliverNavigationBar(
                          largeTitle: Text('USI'),
                          backgroundColor: Colors.transparent,
                        ),
                        SliverList(delegate: SliverChildListDelegate(
                            [
                              for (var item in listData) item,
                            ]
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: ListView(
                children: [
                  Column(
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

                      // Container(
                      //   width: 350,
                      //   height: 400,
                      //   child: GoogleMap(
                      //     tiltGesturesEnabled: false,
                      //     rotateGesturesEnabled: false,
                      //     scrollGesturesEnabled: false,
                      //     zoomControlsEnabled: false,
                      //     zoomGesturesEnabled: false,
                      //     myLocationButtonEnabled: false,
                      //     compassEnabled: false,
                      //     mapType: MapType.normal,
                      //     initialCameraPosition: _kGooglePlex,
                      //     onMapCreated: (GoogleMapController controller) {
                      //       _controller.complete(controller);
                      //     },
                      //   ),
                      // ),

                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
