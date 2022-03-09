import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';


class AddListTile extends StatelessWidget {

  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {Navigator.pop(context);},
        child: Container(
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),),
            color: Color.fromRGBO(235, 235, 235, 100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Add task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kStaticMainColor,
                      fontSize: 40,
                  fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kStaticMainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kStaticMainColor),
                    ),
                  ),
                  cursorColor: kStaticMainColor,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    if(newTaskTitle == null) {
                      Navigator.pop(context);
                    }
                    else {
                      Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle?? '');
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kStaticMainColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
