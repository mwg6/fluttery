import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const int defaultTimerValue = 5;

class Exercise extends StatefulWidget {
  final String name;
  const Exercise(this.name);
  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  String name;
  int time;

  Timer t;

  _ExerciseState() {
    time = defaultTimerValue;


  }

  void startTimer(){
    this.t = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if(time>0){
          time--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      trailing: Text(time.toString()),
      onTap: startTimer,
    );
  }

}