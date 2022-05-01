import 'package:ndc_medic_record_app/screens/login_registration_page/login_page.dart';
import 'package:ndc_medic_record_app/screens/onboarding_page/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constraints.dart';

class OnBoard extends StatefulWidget {
  static const routeName = '/';

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/Hospital-building-bro.png',
      text: "Register into MyDoc app",
      desc:
          "Get registered into the application, find doctors, list of analysis and more to take care of yourself with us",
    ),
    OnboardModel(
      img: 'assets/images/Medical-prescription-pana.png',
      text: "Get or Save results in one place",
      desc:
          "Keep the analysis record history in one app and help doctor to understand more about you",
    ),
    OnboardModel(
      img: 'assets/images/Reminders-bro.png',
      text: "Take medicine on time",
      desc:
          "Set the time for taking the medicine and get daily notifications, by managing your treatment in that easy way",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('/onBoarding', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStaticOnboardingBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kStaticOnboardingBgColor,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return LoginPage();
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
                    transitionDuration: Duration(milliseconds: 1000),
                  ),
                  (Route<dynamic> route) => false);
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                color: kBlack,
                fontFamily: 'Grotesque',
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? currentIndex == 1
                                          ? kOrange
                                          : kStaticMainColor
                                      : currentIndex == 1
                                          ? kDarkBlue
                                          : kStaticMainColorOpacity,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Grotesque',
                      color: kBlack,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 2,
                      fontSize: 15.0,
                      fontFamily: 'Grotesque',
                      color: kBlack,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
                      ),
                      backgroundColor: MaterialStateProperty.all(currentIndex == 1? kOrange: kStaticMainColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return LoginPage();
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
                              transitionDuration: Duration(milliseconds: 1000),
                            ),
                            (Route<dynamic> route) => false);
                      }
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        index == screens.length - 1 ? 'Login' : 'Next',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Grotesque',
                            color: kWhite),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: kWhite,
                      )
                    ]),
                  )
                ],
              );
            }),
      ),
    );
  }
}
