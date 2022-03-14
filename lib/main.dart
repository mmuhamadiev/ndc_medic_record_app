import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/models/task_data.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'on_generate_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  await notificationService.init();
  await notificationService.requestIOSPermissions();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'My Doc',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //home: OnBoarding(),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoutes.generatedRout,
      ),
    );
  }
}

