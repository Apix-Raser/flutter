import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

import 'color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //var color =  TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}
class NumberedWord extends StatelessWidget{
  final String wordPair;
  final int i;
  var color;



  NumberedWord(this.i, this.wordPair, this.color);

  @override
  Widget build(BuildContext context) {
    /*if(color == null){
      color = Colors.blue;
    }*/
    //print('NBW dcolor: $color');


   return Row(
     children: <Widget>[

       Text(this.i.toString(), style: TextStyle(color: color)),
       Text(this.wordPair, style: const TextStyle(fontSize: 18)),
     ],
   );

  }
}

class RandomWords extends StatefulWidget {
  //var color;
  //RandomWords(this.color);
  //_RandomWordsState createState() => _RandomWordsState(color);
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _suggestions = <WordPair> [];
  final _biggerFont = const TextStyle(fontSize: 18);
  late Future<int> _color;
  int _colorint =0;
  //_RandomWordsState(this.color);


  @override
  void initState() {
    super.initState();

    _color =  _prefs.then((SharedPreferences prefs){
      return (prefs.getInt('color') ?? Colors.blue.value);
    });
    _color.then((c){
      _colorint = c;
    });

  }

  Widget _buildRow(int i, WordPair pair)  {

   // print('buildRow color: $color');


     //await _color.then((c) {
      // color = c;
      // print('c: $c');
     //});

    // print('buildRow before color: $color');
    // _color.then((c){
    //   color = c;
    // });
    // print('buildRow after color: $color');

    return ListTile(
      // On compose ici la ligne en deux pour avoir une couleur différente
      // entre le nombre et les mots
      title: NumberedWord(i, pair.asCamelCase, Color(_colorint)),
    );
  }
  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder:(BuildContext _context, int i){
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;

          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(index,_suggestions[index]);
        });
  }
  // void _push_color() async{
  //   final result = await Navigator.of(context).push( // New lines from here ...
  //     MaterialPageRoute(
  //         builder: (context) => ColorPicker(_colorint)
  //     ),
  //   ); // ... to here
  //   setState(() {
  //     _color = prefs()
  //     color = result;
  //   });
  // }

  void _push_color() async{

    final SharedPreferences prefs = await _prefs;

    final int result = await Navigator.of(context).push( // New lines from here ...
      MaterialPageRoute(
          builder: (context) => ColorPicker(_colorint)
      ),
    ); // ... to here

    setState(() {
      _color = prefs.setInt("color", result).then((bool success) {
        return result;
      });

      _color.then((c){
        _colorint = c;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
          actions: [
            IconButton(icon: Icon(Icons.format_paint), onPressed: _push_color),
          ]
      ),
      body: _buildSuggestions(),
    );
  }


}

