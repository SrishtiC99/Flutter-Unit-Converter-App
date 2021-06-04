import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Unit Converter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Unit Converter"),
          elevation: 0.0,
        ),
        body: HelloRectangle(),
      ),
    );
  }
}

class HelloRectangle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        height: 200,
        width: 200,
        child: Center(
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

}
