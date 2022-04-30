import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Text('Our Doctor\'s',style: TextStyle(fontSize: 25, fontFamily: 'Grotesque', fontWeight: FontWeight.bold)),
          DoctorTabView(),
          Text('Our Services', style: TextStyle(fontSize: 25, fontFamily: 'Grotesque', fontWeight: FontWeight.bold)),
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
                        color: kDarkBlue,
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
                            color: kDarkBlue,
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
                            color: kDarkBlue,
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
          ),
        ],
      ),
    );
  }
}
