import 'package:flutter/material.dart';

class Category extends StatelessWidget{
  final _widgetHeight = 100.0;
  final _iconSize = 60.0;
  final _textSize = 24.0;

  String categoryName;
  Color color;
  IconData iconData;
  Category(this.categoryName, this.color, this.iconData);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: _widgetHeight,
      child: InkWell(
        highlightColor: color,
        splashColor: color,
        onTap: () {
          print("I was tapped");
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