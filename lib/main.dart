import 'package:flutter/material.dart';
import 'package:flutter_application_4/Screens/tasks_screen.dart';
import 'package:flutter_application_4/viewmodels/task_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        home: Tasksscreen(),
      ),
    );
  }
}
