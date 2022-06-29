import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String _taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                  'Add task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                onChanged: (text){
                  _taskTitle = text;
                },
              ),
              const SizedBox(height: 20.0,),
              MaterialButton(
                color: Colors.lightBlueAccent,
                child: const Text('Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  ),
                ),
                  onPressed: (){
                  print(_taskTitle);
                    Provider.of<TaskData>(context, listen: false).addTask(_taskTitle);
                    Navigator.pop(context);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
