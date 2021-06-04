import 'package:flutter/material.dart';
import 'package:flutter_udacity1/category.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Unit Converter",
      home: Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text("Unit Converter"),
          elevation: 0.0,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(child: Category("Cake", Colors.green, Icons.cake)),
      ),
    );
  }
}
