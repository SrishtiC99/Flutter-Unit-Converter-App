import 'package:flutter/material.dart';
import 'package:flutter_udacity1/category.dart';
import 'package:flutter_udacity1/unit_converter.dart';

class CategoryRoute extends StatelessWidget{
  CategoryRoute();
  static const _categoryNames = <String>["Length",
  "Area", "Volume", "Mass", "Time", "Digital Storage", "Energy", "Currency"];

  static const _colors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    
    final listView = Container(
        child: ListView.builder(
          itemCount: _colors.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index){
              return Category(_categoryNames[index], _colors[index], Icons.cake);
            }
        )
    );

    final appBar = AppBar(
      title: Text("Unit Converter",
        style: TextStyle(fontSize: 30),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.blueGrey,
    );

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: appBar,
      body: listView,
    );
  }

}