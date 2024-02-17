import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_4/viewmodels/task_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Taskslist extends StatelessWidget {
  const Taskslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading)
          return const Center(child: CircularProgressIndicator());

        if (viewModel.tasks.isEmpty)
          return const Center(child: Text('No Tasks Yet'));

        return ListView.builder(
          itemCount: viewModel.tasks.length,
          itemBuilder: (context, index) {
            return TaskTitle(
              isChecked: viewModel.tasks[index].isDone,
              taskTitle: viewModel.tasks[index].name,
              CheckboxChange: (newvalue) {
                viewModel.upDateTask(viewModel.tasks[index]);
              },
              listTileDelete: () {
                viewModel.deleteTask(viewModel.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
