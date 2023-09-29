import 'dart:math';

import 'package:flutter/material.dart';



class Task {
  final String date;
  final String title;
  final Color color;
  final String description;

  Task(this.date, this.title, this.color, {this.description=""});
}

List<Task> tasks=[
  Task('April 29 2023', 'Task 1 name', Colors.black,description: "Task 1 description"),
  Task('May 9 2023', 'Task 2 name', Color.fromARGB(255, 2, 28, 222),description: "Task 2 description")
  
  ];


Color getRandomColor() {
  final Random random = Random();
  final int red = random.nextInt(256); 
  final int green = random.nextInt(256);
  final int blue = random.nextInt(256); 
  return Color.fromRGBO(red, green, blue, 1.0);
}