import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
    'Something called a camp',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    ) ,
    Text(
    'Some made up town',
    style: TextStyle(
    color: Colors.grey[500],
    ),
    ),
    ] ,
    ),
    ),
    Icon(
    Icons.star,
        color: Colors.red[500],
    ),
    Text('41'),
    ],
    ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Containter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL')
          _buildButtonColumn(color, Icons.near_me, 'ROUTE')
          _buildButtonColumn(color, Icons.share, 'SHARE')
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'TEXT DESCRIBING THE BULLSHHIT LAKE',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Demo app',
      home: Scaffold{
        appBar: AppBar(
        title: Text('Flutter Cummies'),
    ),
    body:ListView(
    children:[
      Image.asset(
    'null',name
    width: 600,
    height: 240,
    fit: BoxFit.cover,
    ),
    titleSection,
    buttonSection,
    textSection,
    ],
    ),

      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label){
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color:color),
            Container(
              margin:const EdgeInsets.only(top:8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        );
    }
}