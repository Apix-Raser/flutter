import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var color =  TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(color),
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
   return Row(
     children: <Widget>[

       Text(this.i.toString(), style: color),
       Text(this.wordPair, style: const TextStyle(fontSize: 18)),
     ],
   );

  }
}

class RandomWords extends StatefulWidget {
  var color;
  RandomWords(this.color);
  @override
  _RandomWordsState createState() => _RandomWordsState(color);
}

class _RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair> [];
  final _biggerFont = const TextStyle(fontSize: 18);
  var color;
  _RandomWordsState(this.color);



  Widget _buildRow(int i, WordPair pair) {

    return ListTile(
      // On compose ici la ligne en deux pour avoir une couleur différente
      // entre le nombre et les mots
      title: NumberedWord(i, pair.asCamelCase, color),
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
  void _push_color() async{
    final result = await Navigator.of(context).push( // New lines from here ...
      MaterialPageRoute(
          builder: (context) => ColorPicker(color)
      ),
    ); // ... to here
    setState(() {
      color = result;
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

