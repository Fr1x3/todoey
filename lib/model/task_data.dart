import 'package:flutter/material.dart';
import 'Task.dart';

class TaskData with ChangeNotifier{
  List<Task> _tasks = [
    Task('Buy milk'),
    Task('Buy eggs'),
    Task("Buy meat"),
  ];

  List<Task> get tasks{
    return _tasks;
  }

  int tasksCount() => _tasks.length;

  void addTask(String taskTitle){
    _tasks.add(Task(taskTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}