import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_4/models/task_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
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
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                prefs.setStringList(
                    'tasks',
                    Provider.of<TaskData>(context, listen: false)
                        .tasks
                        .map((task) => task.name)
                        .toList());
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 206, 40, 164),
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
