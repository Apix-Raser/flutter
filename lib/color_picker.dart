import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sem4/main.dart';

class ColorPicker extends StatefulWidget {
  var color;
  ColorPicker(this.color);
  @override
  _ColorPickerState createState() => _ColorPickerState(this.color);

}

class _ColorPickerState extends State<ColorPicker>{
  var color;
  _ColorPickerState(this.color);

  void _pop_color() {
    Navigator.pop( context, color);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Color picker'),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: _pop_color),
          ]
      ),
      body: Column(
          children: <Widget>[
            Text('A', style: this.color),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = const TextStyle(color: Colors.blue);
                    });
                  },
                  child:Container(
                    width: 50.0,
                    padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    color: Colors.blue,
                  ),

                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = const TextStyle(color: Colors.green);
                    });
                  },
                  child:Container(
                    width: 50.0,
                    padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    color: Colors.green,
                  ),

                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      color = const TextStyle(color: Colors.red);
                    });
                  },
                  child:Container(
                    width: 50.0,
                    padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                    color: Colors.red,
                  ),

                ),

              ],
            )
          ]
      )

    );
  }

}