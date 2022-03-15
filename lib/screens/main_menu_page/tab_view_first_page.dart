import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/doctor_tab_view.dart';
import '../../constraints.dart';

class FirstTabView extends StatefulWidget {
  const FirstTabView({Key? key}) : super(key: key);

  @override
  State<FirstTabView> createState() => _FirstTabViewState();
}

class _FirstTabViewState extends State<FirstTabView> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text('Our Doctor\'s'),
          DoctorTabView(),
          Text('Our Services'),
          Expanded(
            flex: 4,
            child:  SingleChildScrollView(
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 45,
                      height: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kStaticMainColorOpacity,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text('Daily Medication'),
                            trailing: IconButton(onPressed: () {Navigator.pushNamed(context, '/task_screen');}, icon: Icon(Icons.arrow_forward,size: 40,)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kStaticMainColorOpacity,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(child: Text('Analysis List')),
                              ),
                              IconButton(onPressed: () {Navigator.pushNamed(context, '/analysis_screen');}, icon: Icon(Icons.analytics_outlined,size: 40,)),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kStaticMainColorOpacity,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(child: Text('About Us')),
                              ),
                              IconButton(onPressed: () {Navigator.pushNamed(context, '/about_screen');}, icon: Icon(Icons.menu_book_outlined,size: 40,)),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
            ),
            // TabBarView(controller: _tabController1,children: [
            //   Container(
            //     height: double.infinity,
            //     width: MediaQuery.of(context).size.width - 20,
            //     margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(40),
            //           topRight: Radius.circular(40)),
            //     ),
            //     child: TaskScreen(),
            //   ),
            //   Container(
            //     height: double.infinity,
            //     width: MediaQuery.of(context).size.width - 20,
            //     margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(40),
            //           topRight: Radius.circular(40)),
            //     ),
            //     child: Column(
            //       children: [
            //         Text('Analysis List',style: TextStyle(
            //             fontSize: 30,
            //             backgroundColor: Colors.grey.shade200
            //         ),),
            //         Expanded(
            //           child: CustomScrollView(
            //             shrinkWrap: true,
            //             slivers: [
            //               CupertinoSliverNavigationBar(
            //                 largeTitle: Text('Lab'),
            //                 backgroundColor: Colors.transparent,
            //               ),
            //               SliverList(delegate: SliverChildListDelegate(
            //                   [
            //                     for (var item in listData) item,
            //                   ]
            //               ),),
            //               CupertinoSliverNavigationBar(
            //                 largeTitle: Text('USI'),
            //                 backgroundColor: Colors.transparent,
            //               ),
            //               SliverList(delegate: SliverChildListDelegate(
            //                   [
            //                     for (var item in listData) item,
            //                   ]
            //               ),),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   Container(
            //     height: double.infinity,
            //     width: MediaQuery.of(context).size.width - 20,
            //     margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(40),
            //           topRight: Radius.circular(40)),
            //     ),
            //     child: ListView(
            //       children: [
            //         Column(
            //           children: [
            //             Text('About clinic',textAlign: TextAlign.center,),
            //             Text('History',textAlign: TextAlign.left,),
            //             Container(
            //               width: 350,
            //               height: 150,
            //               margin: EdgeInsets.all(10),
            //               decoration: BoxDecoration(
            //                 color: kStaticMainColorOpacity,
            //                 borderRadius: BorderRadius.circular(30),
            //               ),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(10.0),
            //                 child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.'),
            //               ),
            //             ),
            //             Text('Contacts',textAlign: TextAlign.left,),
            //             Container(
            //               width: 350,
            //               height: 150,
            //               margin: EdgeInsets.all(10),
            //               decoration: BoxDecoration(
            //                 color: kStaticMainColorOpacity,
            //                 borderRadius: BorderRadius.circular(30),
            //               ),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(10.0),
            //                 child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.'),
            //               ),
            //             ),
            //             Text('Location',textAlign: TextAlign.left,),
            //
            //             Container(
            //               width: 350,
            //               height: 400,
            //               child: GoogleMap(
            //                 tiltGesturesEnabled: false,
            //                 rotateGesturesEnabled: false,
            //                 scrollGesturesEnabled: false,
            //                 zoomControlsEnabled: false,
            //                 zoomGesturesEnabled: false,
            //                 myLocationButtonEnabled: false,
            //                 compassEnabled: false,
            //                 mapType: MapType.hybrid,
            //                 initialCameraPosition: _kGooglePlex,
            //                 onMapCreated: (GoogleMapController controller) {
            //                   _controller.complete(controller);
            //                 },
            //               ),
            //             ),
            //
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ]),
          ),
        ],
      ),
    );
  }
}
