import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../widgets/TaskList.dart';
import '../widgets/add_list_tile.dart';

class TaskScreen extends StatelessWidget {
  static const routeName = '/task_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kStaticMainColor,
        title: Text(
          'Daily medication',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kTextWhiteColor,
              fontSize: 25,
              fontFamily: 'Grotesque'),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(PageRouteBuilder(
            pageBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double>
                secondaryAnimation) {
              return AddListTile();
            },
            transitionsBuilder:
                (BuildContext context,
                Animation<double> animation,
                Animation<double>
                secondaryAnimation,
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
        backgroundColor: kStaticMainColor,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Grotesque'),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
