import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {

  static const routeName = '/';

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
            (Route<dynamic> route) => false);
  }

  final onboardingPagesList = [
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset(
        'assets/images/img.png',
        scale: 1.4,
      ),),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset(
        'assets/images/img.png',
        scale: 1.4,
      ),),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset(
        'assets/images/img.png',
        scale: 1.4,
      ),),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: onboardingPagesList,
      onDone: () => _onIntroEnd(context),
      showBackButton: false,
      showSkipButton: false,
      next: const Material(
        color: kStaticMainColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
          child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 25),),
        ),
      ),
      skipOrBackFlex: 0,
      isTopSafeArea: true,
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: kStaticMainColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          )
      ),
      globalFooter: const SizedBox(
        width: double.infinity,
        height: 60,
      ),
      nextStyle: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      doneStyle: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      done: const Material(
        color: kStaticMainColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
          child: Text('Sing-in',style: TextStyle(color: Colors.white,fontSize: 25),),
        ),
      ),
    );
  }
}