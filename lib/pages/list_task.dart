import 'package:flutter/material.dart';
import 'package:to_do_list/components/create_task.dart';
import 'package:to_do_list/components/task_tile.dart';
import 'package:hive/hive.dart';


class ListTask extends StatefulWidget {
  
  
  
  const ListTask({
    super.key,
    });

  get task => null;

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  final taskNameController = TextEditingController();
  
  List list_task = [
    //Task Name, Value
    ["Go to gym", false],
    ["Clean a bedroom", false],
    ["Write a blog post", false],  
  ];

  void checkBoxTapped(bool? value, int index) {
      setState(() {
        list_task[index][1] = value;
      });  
    }

   void create_task () {
    showDialog(
      context: context,
      builder: (context) {
        return CreateTask(
         controller: taskNameController,
         hintText: "Enter Your Task",
         onSave: saveTask,
         onCancel: cancelDialog,
        );
      },
    );
  }


  void saveTask() {
    setState(() {
      list_task.add([taskNameController.text, false]);
    });
    taskNameController.clear();
    Navigator.of(context).pop(); 
  }

  void saveChangedTask( int index){
    setState(() {
      list_task[index][0] = taskNameController.text;
    });
    Navigator.pop(context);
    taskNameController.clear();
  }

  void cancelDialog() {
    taskNameController.clear();
    Navigator.pop(context);
  }


  void editTask (int index) {
    showDialog(
      context: context,
      builder: ((context) {
        return CreateTask(
          controller: taskNameController,
          hintText: list_task[index][0],
          onSave: () => saveChangedTask(index),
          onCancel: cancelDialog,
        );
      })
    );
  }

  void deleteTask (int index) {
    setState(() {
      list_task.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(0, 199, 183, 19),
          onPressed: create_task,
          child: Icon(Icons.add),
          ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * 65/100 ,
            left: -MediaQuery.of(context).size.width * 1/4,
            child: Container(
                width: MediaQuery.of(context).size.width * 3/2,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(249, 234, 132, 1)
                ),
              ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical:10),
              child: SafeArea(
                child: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Color.fromRGBO(75, 75, 75, 1),  
                  )
                  ,
              ),
            ),
          ),

          SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40,MediaQuery.of(context).size.height * 15/100,40,30),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("lib/image/woman.png", height: 60, width: 60,),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Planned Activity",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                        Text("3 Tasks",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ],)
                  ],
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: ListView.builder(
                    itemCount: list_task.length,
                    itemBuilder: (context, index) {
                      return TaskTile(
                        taskName: list_task[index][0],
                        taskCompleted: list_task[index][1],
                        onchanged: (value) {checkBoxTapped(value, index,);},
                        SettingTapped: (context) => editTask(index),
                        DeleteTapped: (context) =>deleteTask(index),
                      );     
                   },
                  ),
                )
              ]),
          ),
        ),]
      ),
    );
  }
}