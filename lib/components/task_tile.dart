import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?) ? onchanged;
  final Function(BuildContext)? SettingTapped;
  final Function(BuildContext)? DeleteTapped;

  const TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onchanged,
    required this.SettingTapped,
    required this.DeleteTapped,
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: SettingTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
              ),

            SlidableAction(
              onPressed: DeleteTapped,
              backgroundColor: Colors.red.shade800,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              ),
             
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(0.9),    
              )
            ]
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onchanged,
              ),
      
              Text(taskName)
            ],
          ),
        ),
      ),
    );
  }
}