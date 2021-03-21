import 'dart:io';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List of Homie Names',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: TimerRow()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class TimerRow extends StatefulWidget {
  @override
  _TimerRowState createState() => _TimerRowState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return Divider();
        final index = i~/2;
        if(index>=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style:_biggerFont,
      ),
      trailing: Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }
    );
  }

  void _pushSaved(){
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            final tiles = _saved.map(
                (WordPair pair){
                  return ListTile(
                    title: Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                },
            );
            final divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text('Saved Names'),
              ),
              body: ListView(children: divided,)
            );
          }
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The title'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class _TimerRowState extends State<TimerRow>{
   List<String> _exercises = <String>[];


  void _seeActive(){
    throw new UnimplementedError();
  }

  Widget _buildTopRow(String value){
    int time = 60;
    return ListTile(
      title: Text(
        value
      ),
      trailing: Text(
          time.toString()
      ),
      onTap: (){
        while(time>0){
          sleep(new Duration(seconds: 1));
          time--;
        }
      },
    );

    //header for the exercise with info about remaining sets
    return null;
  }

  Widget _buildBottomRow(){
    //bottom row which will contain timer inited to 60 s
  }

  Widget _buildWorkout(){
    _exercises.add("Shrugs");
    _exercises.add("Dips");
    _exercises.add("value");

    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _exercises.length,
        itemBuilder: (context, i){
          return _buildTopRow(_exercises[i]);

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Row demos'),
        actions:[
          IconButton(icon: Icon(Icons.list), onPressed: _seeActive),
        ]
      ),
      body: _buildWorkout(),
    );
  }

}


