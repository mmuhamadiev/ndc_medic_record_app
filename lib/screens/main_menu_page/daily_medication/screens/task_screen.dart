import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../widgets/TaskList.dart';
import '../widgets/add_list_tile.dart';

class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showModalBottomSheet(
          //   context: context,
          //   builder: (BuildContext context) => AddListTile(),
          // );
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddListTile()));
        },
        backgroundColor: kStaticMainColor,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Daily medication',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: TextStyle(color: Colors.black, fontSize: 18),
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
    );
  }
}
