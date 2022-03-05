import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_page.dart';
import 'package:onboarding/onboarding.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class OnBoarding extends StatefulWidget {

  static const routeName = '/';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 45.0, top: 40),
            child: Image.asset(
              'assets/images/img.png',
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Func',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            width: double.infinity,
            child: const Text(
              'Func desctiption',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            width: double.infinity,
            child: const Text(
              'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 45.0, top: 40),
            child: Image.asset(
              'assets/images/img.png',
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Func',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            width: double.infinity,
            child: const Text(
              'Func desctiption',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            width: double.infinity,
            child: const Text(
              'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 45.0, top: 40),
            child: Image.asset(
              'assets/images/img.png',
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Func',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            width: double.infinity,
            child: const Text(
              'Func desctiption',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            width: double.infinity,
            child: const Text(
              'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(
        background: Colors.white,
        proceedButtonStyle: ProceedButtonStyle(
            proceedpButtonText: const Text('Sign-in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                )),
            proceedButtonColor: kStaticMainColor,
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
                    (route) => false,
              );
            },),
        pages: onboardingPagesList,
        skipButtonStyle: const SkipButtonStyle(
          skipButtonColor: kStaticMainColor,
          skipButtonText: Text(
            'Skip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),

        ),
        footerPadding: const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 60.0),
        indicator: Indicator(
          activeIndicator: const ActiveIndicator(
            color: Color(0xff000000),
          ),
          closedIndicator: const ClosedIndicator(
            color: Color(0xff4ECF42),
          ),
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygonRadius: 8,
              polygonSpacer: 25.0,
              polygon: DesignType.polygon_circle,
            ),
          ),
        ),
      ),
    );
  }
}
