import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_4/models/task_data.dart';

class Taskslist extends StatelessWidget {
  const Taskslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
            itemCount: TaskData.tasks.length,
            itemBuilder: (context, index) {
              return TaskTitle(
                isChecked: TaskData.tasks[index].isDone,
                taskTitle: TaskData.tasks[index].name,
                CheckboxChange: (newvalue) {
                  TaskData.upDateTask(TaskData.tasks[index]);
                },
                listTileDelete: () {
                  TaskData.deleteTask(TaskData.tasks[index]);
                },
              );
            },
            );
      },
    );
  }
}
