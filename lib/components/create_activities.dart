import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class CreateActivities extends StatefulWidget {
  final controller;
  final List <String> imageList;
  String? selectedImage;
  final void Function(String?) onChanged;
  final VoidCallback onSave;
  
  
  CreateActivities({
    super.key,
    required this.controller,
    required this.imageList,
    required this.selectedImage,
    required this.onChanged,
    required this.onSave,
    });
  

  @override
  State<CreateActivities> createState() => _CreateActivitiesState();
}

class _CreateActivitiesState extends State<CreateActivities> {

 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 80,
                child: DropdownButton<String>(
                  hint: Text("Icon"),
                  value: widget.selectedImage,
                  items: widget.imageList.map((img_path) {
                    return DropdownMenuItem(
                      value: img_path,
                      child: Image.asset(
                        img_path,
                        width: 50,
                        height: 50,
                      ),
                    );
                  }).toList(),
                  onChanged: ((value) {
                    setState(() {
                      widget.selectedImage = value;
                    });
                     widget.onChanged(value);
                  })
                  
                 
                ),
              ),
            Expanded(
              child: SizedBox(
                height: 80,
                child: TextField(
                  controller: widget.controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter the Activity",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  ),
                ),
              ),
            ),
            ],
          ), 
        ],
      ),

      actions: [
        MaterialButton(
          onPressed: widget.onSave,
          child: Text("Save", style: TextStyle(color: Colors.white)),
          color: Colors.black,
        ),

        MaterialButton(
          onPressed: (() {}),
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
          color: Colors.black
        )
      ],
    );
  }
  
}

