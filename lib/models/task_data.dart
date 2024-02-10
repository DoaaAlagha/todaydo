import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: 'go shopping'),
    Task(name: 'go hospital'),
    Task(name: 'praying'),
  ];

}