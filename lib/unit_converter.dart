import 'package:flutter/material.dart';
import 'unit.dart';
class ConverterRoute extends StatelessWidget{
  final String categoryName;
  final Color color;
  final List<Unit> units;
  ConverterRoute(this.categoryName,this.color, this.units);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar:  AppBar(
          title: Text(categoryName,
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: color,
        ),
        body: ListView(
          children: units.map((Unit unit) {
            return Container(
              color: color,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    unit.name,
                    style: Theme.of(context).textTheme.headline,
                  ),
                  Text(
                    'Conversion: ${unit.conversion}',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            );
          }).toList()
        ),
      ),
    );
  }
  
}