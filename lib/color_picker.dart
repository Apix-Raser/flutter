import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';


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
        body: Center(
          child: CircleColorPicker(
            controller: CircleColorPickerController(
              initialColor: Color(color),
            ),
            onChanged: (c) => color = c.value,
            size: const Size(240, 240),
            strokeWidth: 4,
            thumbSize: 36,
          ),
        ),


    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: Text('Color picker'),
  //         actions: [
  //           IconButton(icon: Icon(Icons.save), onPressed: _pop_color),
  //         ]
  //     ),
  //     body: Column(
  //         children: <Widget>[
  //           Text('A', style: TextStyle(color:Color(this.color))),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: <Widget>[
  //               GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     color = Colors.blue.value;
  //                   });
  //                 },
  //                 child:Container(
  //                   width: 50.0,
  //                   padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
  //                   color: Colors.blue,
  //                 ),
  //
  //               ),
  //
  //               GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     color = Colors.green.value;
  //                   });
  //                 },
  //                 child:Container(
  //                   width: 50.0,
  //                   padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
  //                   color: Colors.green,
  //                 ),
  //
  //               ),
  //
  //               GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     color = Colors.red.value;
  //                   });
  //                 },
  //                 child:Container(
  //                   width: 50.0,
  //                   padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
  //                   color: Colors.red,
  //                 ),
  //
  //               ),
  //
  //             ],
  //           )
  //         ]
  //     )
  //
  //   );
  // }

}