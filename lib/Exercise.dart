import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const int defaultTimerValue = 5;

class Exercise extends StatefulWidget {
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  String name;
  String time;

  Timer t;

  Exercise(String name) {
    this.name = name;

    this.t = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        time = DateTime
            .now()
            .second
            .toString();
      });
    });


    Text getName() {
      return Text(name);
    }

  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: Text(time),
    );
  }

}