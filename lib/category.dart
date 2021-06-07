import 'package:flutter/material.dart';
import 'unit.dart';
import 'unit_converter.dart';

class Category extends StatelessWidget{
  final _widgetHeight = 100.0;
  final _iconSize = 60.0;
  final _textSize = 24.0;

  final String categoryName;
  final Color color;
  // Change this to a String path to the image asset
  final String iconData;
  final List<Unit> units;
  Category(this.categoryName, this.color, this.iconData, this.units);

  void _navigateToUnitConverter(BuildContext context){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>
          ConverterRoute(categoryName, color, units)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: _widgetHeight,
      child: InkWell(
        highlightColor: color,
        splashColor: color,
        onTap: () {
          _navigateToUnitConverter(context);
        },
        borderRadius: BorderRadius.circular(50),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(iconData),
            ),
            Text(
              categoryName,
            style: TextStyle(fontSize: _textSize),
            )
          ],
        ),
      ),
    );
  }
}