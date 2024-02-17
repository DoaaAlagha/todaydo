import 'package:flutter/material.dart';
import 'package:flutter_application_4/Screens/add_tasks_screen.dart';
import 'package:flutter_application_4/viewmodels/task_viewmodel.dart';
import 'package:flutter_application_4/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class Tasksscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<TaskViewModel>();
    viewModel.init();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen(
                  (newTaskTitle) {
                    viewModel.addTask(newTaskTitle);

                    Navigator.pop(context);
                  },
                ),
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
              '${viewModel.tasks.length} Tasks.',
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
