import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

class MyDailyMedication extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(home: TaskScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
