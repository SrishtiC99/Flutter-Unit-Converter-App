import 'package:flutter/material.dart';
import 'unit.dart';
import 'unit_converter.dart';

class Category extends StatelessWidget{
  final _widgetHeight = 100.0;
  final _iconSize = 60.0;
  final _textSize = 24.0;

  final String categoryName;
  final Color color;
  final IconData iconData;
  Category(this.categoryName, this.color, this.iconData);

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }


  void _navigateToUnitConverter(BuildContext context){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>
          ConverterRoute(categoryName, color, _retrieveUnitList(categoryName))
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
              child: Icon(
                iconData,
                size: _iconSize,
              ),
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