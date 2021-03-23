import 'dart:io';

import 'package:flutter/cupertino.dart';

const int defaultTimerValue = 5;

class Exercise {
  String name;
  int time;

  Exercise(String name, int time){
   this.name = name;
   this.time = time;
  }

  Exercise.noTime(String name){
    this.name = name;
    this.time = defaultTimerValue;
  }

  Text getName(){
    return Text(name);
  }

  int getTime(){
    return time;
  }

  void setTime(int time){
    this.time = time;
  }

  void startTime(){
    while(time>=0){
      sleep(Duration(seconds: 1));
      time-=1;
    }
  }
}