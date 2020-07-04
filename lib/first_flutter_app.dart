import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'List of Homie Names',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List of Homie Names'),
        ),
        body: const Center(
          child: const Text('My homeboy'),
        ),
      ),
    );
  }
}