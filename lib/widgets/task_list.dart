import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  
 final bool isChecked ;
 final String taskTitle;
 final void Function(bool?)CheckboxChange;
 final void Function()listTileDelete;

 TaskTitle(
  {required this.isChecked,
  required this.taskTitle,
  required this.CheckboxChange,
  required this.listTileDelete});
 
 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
trailing: Checkbox(
  activeColor: Colors.pink,
  value: isChecked,
  onChanged: CheckboxChange,
),
onLongPress: listTileDelete,      
    );
  }
  }


