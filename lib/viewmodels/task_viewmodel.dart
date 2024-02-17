import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks = [];

  bool isLoading = true;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();

    final List<String>? taskList = prefs.getStringList('taskList');

    for (var task in taskList ?? []) {
      tasks.add(Task.fromJson(task));
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(Task newTask) async {
    tasks.add(newTask);
    await _saveToPref();
    notifyListeners();
  }

  Future<void> upDateTask(Task task) async {
    task.isDone = !task.isDone;
    await _saveToPref();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    tasks.remove(task);
    await _saveToPref();
    notifyListeners();
  }

  Future<void> _saveToPref() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> tasksListString = [];

    for (var task in tasks) {
      tasksListString.add(task.toJson());
    }

    await prefs.setStringList('taskList', tasksListString);
  }
}
