import 'package:flutter/material.dart';
import 'package:flutter_application_4/Screens/add_tasks_screen.dart';
import 'package:flutter_application_4/models/task.dart';
import 'package:flutter_application_4/models/task_data.dart';
import 'package:flutter_application_4/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class Tasksscreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitle) {
                  {
                   // setState(() {
                   //   tasks.add(Task(name: newTaskTitle));
                   //   Navigator.pop(context);
                  //  });
                  }
                }),
              ),
            ),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 206, 40, 164),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Icon(
                Icons.playlist_add_check,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'ToDayDo',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          Text(
            '${Provider.of<TaskData>(context).tasks.length}Tasks.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Taskslist()
        ),
      ),
        ]
        ),
      )
    );
  }
}