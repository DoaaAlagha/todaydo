import 'package:flutter/material.dart';
import 'package:flutter_application_4/Screens/add_tasks_screen.dart';
import 'package:flutter_application_4/models/task.dart';
import 'package:flutter_application_4/models/task_data.dart';
import 'package:flutter_application_4/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasksscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    final prefs = SharedPreferences.getInstance();
    final tasks = prefs.getStringList('tasks') ?? [];
    Provider.of<TaskData>(context, listen: false).tasks =
        tasks.map((title) => Task(name: title)).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen((newTaskTitle) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  prefs.setStringList('tasks',
                      Provider.of<TaskData>(context, listen: false)
                          .tasks
                          .map((task) => task.name)
                          .toList());
                  Navigator.pop(context);
                }),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check, size: 40, color: Colors.white),
                SizedBox(width: 40),
                Text(
                  'ToDayDo',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.length} Tasks.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(width: 30),
            Expanded(child: Taskslist()),
          ],
        ),
      ),
    );
  }
}