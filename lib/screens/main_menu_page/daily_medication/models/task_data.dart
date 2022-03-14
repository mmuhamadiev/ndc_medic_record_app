import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [

  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }
  int _uniqueID = 0;
  int get id {
    return _uniqueID;
  }


  void updateUniqueID() {
    _uniqueID+=1;
    notifyListeners();
  }

  void addTask(String newTaskTitle, int key) {
    final task = Task(name: newTaskTitle, key: key);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
}

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

}