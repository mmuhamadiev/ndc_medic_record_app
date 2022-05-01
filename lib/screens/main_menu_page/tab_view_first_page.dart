import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/about_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/analysis_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/task_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/doctor_tab_view.dart';
import '../../constraints.dart';

class FirstTabView extends StatefulWidget {
  const FirstTabView({Key? key}) : super(key: key);

  @override
  State<FirstTabView> createState() => _FirstTabViewState();
}

class _FirstTabViewState extends State<FirstTabView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10,),
          DoctorTabView(),
          SizedBox(height: 10,),
          Text('Our Services',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Grotesque',
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 170,
                        height: 170,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(kOrange),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                              backgroundColor: MaterialStateProperty.all(kWhite),
                              elevation: MaterialStateProperty.all(10)
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return AnalysisScreen();
                                  },
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
                                    return Align(
                                      child: SizeTransition(
                                        sizeFactor: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                  Duration(milliseconds: 1000),
                                ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(margin: EdgeInsets.only(top: 10),child: Text('Analysis List', style: TextStyle(
                                fontSize: 15, fontFamily: 'Grotesque',color: kBlack
                              ),)),
                              Image.asset('assets/images/AIDS Research-pana.png'),
                            ],
                          )
                        ),
                      ),
                      Container(
                        width: 170,
                        height: 170,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(kOrange),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                                backgroundColor: MaterialStateProperty.all(kWhite),
                                elevation: MaterialStateProperty.all(10)
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return TaskScreen();
                                    },
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return Align(
                                        child: SizeTransition(
                                          sizeFactor: animation,
                                          child: child,
                                        ),
                                      );
                                    },
                                    transitionDuration:
                                    Duration(milliseconds: 1000),
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(margin: EdgeInsets.only(top: 10),child: Text('Daily medications', style: TextStyle(
                                    fontSize: 15, fontFamily: 'Grotesque',color: kBlack
                                ),)),
                                Image.asset('assets/images/First-aid-kit-bro.png'),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 170,
                        height: 170,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(kOrange),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                                backgroundColor: MaterialStateProperty.all(kWhite),
                                elevation: MaterialStateProperty.all(10)
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return AboutScreen();
                                    },
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return Align(
                                        child: SizeTransition(
                                          sizeFactor: animation,
                                          child: child,
                                        ),
                                      );
                                    },
                                    transitionDuration:
                                    Duration(milliseconds: 1000),
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(margin: EdgeInsets.only(top: 10),child: Text('About us', style: TextStyle(
                                    fontSize: 15, fontFamily: 'Grotesque',color: kBlack
                                ),)),
                                Image.asset('assets/images/Doctors-pana.png'),
                              ],
                            )
                        ),
                      ),
                      Container(
                        width: 170,
                        height: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: AnimatedTextKit(repeatForever: true,animatedTexts: [
                                TyperAnimatedText('in Process', textStyle: TextStyle(
                                    fontSize: 15, fontFamily: 'Grotesque',color: kBlack
                                ),),
                              ]),
                            ),
                            SizedBox(width: 130,height: 130,child: Image.asset('assets/images/Mobile-development-bro.png')),
                          ],
                        )
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
