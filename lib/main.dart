import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/models/task_data.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'on_generate_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService notificationService = NotificationService();
  // await notificationService.init();
  // await notificationService.requestIOSPermissions();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCzl8BTwslZMSLgzxIjy84fGsE9Z1PCNUo",
        authDomain: "ndcmedicrecorapp.firebaseapp.com",
        projectId: "ndcmedicrecorapp",
        storageBucket: "ndcmedicrecorapp.appspot.com",
        messagingSenderId: "1080128359134",
        appId: "1:1080128359134:web:9c5340289332755b45904f")
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('/onBoarding');
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'My Doc',
        initialRoute: isviewed != 0 ? '/' : '/login',
        onGenerateRoute: OnGenerateRoutes.generatedRout,
      ),
    );
  }
}

