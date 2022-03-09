import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  String? taskTitle;
  Function(bool?)? checkboxCallback;
  Function() ?longPressCallback;

  TaskTile({required this.taskTitle, this.isChecked = false, this.checkboxCallback, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle ?? '',
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
          value: isChecked,
          onChanged: checkboxCallback,),
    );
  }
}

//
// final bool checkboxState;
// final Function(bool?) toggleCheckboxState;
