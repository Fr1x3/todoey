import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

import '../model/Task.dart';

class TasksList extends StatefulWidget {

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (context, taskData, child){
          return ListView.builder(itemBuilder: (context, index){
            final task = taskData.tasks[index];
            return TaskTile(
                task.name,
                task.isDone,
                handleCheckboxState: (checkbox){taskData.updateTask(task);},
                longPressCallback: (){
                  taskData.deleteTask(task);
                },
            );
          }, itemCount: taskData.tasksCount());
        }
    );
  }
}

