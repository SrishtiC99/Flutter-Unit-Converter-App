import 'package:flutter/material.dart';
import 'unit.dart';
class ConverterRoute extends StatefulWidget{
  final String categoryName;
  final Color color;
  final List<Unit> units;
  ConverterRoute(this.categoryName,this.color, this.units);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar:  AppBar(
          title: Text(widget.categoryName,
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: widget.color,
        ),
        body: ListView(
          children: widget.units.map((Unit unit) {
            return Container(
              color: widget.color,
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