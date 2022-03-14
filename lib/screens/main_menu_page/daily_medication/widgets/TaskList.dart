import 'package:flutter/material.dart';
import '../models/task_data.dart';
import '../services/notification_service.dart';
import 'taskTile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  NotificationService notificationService = NotificationService();

  Future<void> cancelNotifications(int id) async {
    await notificationService.cancelNotification(id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  print(task.key);
                  cancelNotifications(task.key);
                  taskData.deleteTask(task);
            },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
