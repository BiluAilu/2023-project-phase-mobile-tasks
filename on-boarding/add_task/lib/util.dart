import 'dart:math';

import 'package:flutter/material.dart';



class Task {
  final String date;
  final String title;
  final Color color;
  final String description;

  Task(this.date, this.title, this.color,{this.description=""});
}

List<Task> tasks=[Task('April 29 2023', 'UI/UX', Colors.black)];


Color getRandomColor() {
  final Random random = Random();
  final int red = random.nextInt(256); // 0-255
  final int green = random.nextInt(256); // 0-255
  final int blue = random.nextInt(256); // 0-255
  return Color.fromRGBO(red, green, blue, 1.0);
}