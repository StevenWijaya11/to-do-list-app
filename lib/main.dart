import 'package:flutter/material.dart';
import 'package:to_do_list/pages/get_started.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/pages/list_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}