import 'package:flutter/material.dart';

import 'package:to_do_list/components/create_activities.dart';
import 'package:to_do_list/components/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final activity_name = TextEditingController();

  final activities = [
    //Picture, title, subtitle
    ["lib/image/calendar.png", "Planned Activity", " 5 Tasks" ],
    ["lib/image/school.png", "Studying", " 3 Tasks" ],
    ["lib/image/shopping-basket.png", "Grocery", " 7 Tasks" ]
  ];


   List <String> imageList = [
      "lib/image/calendar.png",
      "lib/image/shopping-basket.png",
      "lib/image/school.png",
   ];

   String? selectedImage;



  void create_activity () {
    showDialog(
      context: context,
      builder: (context) {
        return CreateActivities(
          controller: activity_name,
          imageList: imageList,
          selectedImage: selectedImage,
          onChanged: _onImageChanged,
          onSave: save_task,
        );
      },
    );
  }

  void  _onImageChanged(String? newValue) {
    setState(() {
      selectedImage = newValue;
    });
  }

  void save_task() {
    setState(() {
      activities.add([selectedImage!, activity_name.text, " 5 Tasks" ]);
      
    });
    activity_name.clear();
    Navigator.of(context).pop(); 
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: FloatingActionButton(
              backgroundColor: Color.fromRGBO(0, 199, 183, 19),
              onPressed: create_activity ,
              child: Icon(Icons.add),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.width * 2 ,
            left: -MediaQuery.of(context).size.width * 1/4,
            child: Container(
                width: MediaQuery.of(context).size.width * 3/2,
                height: MediaQuery.of(context).size.height * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(249, 234, 132, 1)
                ),
              ),
          ),
          SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(        
                          "Hello Ender",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                        SizedBox(height: 5,),
                        Text(
                          "Today you have 4 tasks",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                          )
                      ],
                    ),
                    Image.asset("lib/image/woman.png", height: 60, width: 70,)
                  ],
                ),
            
                SizedBox(height: 20,),
            
                Expanded(
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return ListofTile(
                        leading: activities[index][0],
                        title: activities[index][1],
                        subtitle: activities[index][2],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),]
      )
    );
  }
}
