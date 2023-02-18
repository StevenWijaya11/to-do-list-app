import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_list/pages/list_task.dart';




class ListofTile extends StatelessWidget {
  String leading;
  String title;
  String subtitle;

  ListofTile({
      super.key,
      required this.leading,
      required this.title,
      required this.subtitle
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => ListTask(
              
            )
          )
        );
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),  
                spreadRadius: 5,
                blurRadius: 10,
              )
            ]
          ),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              child: Image.asset(leading)),
            title: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),
            ),
            subtitle: Text(subtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ),
        ),
      ),
    );
  }
}