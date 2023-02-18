import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_list/pages/home_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(
                  "lib/image/logo.jpg",
                  ),
                )
              ),
            SizedBox(height: 70,),

            Text(
              "Master Your To-Do List",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
                ),
              ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
               "Stay organized and on top of your tasks with TaskTick." +
               " The intuitive to-do list application that simplifies your workflow and maximizes your productivity.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                   
                  
                  ),
                ),
            ),

            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 199, 183, 19),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                          )
                        )
                      ),
                ),
              ),
            )
          ]),
      ),
    );
  }
}