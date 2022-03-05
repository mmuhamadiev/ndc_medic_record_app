import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding_page/on_boarding_screen.dart';
import 'on_generate_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Doc',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      onGenerateRoute: OnGenerateRoutes.generatedRout,
    );
  }
}

