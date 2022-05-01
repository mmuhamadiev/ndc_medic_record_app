import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/admin_panel/admin_screen.dart';
import 'package:ndc_medic_record_app/screens/chat_page/chat_screen.dart';
import 'package:ndc_medic_record_app/screens/chat_page/user_list_screen.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/login_page.dart';
import 'package:ndc_medic_record_app/screens/login_registration_page/registration_page.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/MainScreen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/about_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/analysis_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/task_screen.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/main_menu_page.dart';
import 'package:ndc_medic_record_app/screens/onboarding_page/onboard.dart';
import 'package:ndc_medic_record_app/screens/record_page/record_screen.dart';
import 'package:ndc_medic_record_app/screens/record_page/user_list_result_screen.dart';
import 'screens/not_found_page/not_found_page.dart';
import 'screens/login_registration_page/login_page.dart';


class OnGenerateRoutes {
  static Route<dynamic> generatedRout(RouteSettings settings){
    switch(settings.name) {
      case OnBoard.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return OnBoard();
        });
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MainScreen();
        });
      case AdminScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return AdminScreen();
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
      case ChatScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ChatScreen(receiver: settings.arguments.toString(),leading: true);
        });
      case UserListScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return UserListScreen();
        });
      case UserListResultScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return UserListResultScreen();
        });
      case RecordScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) {
          return RecordScreen(receiver: settings.arguments.toString(),leading: true);
        });
      default:
        return MaterialPageRoute(builder: (BuildContext context) {return NotFoundPage();});
    }
  }
}