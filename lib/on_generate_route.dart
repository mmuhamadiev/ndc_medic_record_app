import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_page.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/registration_page.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/about_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/analysis_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/task_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/main_menu_page.dart';
import 'package:ndc_medic_record_app/screens/onboarding_page/on_boarding_screen.dart';
import 'screens/onboarding_page/on_boarding_screen.dart';
import 'screens/not_found_page/not_found_page.dart';
import 'screens/login_registration_page/login_page.dart';


class OnGenerateRoutes {
  static Route<dynamic> generatedRout(RouteSettings settings){
    switch(settings.name) {
      case OnBoardingPage.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return OnBoardingPage();
        });
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return LoginPage();
        });
      case RegistrationPage.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return RegistrationPage();
        });
      case MainMenuPage.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MainMenuPage();
        });
      case TaskScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return TaskScreen();
        });
      case AnalysisScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return AnalysisScreen();
        });
      case AboutScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return AboutScreen();
        });
      // case DetailsPage.routeName:
      //   return MaterialPageRoute(builder: (BuildContext context) {
      //     final args = settings.arguments as Map<String, dynamic>;
      //     return DetailsPage(payload: args['payload']);
      //   });
      default:
        return MaterialPageRoute(builder: (BuildContext context) {return NotFoundPage();});
    }
  }
}