import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: 'go shopping'),
    Task(name: 'go hospital'),
    Task(name: 'praying'),
  ];
  void addTask(String newTaskTitle){
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }
void upDateTask(Task task){
  task.doneChange();
  notifyListeners();
}
void deleteTask(Task task){
  tasks.remove(task);
  notifyListeners();
}
}