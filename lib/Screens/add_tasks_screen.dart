import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_4/viewmodels/task_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final void Function(Task task) addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            style: TextStyle(
                color: Color.fromARGB(255, 80, 18, 64),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          TextButton(
              onPressed: () =>
                  addTaskCallback(Task(name: newTaskTitle!, isDone: false)),
              child: Text(
                'Add',
                style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 239, 70, 197),
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
